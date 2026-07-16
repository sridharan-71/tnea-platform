from scraper import scrape_dataset
from exporter import save_csv


datasets = [
    "rank",
    "cutoff",
]

years = [
    2025,
    2024,
    2023,
]


for year in years:
    for dataset in datasets:

        records = scrape_dataset(
            dataset=dataset,
            year=year,
        )

        save_csv(
            records,
            dataset=dataset,
            year=year,
        )