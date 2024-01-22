from fastapi import APIRouter, HTTPException
from app.db.connection import session, mongo_db
from app.api.models.house_rent_models import HouseRent

router = APIRouter()


@router.get("/house_rent_postgres")
async def get_house_rent_postgres():
    house_rent_data = session.query(HouseRent).all()
    if not house_rent_data:
        raise HTTPException(status_code=404, detail="No data found")
    return {"house_rent": [data.__dict__ for data in house_rent_data]}


@router.get("/house_rent_mongo")
async def get_house_rent_mongo():
    house_rent_data = mongo_db.house_rent.find()
    if not house_rent_data:
        raise HTTPException(status_code=404, detail="No data found")
    return {"house_rent": list(house_rent_data)}