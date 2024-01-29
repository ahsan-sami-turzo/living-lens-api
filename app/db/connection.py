import os
from sqlalchemy import create_engine
from sqlalchemy.orm import Session
from sqlalchemy.pool import QueuePool
from pymongo import MongoClient
from fastapi import FastAPI

app = FastAPI()

# PostgreSQL
PG_USER = os.getenv("PG_USER")
PG_PASSWORD = os.getenv("PG_PASSWORD")
PG_DATABASE = os.getenv("PG_DATABASE")
PG_HOST = os.getenv("PG_HOST")
DATABASE_URL = f"postgresql://{PG_USER}:{PG_PASSWORD}@{PG_HOST}/{PG_DATABASE}"
engine = None
session = None

# MongoDB
MONGO_URI = os.getenv("MONGO_URI")
MONGO_DBNAME = "living-lens"
mongo_client = None
mongo_db = None


@app.on_event("startup")
async def startup_db_client():
    global engine, session, mongo_client, mongo_db
    # PostgreSQL
    engine = create_engine(DATABASE_URL, poolclass=QueuePool, pool_size=10, max_overflow=20)
    session = Session(engine)
    # MongoDB
    mongo_client = MongoClient(MONGO_URI, maxPoolSize=50, minPoolSize=10)
    mongo_db = mongo_client[MONGO_DBNAME]


@app.on_event("shutdown")
async def shutdown_db_client():
    global engine, session, mongo_client, mongo_db
    # PostgreSQL
    session.close()
    engine.dispose()
    # MongoDB
    mongo_client.close()
