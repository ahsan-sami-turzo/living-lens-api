import os
from pathlib import Path

from dotenv import load_dotenv

env_path = Path('..') / '.env'
load_dotenv(dotenv_path=env_path)


class Settings:
    PROJECT_NAME: str = "LIVING LENS"
    PROJECT_VERSION: str = "1.0.0"
    POSTGRES_USER: str = os.getenv("PG_USER")
    POSTGRES_PASSWORD: str = os.getenv("PG_PASSWORD")
    POSTGRES_SERVER: str = os.getenv("PG_HOST")
    POSTGRES_PORT: str = os.getenv("PG_PORT")
    POSTGRES_DB: str = os.getenv("PG_DATABASE")
    DATABASE_URL: str = f"postgresql://{POSTGRES_USER}:{POSTGRES_PASSWORD}@{POSTGRES_SERVER}:{POSTGRES_PORT}/{POSTGRES_DB}"

    print(DATABASE_URL)


settings = Settings()
