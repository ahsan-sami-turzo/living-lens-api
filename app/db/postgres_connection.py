# app/db/postgres_connection.py
from sqlalchemy import create_engine
from sqlalchemy.orm import Session, sessionmaker
from sqlalchemy.pool import QueuePool
from app.settings import settings

engine = create_engine(settings.DATABASE_URL, poolclass=QueuePool, pool_size=10, max_overflow=20)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)


def get_postgres_session() -> Session:
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
