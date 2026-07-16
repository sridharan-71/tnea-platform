from dotenv import load_dotenv
import os
from pathlib import Path
from supabase import create_client

# Load .env from the project root
load_dotenv(Path(__file__).parent.parent / ".env")

SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_SERVICE_ROLE_KEY")

print("URL:", SUPABASE_URL)

supabase = create_client(SUPABASE_URL, SUPABASE_KEY)

print("✅ Connected to Supabase!")