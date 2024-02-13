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


def get_categories(name: str = None, db: Session = Depends(SessionLocal)):
    # get the categories from the database
    if name:
        # filter by name if provided
        categories = db.query(Category).filter(Category.category_name == name).all()
    else:
        # otherwise get all categories
        categories = db.query(Category).all()
    # return the categories as a list of dictionaries
    return [{"id": c.id, "name": c.category_name} for c in categories]


def get_subcategories(category_id: int = None, db: Session = Depends(SessionLocal)):
    # get the subcategories from the database
    if category_id:
        # filter by category id if provided
        subcategories = db.query(SubCategory).filter(SubCategory.category_id_fk == category_id).all()
    else:
        # otherwise get all subcategories
        subcategories = db.query(SubCategory).all()
    # return the subcategories as a list of dictionaries
    return [{"id": s.id, "name": s.subcategory_name, "category_id": s.category_id_fk} for s in subcategories]


# get the countries from the database
def get_countries(name: str = None, db: Session = Depends(SessionLocal)):
    if name:
        # filter by name if provided
        countries = db.query(Country).filter(Country.country_name == name).all()
    else:
        # otherwise get all countries
        countries = db.query(Country).all()
    # return the countries as a list of dictionaries
    return [{"id": c.id, "name": c.country_name} for c in countries]
