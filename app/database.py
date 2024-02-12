import os
from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Define a base class for the database models
Base = declarative_base()

# Load the environment variables from the .env file
load_dotenv()

# Get the postgresql connection variables from environment variables
host = os.environ['PGHOST']
user = os.environ['PGUSER']
password = os.environ['PGPASSWORD']
port = os.environ['PGPORT']
database = os.environ['PGDATABASE']


# Create a function to get the database URL
def get_db_url():
    # Construct the database URL
    db_url = f"postgresql://{user}:{password}@{host}:{port}/{database}"
    return db_url


# Create a function to get the database engine
def get_engine():
    return create_engine(get_db_url())


# Create a function to get the database session class
def get_session_class(engine):
    return sessionmaker(autocommit=False, autoflush=False, bind=engine)


# Get the engine and session class
engine = get_engine()
SessionLocal = get_session_class(engine)


# Dependency to get a database session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
