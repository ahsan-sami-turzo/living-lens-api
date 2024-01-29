# settings.py
from pydantic import BaseSettings


class Settings(BaseSettings):
    # PostgreSQL Database
    PG_USER: str
    PG_PASSWORD: str
    PG_DATABASE: str
    PG_HOST: str
    DATABASE_URL: str

    # MongoDB Database
    MONGO_URI: str

    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"


settings = Settings()


def MONGO_URI():
    return None