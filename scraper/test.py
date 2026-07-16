import requests
import hashlib
import json
import base64

from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad

# Paste ONLY the token here (NOT the word "Bearer")
TOKEN = "5419be4e-881d-47d6-b42a-7de07c0b3a7a"
import hashlib
import json
import base64

from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad

# Paste ONLY the token here (NOT the word "Bearer")
TOKEN = "5419be4e-881d-47d6-b42a-7de07c0b3a7a"

url = "https://cutoff.tneaonline.org/api/cutoff?type=rank&year=2025&page=1&pageSize=50"

headers = {
    "Authorization": f"Bearer {TOKEN}"
}

response = requests.get(url, headers=headers)

print("Status Code:", response.status_code)

encrypted = response.json()

key = hashlib.sha256(
    ("tnea-portal-aes-2026-static" + TOKEN).encode()
).digest()

iv = base64.b64decode(encrypted["iv"])
ciphertext = base64.b64decode(encrypted["data"])

cipher = AES.new(key, AES.MODE_CBC, iv)

plaintext = unpad(cipher.decrypt(ciphertext), AES.block_size)

data = json.loads(plaintext.decode("utf-8"))

print("\nData Type:", type(data))

if isinstance(data, list):
    print("Records Found:", len(data))
    print("\nFirst Record:")
    print(json.dumps(data[0], indent=2))
else:
    print(json.dumps(data, indent=2))

url = "https://cutoff.tneaonline.org/api/cutoff?type=rank&year=2025&page=1&pageSize=50"

headers = {
    "Authorization": f"Bearer {TOKEN}"
}

response = requests.get(url, headers=headers)

print("Status Code:", response.status_code)

encrypted = response.json()

key = hashlib.sha256(
    ("tnea-portal-aes-2026-static" + TOKEN).encode()
).digest()

iv = base64.b64decode(encrypted["iv"])
ciphertext = base64.b64decode(encrypted["data"])

cipher = AES.new(key, AES.MODE_CBC, iv)

plaintext = unpad(cipher.decrypt(ciphertext), AES.block_size)

data = json.loads(plaintext.decode("utf-8"))

print("\nData Type:", type(data))

if isinstance(data, list):
    print("Records Found:", len(data))
    print("\nFirst Record:")
    print(json.dumps(data[0], indent=2))
else:
    print(json.dumps(data, indent=2))
