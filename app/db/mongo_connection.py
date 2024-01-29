# app/db/mongo_connection.py
from pymongo import MongoClient
from motor.motor_asyncio import AsyncIOMotorClient
from fastapi import Depends

from app.settings import MONGO_URI  # Ensure you have a settings file to load configuration

mongo_client = MongoClient(MONGO_URI, maxPoolSize=50, minPoolSize=10)
mongo_db = mongo_client.get_database()


async def get_mongo_client() -> AsyncIOMotorClient:
    try:
        yield mongo_client
    finally:
        mongo_client.close()
