# app/api/dependencies.py

from app.db.mongo_connection import get_mongo_client
from app.db.postgres_connection import get_postgres_session


def get_db():
    db = get_postgres_session()
    try:
        yield db
    finally:
        db.close()


async def get_async_db():
    db = get_mongo_client()
    try:
        yield db
    finally:
        db.close()
