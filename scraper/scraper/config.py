import os
from dotenv import load_dotenv

load_dotenv()

# API
BASE_URL = "https://cutoff.tneaonline.org/api/cutoff"
PAGE_SIZE = 50

# Years to scrape
YEARS = [
    2025,
    2024,
    2023,
]

# Available datasets
DATASETS = [
    "rank",
    "cutoff",
]

# Secrets
TOKEN = os.getenv("TOKEN")

# Output
OUTPUT_DIR = "data/csv"