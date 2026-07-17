import os
import math
from pathlib import Path

import pandas as pd
from dotenv import load_dotenv
from supabase import create_client

# -----------------------------
# Configuration
# -----------------------------
BATCH_SIZE = 500
CSV_DIRECTORY = Path("data/csv")

# -----------------------------
# Supabase Client
# -----------------------------
load_dotenv()

supabase = create_client(
    os.getenv("SUPABASE_URL"),
    os.getenv("SUPABASE_SERVICE_ROLE_KEY"),
)


# -----------------------------
# Parse Filename
# -----------------------------
def parse_filename(csv_path):
    """
    Extract dataset, year, and table name from the CSV filename.

    Example:
        data/csv/cutoff_2025.csv

    Returns:
        {
            "dataset": "cutoff",
            "year": 2025,
            "table": "cutoff_data"
        }
    """

    path = Path(csv_path)

    dataset, year = path.stem.split("_")

    return {
        "dataset": dataset,
        "year": int(year),
        "table": f"{dataset}_data",
    }


# -----------------------------
# Discover CSV Files
# -----------------------------
def discover_csv_files(directory: Path) -> list[Path]:
    """
    Find all CSV files in the directory.

    Returns them sorted so uploads are deterministic.
    """

    return sorted(directory.glob("*.csv"))


# -----------------------------
# Load CSV
# -----------------------------
def load_dataframe(csv_path, year):
    """Load a CSV file and add the year column."""

    df = pd.read_csv(csv_path)
    df["year"] = year

    return df


# -----------------------------
# Clean Data
# -----------------------------
def clean_dataframe(df):
    """
    Convert data into a format suitable for Supabase.

    - NaN -> None
    - Float integers (5407.0) -> int (5407)
    - Real decimal values remain decimals
    """

    records = []

    for row in df.to_dict(orient="records"):
        cleaned = {}

        for key, value in row.items():

            if isinstance(value, float):

                if math.isnan(value):
                    cleaned[key] = None

                elif value.is_integer():
                    cleaned[key] = int(value)

                else:
                    cleaned[key] = value

            else:
                cleaned[key] = value

        records.append(cleaned)

    return records


# -----------------------------
# Upload
# -----------------------------
def upload_records(records, table_name):
    """Upload records to Supabase in batches."""

    total = len(records)

    for i in range(0, total, BATCH_SIZE):
        batch = records[i:i + BATCH_SIZE]

        supabase.table(table_name).insert(batch).execute()

        print(f"Uploaded {min(i + BATCH_SIZE, total)}/{total} rows")

    print(f"✅ {table_name} uploaded successfully!")


# -----------------------------
# Verify Upload
# -----------------------------
def verify_upload(table_name, year, expected_rows):
    """Verify the number of uploaded rows."""

    response = (
        supabase
        .table(table_name)
        .select("*", count="exact")
        .eq("year", year)
        .execute()
    )

    actual_rows = response.count

    print("\nVerification")
    print(f"Expected rows : {expected_rows}")
    print(f"Database rows : {actual_rows}")

    if actual_rows == expected_rows:
        print("✅ VERIFIED\n")
    else:
        print("❌ VERIFICATION FAILED\n")


# -----------------------------
# Upload DataFrame
# -----------------------------
def upload_dataframe(csv_path):
    """Upload a single CSV file."""

    info = parse_filename(csv_path)

    print(f"\nUploading {Path(csv_path).name}...")

    df = load_dataframe(csv_path, info["year"])
    records = clean_dataframe(df)

    upload_records(records, info["table"])

   


# -----------------------------
# Main
# -----------------------------
def main():
    csv_files = discover_csv_files(CSV_DIRECTORY)

    for csv_file in csv_files:
        upload_dataframe(csv_file)


if __name__ == "__main__":
    main()