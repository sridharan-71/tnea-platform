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
CSV_PATH = "data/csv/cutoff_2025.csv"
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
    Return all CSV files in the given directory in alphabetical order.
    """

    if not directory.exists():
        raise FileNotFoundError(f"Directory not found: {directory}")

    csv_files = sorted(directory.glob("*.csv"))

    if not csv_files:
        raise FileNotFoundError(f"No CSV files found in {directory}")

    return csv_files


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
    """Convert NaN values to None for Supabase."""

    records = []

    for row in df.to_dict(orient="records"):
        cleaned = {}

        for key, value in row.items():
            if isinstance(value, float) and math.isnan(value):
                cleaned[key] = None
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
# Upload DataFrame
# -----------------------------
def upload_dataframe(csv_path):
    """Upload a single CSV file to Supabase."""

    info = parse_filename(csv_path)

    df = load_dataframe(csv_path, info["year"])
    records = clean_dataframe(df)

    upload_records(records, info["table"])


# -----------------------------
# Main
# -----------------------------
def main():
    upload_dataframe(CSV_PATH)


if __name__ == "__main__":
    main()