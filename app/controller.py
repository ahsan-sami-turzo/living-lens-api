from fastapi import Depends
from sqlalchemy.orm import Session

from database import SessionLocal
from models import *


# Define the controller method to get the list of cities
def get_cities(db: Session = Depends(SessionLocal)):
    # Query the database for all the cities
    cities = db.query(City).all()
    # Convert the city objects to dictionaries
    cities = [city.__dict__ for city in cities]
    # Return the list of cities
    return cities


# Define the controller method to get the list of lifestyles
def get_lifestyles(db: Session = Depends(SessionLocal)):
    # Query the database for all the cities
    lifestyles = db.query(Lifestyle).all()
    # Convert the lifestyle objects to dictionaries
    lifestyles = [lifestyle.__dict__ for lifestyle in lifestyles]
    # Return the list of lifestyles
    return lifestyles


# Define the controller method to get the prices based on city and lifestyles
async def get_prices(city_id: int, lifestyle_id: int, db: Session = Depends(SessionLocal)):
    """Retrieves prices from the database."""

    prices = (
        db.query(Price, SubCategory.subcategory_name)  # Include SubCategory in the query
        .join(Lifestyle, Price.city_id_fk == Lifestyle.id)
        .join(SubCategory, Price.subcategory_id_fk == SubCategory.id)  # Join with SubCategory
        .filter(Price.city_id_fk == city_id)
        .filter(Lifestyle.id == lifestyle_id)
        .all()
    )

    return [
        {
            "subcategory_name": subcategory_name,
            "average_price": price.average_price,
            "min_price": price.min_price,
            "max_price": price.max_price,
        }
        for price, subcategory_name in prices
    ]
