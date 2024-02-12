from fastapi import APIRouter

from controller import *
from database import get_db, SessionLocal

router = APIRouter()


# @router.get("/db")
# def read_items():
#     return {"db": "living-lens"}


def get_data(model_type, db: Session = Depends(SessionLocal)):
    # Query the database for all relevant objects
    data = db.query(model_type).all()
    # Convert objects to dictionaries and return
    return [obj.__dict__ for obj in data]


# Usage in API endpoints:
@router.get("/api/get-cities")
def get_cities_api(db: Session = Depends(get_db)):
    return get_data(City, db)


@router.get("/api/get-lifestyles")
def get_lifestyles_api(db: Session = Depends(get_db)):
    return get_data(Lifestyle, db)


# API endpoint to retrieve prices based on city and lifestyle
@router.get("/api/get/prices/{city_id}/{lifestyle_id}")
async def get_prices_api(
        city_id: int, lifestyle_id: int, db: Session = Depends(get_db)
):
    prices = await get_prices(city_id, lifestyle_id, db)
    return prices
