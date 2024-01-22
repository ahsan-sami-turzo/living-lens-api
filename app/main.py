from fastapi import FastAPI
from app.api.routers.house_rent_router import router as house_rent_router
from app.db.connection import session, engine, mongo_client, mongo_db, startup_db_client, shutdown_db_client

app = FastAPI()

app.include_router(house_rent_router, prefix="/house-rent", tags=["house_rent"])


@app.on_event("startup")
async def startup_db():
    await startup_db_client()


@app.on_event("shutdown")
async def shutdown_db():
    await shutdown_db_client()
