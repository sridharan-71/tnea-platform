# Data Dictionary - Engineering College Admission Platform

**Version**: 1.0  
**Date**: July 2026  
**Database**: engineering_admissions  
**DBMS**: PostgreSQL 13+

---

## Table of Contents

1. [Core Tables](#core-tables)
2. [Geographic Tables](#geographic-tables)
3. [Branch & Accreditation Tables](#branch--accreditation-tables)
4. [Facility & Contact Tables](#facility--contact-tables)
5. [System Tables](#system-tables)
6. [Views](#views)
7. [Data Validation Rules](#data-validation-rules)

---

## Core Tables

### 1. counselling_systems

**Purpose**: Master table for different Indian engineering counselling systems (TNEA, JoSAA, KCET, etc.)

**Table Type**: Dimension Table  
**Record Count**: ~8 (one per counselling system)  
**Update Frequency**: Quarterly  
**Retention**: Permanent

| Column | Data Type | Null | Default | PK | FK | Unique | Index | Description |
|--------|-----------|------|---------|----|----|--------|-------|-------------|
| counselling_system_id | SERIAL | No | - | Yes | - | - | Yes | Unique system identifier |
| system_code | VARCHAR(20) | No | - | - | - | Yes | Yes | Code (TNEA, JOSAA, KCET, etc.) |
| system_name | VARCHAR(100) | No | - | - | - | - | - | Full system name |
| state | VARCHAR(50) | Yes | - | - | - | - | - | State/Region (e.g., 'Tamil Nadu') |
| country | VARCHAR(50) | No | 'India' | - | - | - | - | Country name |
| is_active | BOOLEAN | No | TRUE | - | - | - | Yes | Whether system is currently active |
| created_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Record creation timestamp |
| updated_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Last modification timestamp |

**Sample Data**:
```
counselling_system_id | system_code | system_name | state | country | is_active
1 | TNEA | Tamil Nadu Engineering Admissions | Tamil Nadu | India | true
2 | JOSAA | Joint Seat Allocation Authority | NULL | India | true
3 | KCET | Karnataka Common Entrance Test | Karnataka | India | true
```

**Relationships**:
- Referenced by: colleges (1:M)

---

### 2. colleges

**Purpose**: Core table storing college information, one record per college per counselling system

**Table Type**: Fact Table  
**Record Count**: ~649 (TNEA); will grow with new systems  
**Update Frequency**: Annually (with yearly counselling cycle)  
**Retention**: Permanent (with historical tracking)

| Column | Data Type | Null | Default | PK | FK | Unique | Index | Description |
|--------|-----------|------|---------|----|----|--------|-------|-------------|
| college_id | SERIAL | No | - | Yes | - | - | Yes | Unique college identifier |
| counselling_system_id | INTEGER | No | - | - | Yes | - | Yes | Reference to counselling system |
| college_code | VARCHAR(20) | No | - | - | - | - | Yes | Official college code from system |
| college_name | VARCHAR(255) | No | - | - | - | - | Yes | Official college name |
| principal_dean | VARCHAR(100) | Yes | - | - | - | - | - | Name of principal/dean |
| autonomous_status | BOOLEAN | No | FALSE | - | - | - | Yes | Whether college is autonomous |
| minority_status | BOOLEAN | No | FALSE | - | - | - | Yes | Whether college is minority institution |
| bank_name | VARCHAR(100) | Yes | - | - | - | - | - | Associated bank name |
| website | VARCHAR(255) | Yes | - | - | - | - | - | College website URL |
| email | VARCHAR(100) | Yes | - | - | - | - | - | Official email address |
| phone | VARCHAR(20) | Yes | - | - | - | - | - | Phone number |
| fax | VARCHAR(20) | Yes | - | - | - | - | - | Fax number |
| alternate_phone | VARCHAR(20) | Yes | - | - | - | - | - | Alternate contact number |
| address | TEXT | Yes | - | - | - | - | - | Full postal address |
| pincode | VARCHAR(10) | Yes | - | - | - | - | - | 6-digit postal code |
| district_id | INTEGER | Yes | - | - | Yes | - | Yes | Reference to district |
| taluk_id | INTEGER | Yes | - | - | Yes | - | - | Reference to taluk |
| distance_from_hq | DECIMAL(8,2) | Yes | - | - | - | - | - | Distance from HQ in kilometers |
| nearest_railway_station | VARCHAR(100) | Yes | - | - | - | - | - | Nearest railway station name |
| distance_from_railway | DECIMAL(8,2) | Yes | - | - | - | - | - | Distance from railway in kilometers |
| data_completeness | VARCHAR(20) | No | 'complete' | - | - | - | - | 'complete' or 'partial' |
| is_active | BOOLEAN | No | TRUE | - | - | - | Yes | Whether college is active |
| created_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Record creation timestamp |
| updated_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Last modification timestamp |

**Constraints**:
- UNIQUE (counselling_system_id, college_code)
- CHECK distance_from_hq >= 0
- CHECK distance_from_railway >= 0

**Relationships**:
- References: counselling_systems (M:1), districts (M:1), taluks (M:1)
- Referenced by: college_branches (1:M), hostel_facilities (1:M), college_facilities (1:M), college_contacts (1:M), college_images (1:M)

---

### 3. college_branches

**Purpose**: Junction table linking colleges to branches with branch-specific details

**Table Type**: Bridge Table  
**Record Count**: ~2,000 (estimated 3-4 branches per college)  
**Update Frequency**: Annually  
**Retention**: Permanent

| Column | Data Type | Null | Default | PK | FK | Unique | Index | Description |
|--------|-----------|------|---------|----|----|--------|-------|-------------|
| college_branch_id | SERIAL | No | - | Yes | - | - | Yes | Unique college-branch pair identifier |
| college_id | INTEGER | No | - | - | Yes | - | Yes | Reference to college |
| branch_id | INTEGER | No | - | - | Yes | - | Yes | Reference to branch master |
| intake | INTEGER | No | - | - | - | - | - | Annual intake capacity |
| year_started | INTEGER | Yes | - | - | - | - | - | Year branch was established |
| is_active | BOOLEAN | No | TRUE | - | - | - | Yes | Whether branch is currently active |
| created_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Record creation timestamp |
| updated_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Last modification timestamp |

**Constraints**:
- UNIQUE (college_id, branch_id)
- CHECK intake > 0
- CHECK year_started >= 1850 AND year_started <= current_year

**Relationships**:
- References: colleges (M:1), branch_masters (M:1)
- Referenced by: branch_accreditations (1:M)

---

## Geographic Tables

### 4. districts

**Purpose**: Master table for all districts across India

**Table Type**: Dimension Table  
**Record Count**: ~750 (all Indian districts)  
**Update Frequency**: Rarely (when new districts created)  
**Retention**: Permanent

| Column | Data Type | Null | Default | PK | FK | Unique | Index | Description |
|--------|-----------|------|---------|----|----|--------|-------|-------------|
| district_id | SERIAL | No | - | Yes | - | - | Yes | Unique district identifier |
| district_name | VARCHAR(100) | No | - | - | - | - | Yes | District name |
| state | VARCHAR(50) | No | - | - | - | - | - | State name |
| country | VARCHAR(50) | No | 'India' | - | - | - | - | Country name |
| is_active | BOOLEAN | No | TRUE | - | - | - | Yes | Whether district is active |
| created_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Record creation timestamp |

**Constraints**:
- UNIQUE (district_name, state)

**Relationships**:
- Referenced by: colleges (M:1), taluks (1:M)

---

### 5. taluks

**Purpose**: Master table for sub-district geographic divisions (taluks/blocks)

**Table Type**: Dimension Table  
**Record Count**: ~5,000 (all Indian taluks)  
**Update Frequency**: Rarely  
**Retention**: Permanent

| Column | Data Type | Null | Default | PK | FK | Unique | Index | Description |
|--------|-----------|------|---------|----|----|--------|-------|-------------|
| taluk_id | SERIAL | No | - | Yes | - | - | Yes | Unique taluk identifier |
| taluk_name | VARCHAR(100) | No | - | - | - | - | Yes | Taluk/block name |
| district_id | INTEGER | No | - | - | Yes | - | Yes | Reference to district |
| state | VARCHAR(50) | No | - | - | - | - | - | State name |
| created_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Record creation timestamp |

**Constraints**:
- UNIQUE (taluk_name, district_id)

**Relationships**:
- References: districts (M:1)
- Referenced by: colleges (M:1)

---

## Branch & Accreditation Tables

### 6. branch_masters

**Purpose**: Master table for all engineering branches, standardizing branch codes and names

**Table Type**: Dimension Table  
**Record Count**: ~38 (all unique branches)  
**Update Frequency**: Rarely (when new branches introduced)  
**Retention**: Permanent

| Column | Data Type | Null | Default | PK | FK | Unique | Index | Description |
|--------|-----------|------|---------|----|----|--------|-------|-------------|
| branch_id | SERIAL | No | - | Yes | - | - | Yes | Unique branch identifier |
| branch_code | VARCHAR(10) | No | - | - | - | Yes | Yes | Standard branch code (CS, CE, ME, etc.) |
| branch_name | VARCHAR(100) | No | - | - | - | - | - | Full branch name |
| category | VARCHAR(50) | Yes | - | - | - | - | Yes | Category (Core, Specialized) |
| description | TEXT | Yes | - | - | - | - | - | Detailed branch description |
| is_active | BOOLEAN | No | TRUE | - | - | - | Yes | Whether branch is active |
| created_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Record creation timestamp |

**Constraints**:
- UNIQUE (branch_code)

**Relationships**:
- Referenced by: college_branches (M:1)

---

### 7. branch_accreditations

**Purpose**: Tracks NBA and other accreditation details for branches with time-bound validity

**Table Type**: Fact Table  
**Record Count**: ~1,500 (multiple accreditations per branch)  
**Update Frequency**: Annually (accreditation renewal cycle)  
**Retention**: Permanent (historical tracking)

| Column | Data Type | Null | Default | PK | FK | Unique | Index | Description |
|--------|-----------|------|---------|----|----|--------|-------|-------------|
| accreditation_id | SERIAL | No | - | Yes | - | - | Yes | Unique accreditation record identifier |
| college_branch_id | INTEGER | No | - | - | Yes | - | Yes | Reference to college-branch pair |
| accreditation_type | VARCHAR(50) | No | - | - | - | - | Yes | Type (NBA, NAAC, ISO, etc.) |
| is_accredited | BOOLEAN | No | - | - | - | - | - | Current accreditation status |
| valid_from | DATE | Yes | - | - | - | - | - | Accreditation start date |
| valid_upto | DATE | Yes | - | - | - | - | Yes | Accreditation expiry date |
| accreditation_body | VARCHAR(100) | Yes | - | - | - | - | - | Accrediting body name |
| grade | VARCHAR(10) | Yes | - | - | - | - | - | Grade/Rating if applicable |
| created_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Record creation timestamp |
| updated_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Last modification timestamp |

**Constraints**:
- CHECK valid_from IS NULL OR valid_upto IS NULL OR valid_from <= valid_upto

**Relationships**:
- References: college_branches (M:1)

---

## Facility & Contact Tables

### 8. hostel_facilities

**Purpose**: Stores hostel accommodation details per college, normalized by gender

**Table Type**: Fact Table  
**Record Count**: ~1,300 (avg 2 per college: boys, girls)  
**Update Frequency**: Quarterly (charges may change)  
**Retention**: Permanent (with historical tracking)

| Column | Data Type | Null | Default | PK | FK | Unique | Index | Description |
|--------|-----------|------|---------|----|----|--------|-------|-------------|
| hostel_facility_id | SERIAL | No | - | Yes | - | - | Yes | Unique hostel facility identifier |
| college_id | INTEGER | No | - | - | Yes | - | Yes | Reference to college |
| gender | VARCHAR(10) | No | - | - | - | - | Yes | 'Boys', 'Girls', or 'Co-ed' |
| accommodation_available | BOOLEAN | No | - | - | - | - | Yes | Whether accommodation is available |
| accommodation_type | VARCHAR(50) | Yes | - | - | - | - | - | 'Permanent' or 'Rental' |
| mess_type | VARCHAR(50) | Yes | - | - | - | - | - | 'Veg', 'Non-Veg', or 'Both' |
| mess_bill_monthly | DECIMAL(10,2) | Yes | - | - | - | - | - | Monthly mess charges in INR |
| room_rent_monthly | DECIMAL(10,2) | Yes | - | - | - | - | - | Monthly room rent in INR |
| electricity_charges_monthly | DECIMAL(10,2) | Yes | - | - | - | - | - | Monthly electricity charges in INR |
| caution_deposit | DECIMAL(10,2) | Yes | - | - | - | - | - | Security deposit amount in INR |
| establishment_charges | DECIMAL(10,2) | Yes | - | - | - | - | - | One-time establishment charges in INR |
| admission_fees | DECIMAL(10,2) | Yes | - | - | - | - | - | One-time admission fees in INR |
| transport_facilities_available | BOOLEAN | No | FALSE | - | - | - | Yes | Whether transport is available |
| min_transport_charges | DECIMAL(10,2) | No | 0 | - | - | - | - | Minimum transport charges in INR |
| max_transport_charges | DECIMAL(10,2) | No | 0 | - | - | - | - | Maximum transport charges in INR |
| total_beds_available | INTEGER | Yes | - | - | - | - | - | Total beds available |
| occupancy_rate | DECIMAL(5,2) | Yes | - | - | - | - | - | Current occupancy percentage (0-100) |
| created_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Record creation timestamp |
| updated_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Last modification timestamp |

**Constraints**:
- UNIQUE (college_id, gender)
- CHECK gender IN ('Boys', 'Girls', 'Co-ed')
- CHECK accommodation_type IN ('Permanent', 'Rental') OR accommodation_type IS NULL
- CHECK mess_type IN ('Veg', 'Non-Veg', 'Both') OR mess_type IS NULL
- CHECK all monetary fields >= 0
- CHECK occupancy_rate BETWEEN 0 AND 100 OR occupancy_rate IS NULL

**Relationships**:
- References: colleges (M:1)

---

### 9. college_facilities

**Purpose**: Tracks general college facilities and amenities (library, labs, sports, etc.)

**Table Type**: Fact Table  
**Record Count**: ~3,000 (estimated 5-10 facilities per college)  
**Update Frequency**: Quarterly  
**Retention**: Permanent

| Column | Data Type | Null | Default | PK | FK | Unique | Index | Description |
|--------|-----------|------|---------|----|----|--------|-------|-------------|
| facility_id | SERIAL | No | - | Yes | - | - | Yes | Unique facility identifier |
| college_id | INTEGER | No | - | - | Yes | - | Yes | Reference to college |
| facility_name | VARCHAR(100) | No | - | - | - | - | - | Name of facility |
| facility_type | VARCHAR(50) | No | - | - | - | - | Yes | Category (Library, Lab, Sports, etc.) |
| description | TEXT | Yes | - | - | - | - | - | Detailed description |
| is_available | BOOLEAN | No | TRUE | - | - | - | Yes | Whether facility is available |
| created_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Record creation timestamp |

**Relationships**:
- References: colleges (M:1)

---

### 10. college_contacts

**Purpose**: Stores multiple contact persons and departments for a college

**Table Type**: Fact Table  
**Record Count**: ~2,000 (estimated 3-5 contacts per college)  
**Update Frequency**: Quarterly  
**Retention**: Permanent (with historical tracking)

| Column | Data Type | Null | Default | PK | FK | Unique | Index | Description |
|--------|-----------|------|---------|----|----|--------|-------|-------------|
| contact_id | SERIAL | No | - | Yes | - | - | Yes | Unique contact identifier |
| college_id | INTEGER | No | - | - | Yes | - | Yes | Reference to college |
| contact_type | VARCHAR(50) | No | - | - | - | - | Yes | Type (Principal, Dean, Admissions, etc.) |
| contact_name | VARCHAR(100) | No | - | - | - | - | - | Person's name |
| designation | VARCHAR(100) | Yes | - | - | - | - | - | Job designation |
| email | VARCHAR(100) | Yes | - | - | - | - | - | Email address |
| phone | VARCHAR(20) | Yes | - | - | - | - | - | Phone number |
| department | VARCHAR(100) | Yes | - | - | - | - | - | Department name |
| is_primary | BOOLEAN | No | FALSE | - | - | - | Yes | Whether this is primary contact |
| created_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Record creation timestamp |

**Relationships**:
- References: colleges (M:1)

---

### 11. college_images

**Purpose**: Stores references to college images (campus photos, facilities, etc.)

**Table Type**: Fact Table  
**Record Count**: ~3,000 (estimated 5-10 images per college)  
**Update Frequency**: Quarterly  
**Retention**: Permanent

| Column | Data Type | Null | Default | PK | FK | Unique | Index | Description |
|--------|-----------|------|---------|----|----|--------|-------|-------------|
| image_id | SERIAL | No | - | Yes | - | - | Yes | Unique image identifier |
| college_id | INTEGER | No | - | - | Yes | - | Yes | Reference to college |
| image_url | VARCHAR(500) | No | - | - | - | - | - | URL to image |
| image_type | VARCHAR(50) | Yes | - | - | - | - | Yes | Type (Campus, Facility, Hostel, etc.) |
| caption | VARCHAR(255) | Yes | - | - | - | - | - | Image caption |
| display_order | INTEGER | Yes | - | - | - | - | - | Order for display |
| is_active | BOOLEAN | No | TRUE | - | - | - | Yes | Whether image is active |
| created_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | - | Record creation timestamp |

**Relationships**:
- References: colleges (M:1)

---

## System Tables

### 12. college_audit

**Purpose**: Audit trail for tracking all changes to college data

**Table Type**: Audit Table  
**Record Count**: Grows continuously  
**Update Frequency**: Real-time (triggered by changes)  
**Retention**: Permanent (7-year retention recommended)

| Column | Data Type | Null | Default | PK | FK | Unique | Index | Description |
|--------|-----------|------|---------|----|----|--------|-------|-------------|
| audit_id | SERIAL | No | - | Yes | - | - | Yes | Unique audit record identifier |
| table_name | VARCHAR(50) | No | - | - | - | - | Yes | Name of modified table |
| record_id | INTEGER | No | - | - | - | - | Yes | ID of modified record |
| action | VARCHAR(10) | No | - | - | - | - | - | Action (INSERT, UPDATE, DELETE) |
| old_values | JSONB | Yes | - | - | - | - | - | Previous values (JSON format) |
| new_values | JSONB | Yes | - | - | - | - | - | New values (JSON format) |
| changed_by | VARCHAR(100) | Yes | - | - | - | - | - | User who made change |
| changed_at | TIMESTAMP | No | CURRENT_TIMESTAMP | - | - | - | Yes | Timestamp of change |

---

## Views

### v_colleges_with_details

**Purpose**: Comprehensive view showing colleges with aggregated details

**Columns**:
- college_id, college_code, college_name
- autonomous_status, minority_status
- district_name, taluk_name, system_name
- website, email, phone
- total_branches, accredited_branches, hostel_types_available

**Use Cases**: College search, filtering, comparison

---

### v_colleges_by_branch

**Purpose**: Lists all colleges offering each branch with details

**Columns**:
- branch_code, branch_name
- college_id, college_name, intake, year_started
- is_accredited, valid_upto, district_name

**Use Cases**: Branch-based search, intake analysis

---

### v_colleges_with_hostels

**Purpose**: Shows colleges with hostel details and monthly costs

**Columns**:
- college_id, college_name, gender
- accommodation_available, accommodation_type, mess_type
- mess_bill_monthly, room_rent_monthly, electricity_charges_monthly
- monthly_total, transport_facilities_available
- min_transport_charges, max_transport_charges, district_name

**Use Cases**: Hostel comparison, cost analysis

---

### mv_college_search_index

**Purpose**: Materialized view optimized for search operations

**Columns**:
- college_id, college_code, college_name
- autonomous_status, minority_status
- district_name, branch_codes, branch_names
- total_branches, has_hostel, system_name

**Refresh Frequency**: Daily  
**Use Cases**: Fast college search, autocomplete

---

## Data Validation Rules

### Email Validation
- Format: RFC 5322 compliant
- Example: `dean@college.edu`, `admissions@university.ac.in`

### Phone Validation
- Format: 10 digits (Indian standard)
- Format: +91-XXXXXXXXXX (with country code)
- Example: `9841244331`, `+91-9841244331`

### Pincode Validation
- Format: 6 digits (Indian postal code)
- Range: 100001 to 999999
- Example: `600025`, `560034`

### Year Validation
- Range: 1850 to current year
- Represents year branch was established

### Monetary Values
- All currency in Indian Rupees (INR)
- Precision: 2 decimal places
- Range: 0 to 9,999,999.99

### Percentage Values
- Range: 0 to 100
- Precision: 2 decimal places
- Used for: occupancy_rate

### Distance Values
- Unit: Kilometers (km)
- Precision: 2 decimal places
- Range: 0 to 9,999.99

---

## Data Quality Standards

### Completeness
- **Critical fields** (college_name, college_code): 100% required
- **Important fields** (district, branches): 95%+ target
- **Optional fields** (description, image_url): 50%+ target

### Accuracy
- College codes verified against official counselling system records
- Branch codes standardized against national curriculum
- Geographic data validated against official district/taluk lists

### Consistency
- No duplicate college codes per counselling system
- No duplicate college-branch pairs
- No duplicate college-gender hostel pairs
- Branch codes consistent across all colleges

### Timeliness
- Data updated within 7 days of official announcements
- Accreditation data updated within 30 days of changes
- Hostel charges updated quarterly

---

**End of Data Dictionary**

Document Version: 1.0  
Last Updated: July 2026  
Status: Ready for Use
