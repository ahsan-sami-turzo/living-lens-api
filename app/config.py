import os
# from pydantic_settings import BaseSettings

class Settings():
    POSTGRES_USER: str = os.getenv("POSTGRES_USER")
    POSTGRES_PASSWORD: str = os.getenv("POSTGRES_PASSWORD")
    POSTGRES_SERVER: str = os.getenv("POSTGRES_HOST")
    POSTGRES_PORT: str = os.getenv("POSTGRES_PORT")
    POSTGRES_DB: str = os.getenv("POSTGRES_DB")
    API_V1_STR: str = "/api/v1"
    PROJECT_NAME: str = "LIVING LENS"
    PROJECT_VERSION: str = "1.0.0"

    @property
    def DATABASE_URL(self) -> str:
        # Constructs the database URL using the current settings values.
        return f"postgresql://{self.POSTGRES_USER}:{self.POSTGRES_PASSWORD}@{self.POSTGRES_SERVER}:{self.POSTGRES_PORT}/{self.POSTGRES_DB}"

    class Config:
        # Configures the model to read from environment variables.
        env_file = None
        # env_file_encoding = 'utf-8'

settings = Settings()  # This will now correctly load environment variables at runtime.
print(settings.DATABASE_URL)
