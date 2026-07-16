import hashlib
import base64
import json

from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad


def decrypt_response(encrypted_response, key_input):
    """
    Decrypts the encrypted TNEA API response.

    Args:
        encrypted_response (dict): API response containing 'iv' and 'data'
        key_input (str): The value used to derive the AES key

    Returns:
        dict or list: Decrypted JSON
    """

    key = hashlib.sha256(
        ("tnea-portal-aes-2026-static" + key_input).encode()
    ).digest()

    iv = base64.b64decode(encrypted_response["iv"])
    ciphertext = base64.b64decode(encrypted_response["data"])

    cipher = AES.new(key, AES.MODE_CBC, iv)

    plaintext = unpad(
        cipher.decrypt(ciphertext),
        AES.block_size
    )

    return json.loads(plaintext.decode("utf-8"))