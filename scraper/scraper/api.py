import requests

from config import BASE_URL, PAGE_SIZE, TOKEN
from auth import get_headers
from crypto import decrypt_response


def get_page(dataset: str, year: int, page: int):
    """
    Downloads and decrypts one page from the TNEA API.
    """

    params = {
        "type": dataset,
        "year": year,
        "page": page,
        "pageSize": PAGE_SIZE,
    }

    response = requests.get(
        BASE_URL,
        headers=get_headers(),
        params=params,
        timeout=30,
    )

    response.raise_for_status()

    encrypted = response.json()

    return decrypt_response(encrypted, TOKEN)