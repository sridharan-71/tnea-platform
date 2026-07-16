import math

from api import get_page


def scrape_dataset(dataset: str, year: int):
    """
    Download all pages for a dataset/year.
    """

    print(f"\nDownloading {dataset} ({year})...")

    # First page
    response = get_page(dataset, year, 1)

    all_records = response["data"]

    total = response["total"]
    page_size = response["pageSize"]

    total_pages = math.ceil(total / page_size)

    print(f"Total records : {total}")
    print(f"Page size     : {page_size}")
    print(f"Total pages   : {total_pages}")

    # Remaining pages
    for page in range(2, total_pages + 1):
        print(f"Downloading page {page}/{total_pages}")

        response = get_page(dataset, year, page)

        all_records.extend(response["data"])

    print(f"\nFinished! Downloaded {len(all_records)} records.")

    return all_records