from fastapi import APIRouter, HTTPException, Depends
from app.api.models.house_rent_models import HouseRent
from app.api.controllers.house_rent_controller import get_house_rent_mongo, get_house_rent_postgres

router = APIRouter()


@router.get("/mongodb/{house_id}", response_model=HouseRent)
async def get_house_rent_from_mongodb(house_id: str):
    return await get_house_rent_mongo(house_id)


@router.get("/postgres/{house_id}", response_model=HouseRent)
async def get_house_rent_from_postgres(house_id: str):
    return await get_house_rent_postgres(house_id)
