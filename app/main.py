from fastapi import FastAPI
from app.api.routers.house_rent_router import router as house_rent_router
from app.db import connection

app = FastAPI()


@app.on_event("startup")
async def startup_db_client():
    await connection.startup_db_client()


@app.on_event("shutdown")
async def shutdown_db_client():
    await connection.shutdown_db_client()


@app.get("/")
def read_root():
    return {"Hello": "World"}


app.include_router(house_rent_router)
