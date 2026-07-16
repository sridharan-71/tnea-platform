import os
import pandas as pd

from config import OUTPUT_DIR


def save_csv(records, dataset, year):
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    filename = f"{dataset}_{year}.csv"
    filepath = os.path.join(OUTPUT_DIR, filename)

    df = pd.DataFrame(records)
    df.to_csv(filepath, index=False)

    print(f"Saved {len(df)} records to {filepath}")