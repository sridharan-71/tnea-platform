
import os
import json
from dotenv import load_dotenv
from supabase import create_client, Client

# Load environment variables from .env file
load_dotenv()

# Supabase connection details from environment variables
SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_SERVICE_ROLE_KEY = os.getenv("SUPABASE_SERVICE_ROLE_KEY")

# Initialize Supabase client
supabase: Client = create_client(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY)

# --- Helper Functions ---

def convert_value(value, target_type):
    """Converts a value to the target_type, handling specific cases like 'Yes'/'No' and empty strings."""
    if value is None or (isinstance(value, str) and value.strip() in ["", ".", "X", "-"]):
        return None

    if target_type == bool:
        if isinstance(value, str):
            if value.lower() == 'yes':
                return True
            elif value.lower() == 'no':
                return False
        # Attempt to convert other truthy/falsy values to boolean
        return bool(value)
    elif target_type == int:
        try:
            # Handle cases like "60.0" by converting to float first, then int
            return int(float(value))
        except (ValueError, TypeError):
            return None
    elif target_type == float:
        try:
            return float(value)
        except (ValueError, TypeError):
            return None
    elif target_type == str:
        return str(value).strip()
    elif target_type == 'date_year': # For 'YYYY' format years to 'YYYY-01-01'
        try:
            return f"{int(value)}-01-01" if value else None
        except (ValueError, TypeError):
            return None
    return value

async def get_or_create_id(table_name, unique_column_name, unique_value, insert_data, on_conflict_columns):
    """Fetches the ID of an existing record or creates a new one if it doesn't exist.
    Uses Supabase upsert with on_conflict to handle uniqueness.
    Returns the ID of the record.
    """
    if unique_value is None:
        return None

    # Supabase upsert handles both insert and update/conflict resolution
    # It returns the inserted/updated row(s)
    response = supabase.table(table_name).upsert(insert_data, on_conflict=on_conflict_columns).execute()
    
    if response.data:
        return response.data[0][f'{table_name}_id'] # Assuming primary key is table_name_id
    else:
        print(f"Error in get_or_create_id for {table_name} with {unique_column_name}={unique_value}: {response.status_code} - {response.content}")
        return None

async def get_or_create_district(district_name):
    """Gets or creates a district and returns its ID."""
    if not district_name:
        return None
    district_name_upper = district_name.strip().upper()
    insert_data = {
        'district_name': district_name_upper,
        'state': 'Tamil Nadu' # Assuming default state
    }
    # Unique constraint on (district_name, state)
    response = supabase.table('districts').upsert(insert_data, on_conflict='district_name,state').execute()
    if response.data:
        return response.data[0]['district_id']
    else:
        print(f"Error getting or creating district {district_name}: {response.status_code} - {response.content}")
        return None

async def get_or_create_taluk(taluk_name, district_id):
    """Gets or creates a taluk and returns its ID."""
    if not taluk_name or not district_id:
        return None
    taluk_name_upper = taluk_name.strip().upper()
    insert_data = {
        'taluk_name': taluk_name_upper,
        'district_id': district_id,
        'state': 'Tamil Nadu' # Assuming default state
    }
    # Unique constraint on (taluk_name, district_id)
    response = supabase.table('taluks').upsert(insert_data, on_conflict='taluk_name,district_id').execute()
    if response.data:
        return response.data[0]['taluk_id']
    else:
        print(f"Error getting or creating taluk {taluk_name} for district {district_id}: {response.status_code} - {response.content}")
        return None

async def get_or_create_branch_master(branch_code):
    """Gets or creates a branch master and returns its ID."""
    if not branch_code:
        return None
    branch_code_upper = branch_code.strip().upper()
    insert_data = {
        'branch_code': branch_code_upper,
        'branch_name': f'Branch {branch_code_upper}' # Default name if not available
    }
    # Unique constraint on branch_code
    response = supabase.table('branch_masters').upsert(insert_data, on_conflict='branch_code').execute()
    if response.data:
        return response.data[0]['branch_id']
    else:
        print(f"Error getting or creating branch master {branch_code}: {response.status_code} - {response.content}")
        return None

async def get_or_create_counselling_system(system_code='DEFAULT', system_name='Default Counselling System'):
    """Gets or creates a default counselling system and returns its ID."""
    insert_data = {
        'system_code': system_code,
        'system_name': system_name,
        'state': 'Tamil Nadu' # Assuming default state
    }
    # Unique constraint on system_code
    response = supabase.table('counselling_systems').upsert(insert_data, on_conflict='system_code').execute()
    if response.data:
        return response.data[0]['counselling_system_id']
    else:
        print(f"Error getting or creating counselling system {system_code}: {response.status_code} - {response.content}")
        return None

async def import_colleges_data(json_data):
    """Imports college data from JSON into the Supabase database."""
    total_colleges = len(json_data)
    print(f"Starting import of {total_colleges} colleges...")

    # Ensure default counselling system exists once
    default_counselling_system_id = await get_or_create_counselling_system()
    if not default_counselling_system_id:
        print("Failed to get or create default counselling system. Aborting import.")
        return

    for i, college_data in enumerate(json_data):
        college_code = convert_value(college_data.get('college_code'), str)
        college_name = convert_value(college_data.get('college_name'), str)

        if not college_code or not college_name:
            print(f"Skipping college at index {i} due to missing college_code or college_name.")
            continue

        print(f"Importing college {i + 1}/{total_colleges}: {college_name} ({college_code})")

        try:
            # --- 1. Handle District and Taluk ---
            district_id = None
            taluk_id = None
            
            district_name_raw = college_data.get('district')
            taluk_name_raw = college_data.get('taluk')

            if district_name_raw:
                district_id = await get_or_create_district(district_name_raw)
                if taluk_name_raw and district_id:
                    taluk_id = await get_or_create_taluk(taluk_name_raw, district_id)
            
            # --- 2. Insert/Upsert College ---
            college_payload = {
                'counselling_system_id': default_counselling_system_id,
                'college_code': college_code,
                'college_name': college_name,
                'principal_dean': convert_value(college_data.get('principal_dean'), str),
                'autonomous_status': convert_value(college_data.get('autonomous_status'), bool),
                'minority_status': convert_value(college_data.get('minority_status'), bool),
                'bank_name': convert_value(college_data.get('bank_name'), str),
                'website': convert_value(college_data.get('website'), str),
                'email': convert_value(college_data.get('email'), str),
                'phone': convert_value(college_data.get('phone_fax'), str), # Assuming phone_fax is phone
                'fax': None, # Fax not explicitly in JSON
                'alternate_phone': convert_value(college_data.get('antiphone'), str),
                'address': convert_value(college_data.get('address'), str),
                'pincode': convert_value(college_data.get('pincode'), str),
                'district_id': district_id,
                'taluk_id': taluk_id,
                'distance_from_hq': convert_value(college_data.get('dist_from_hq'), float),
                'nearest_railway_station': convert_value(college_data.get('nearest_railway'), str),
                'distance_from_railway': convert_value(college_data.get('dist_from_railway'), float),
            }
            # Remove None values to let Supabase use default values or ignore
            college_payload = {k: v for k, v in college_payload.items() if v is not None}

            college_response = supabase.table('colleges').upsert(college_payload, on_conflict='counselling_system_id,college_code').execute()
            
            if not college_response.data:
                raise Exception(f"Failed to upsert college {college_code}: {college_response.status_code} - {college_response.content}")
            
            college_id = college_response.data[0]['college_id']
            print(f"  College {college_code} upserted with ID: {college_id}")

            # --- 3. Handle Branches and Accreditations ---
            for branch in college_data.get('branches', []):
                branch_code = convert_value(branch.get('branch_code'), str)
                if not branch_code:
                    print(f"    Skipping branch due to missing branch_code for college {college_code}.")
                    continue

                branch_master_id = await get_or_create_branch_master(branch_code)
                if not branch_master_id:
                    print(f"    Could not get or create branch master for code {branch_code}. Skipping branch for college {college_code}.")
                    continue

                college_branch_payload = {
                    'college_id': college_id,
                    'branch_id': branch_master_id,
                    'intake': convert_value(branch.get('intake'), int),
                    'year_started': convert_value(branch.get('year_started'), int),
                }
                college_branch_payload = {k: v for k, v in college_branch_payload.items() if v is not None}

                college_branch_response = supabase.table('college_branches').upsert(college_branch_payload, on_conflict='college_id,branch_id').execute()
                
                if not college_branch_response.data:
                    print(f"    Failed to upsert college branch {branch_code} for college {college_code}: {college_branch_response.status_code} - {college_branch_response.content}")
                    continue
                
                college_branch_id = college_branch_response.data[0]['college_branch_id']
                print(f"    Branch {branch_code} for college {college_code} upserted with ID: {college_branch_id}")

                # Handle Branch Accreditations
                nba_accredited = convert_value(branch.get('nba_accredited'), bool)
                if nba_accredited is not None:
                    accreditation_payload = {
                        'college_branch_id': college_branch_id,
                        'accreditation_type': 'NBA',
                        'is_accredited': nba_accredited,
                        'valid_upto': convert_value(branch.get('nba_valid_upto'), 'date_year'),
                        'accreditation_body': 'National Board of Accreditation' # Default body
                    }
                    accreditation_payload = {k: v for k, v in accreditation_payload.items() if v is not None}

                    # For branch_accreditations, we'll check for existence before inserting
                    # as there isn't a simple unique constraint for upsert on all relevant fields
                    existing_accreditation_response = supabase.table('branch_accreditations').select('accreditation_id').eq('college_branch_id', college_branch_id).eq('accreditation_type', 'NBA').execute()
                    
                    if existing_accreditation_response.data:
                        accreditation_id = existing_accreditation_response.data[0]['accreditation_id']
                        print(f"      NBA Accreditation for branch {branch_code} already exists. Updating.")
                        update_response = supabase.table('branch_accreditations').update(accreditation_payload).eq('accreditation_id', accreditation_id).execute()
                        if not update_response.data:
                            print(f"      Failed to update NBA Accreditation for branch {branch_code}: {update_response.status_code} - {update_response.content}")
                    else:
                        insert_response = supabase.table('branch_accreditations').insert(accreditation_payload).execute()
                        if insert_response.data:
                            print(f"      Inserted NBA Accreditation for branch {branch_code}.")
                        else:
                            print(f"      Failed to insert NBA Accreditation for branch {branch_code}: {insert_response.status_code} - {insert_response.content}")

            # --- 4. Handle Hostel Facilities ---
            hostel_details = college_data.get('hostel_details', {})
            if hostel_details:
                # Boys Hostel
                accommodation_boys = convert_value(hostel_details.get('accommodation_available_boys'), bool)
                if accommodation_boys is not None:
                    hostel_boys_payload = {
                        'college_id': college_id,
                        'gender': 'Boys',
                        'accommodation_available': accommodation_boys,
                        'accommodation_type': convert_value(hostel_details.get('permanent_or_rental_boys'), str),
                        'mess_type': convert_value(hostel_details.get('type_of_mess_boys'), str),
                        'mess_bill_monthly': convert_value(hostel_details.get('mess_bill_boys'), float),
                        'room_rent_monthly': convert_value(hostel_details.get('room_rent_boys'), float),
                        'electricity_charges_monthly': convert_value(hostel_details.get('electricity_charges_boys'), float),
                        'caution_deposit': convert_value(hostel_details.get('caution_deposit'), float),
                        'establishment_charges': convert_value(hostel_details.get('establishment_charges'), float),
                        'admission_fees': convert_value(hostel_details.get('admission_fees'), float),
                        'transport_facilities_available': convert_value(hostel_details.get('transport_facilities'), bool),
                        'min_transport_charges': convert_value(hostel_details.get('min_transport_charges'), float),
                        'max_transport_charges': convert_value(hostel_details.get('max_transport_charges'), float),
                    }
                    hostel_boys_payload = {k: v for k, v in hostel_boys_payload.items() if v is not None}

                    hostel_boys_response = supabase.table('hostel_facilities').upsert(hostel_boys_payload, on_conflict='college_id,gender').execute()
                    if hostel_boys_response.data:
                        print(f"    Boys hostel facility for college {college_code} upserted.")
                    else:
                        print(f"    Failed to upsert Boys hostel facility for college {college_code}: {hostel_boys_response.status_code} - {hostel_boys_response.content}")

                # Girls Hostel
                accommodation_girls = convert_value(hostel_details.get('accommodation_available_girls'), bool)
                if accommodation_girls is not None:
                    hostel_girls_payload = {
                        'college_id': college_id,
                        'gender': 'Girls',
                        'accommodation_available': accommodation_girls,
                        'accommodation_type': convert_value(hostel_details.get('permanent_or_rental_girls'), str),
                        'mess_type': convert_value(hostel_details.get('type_of_mess_girls'), str),
                        'mess_bill_monthly': convert_value(hostel_details.get('mess_bill_girls'), float),
                        'room_rent_monthly': convert_value(hostel_details.get('room_rent_girls'), float),
                        'electricity_charges_monthly': convert_value(hostel_details.get('electricity_charges_girls'), float),
                        'caution_deposit': convert_value(hostel_details.get('caution_deposit'), float),
                        'establishment_charges': convert_value(hostel_details.get('establishment_charges'), float),
                        'admission_fees': convert_value(hostel_details.get('admission_fees'), float),
                        'transport_facilities_available': convert_value(hostel_details.get('transport_facilities'), bool),
                        'min_transport_charges': convert_value(hostel_details.get('min_transport_charges'), float),
                        'max_transport_charges': convert_value(hostel_details.get('max_transport_charges'), float),
                    }
                    hostel_girls_payload = {k: v for k, v in hostel_girls_payload.items() if v is not None}

                    hostel_girls_response = supabase.table('hostel_facilities').upsert(hostel_girls_payload, on_conflict='college_id,gender').execute()
                    if hostel_girls_response.data:
                        print(f"    Girls hostel facility for college {college_code} upserted.")
                    else:
                        print(f"    Failed to upsert Girls hostel facility for college {college_code}: {hostel_girls_response.status_code} - {hostel_girls_response.content}")

        except Exception as e:
            print(f"  Error importing college {college_code}: {e}")

    print("Finished successfully.")

async def main():
    if not SUPABASE_URL or not SUPABASE_SERVICE_ROLE_KEY:
        print("Error: SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY environment variables are not set.")
        return

    try:
        # Load JSON data
        # Corrected path based on user feedback
        json_file_path = 'data/json/colleges.json'
        if not os.path.exists(json_file_path):
            print(f"Error: JSON file not found at {json_file_path}. Please ensure it's in the correct path.")
            return

        with open(json_file_path, 'r', encoding='utf-8') as f:
            colleges_data = json.load(f)

        await import_colleges_data(colleges_data)

    except FileNotFoundError:
        print("Error: colleges.json not found. Please ensure it's in the correct path.")
    except json.JSONDecodeError:
        print("Error: Could not decode colleges.json. Please check if it's valid JSON.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    import asyncio
    asyncio.run(main())
