from fastapi import Depends
from sqlalchemy.orm import Session

from database import SessionLocal
from models import *


# Define the controller method to get the list of cities
def get_cities(country_id: int, db: Session = Depends(SessionLocal)):
    # Query the database for all the cities
    if(country_id == 0):
        cities = db.query(City).all()
        # Convert the city objects to dictionaries
        cities = [city.__dict__ for city in cities]
        # Return the list of cities
        return cities
    else:
        cities = db.query(City).filter(City.country_id_fk==country_id)
        cities = [city.__dict__ for city in cities]
        # Return the list of cities
        return cities
    
def get_city_by_id(city_id: int, db: Session = Depends(SessionLocal)):
    # Query the database for all the cities
    city = db.query(City).filter(City.id==city_id).all()
    print(city)
    # Return the list of cities
    return city[0].__dict__


# Define the controller method to get the list of lifestyles
# def get_lifestyles(db: Session = Depends(SessionLocal)):
#     # Query the database for all the cities
#     lifestyles = db.query(Lifestyle).all()
#     # Convert the lifestyle objects to dictionaries
#     lifestyles = [lifestyle.__dict__ for lifestyle in lifestyles]
#     # Return the list of lifestyles
#     return lifestyles


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

def get_subcategories_by_city_id_and_category_id(city_id:int,category_id: int = None, db: Session = Depends(SessionLocal)):
    # get the subcategories from the database
    result = db.query(Price).filter(Price.city_id_fk==city_id).join(SubCategory).filter(SubCategory.category_id_fk==category_id).all()
    sub_categories = db.query(SubCategory).filter(SubCategory.category_id_fk==category_id).all()
    sub_categories = [city.__dict__ for city in sub_categories]
    result = [city.__dict__ for city in result]
    for i in range(len(result)):
        result[i]['subcategory_id'] = sub_categories[i]['id']
        result[i]['subcategory_name'] = sub_categories[i]['subcategory_name']
    # return the subcategories as a list of dictionaries
    return result

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


'''
Methods to CRUD Lifestyle


def create_lifestyle(db: Session, lifestyle: Lifestyle):
    db_lifestyle = Lifestyle(**lifestyle.dict())
    db.add(db_lifestyle)
    db.commit()
    db.refresh(db_lifestyle)
    return db_lifestyle


def get_lifestyles(db: Session, skip: int = 0, limit: int = 10):
    return db.query(Lifestyle).offset(skip).limit(limit).all()


def get_lifestyle(db: Session, lifestyle_id: int):
    return db.query(Lifestyle).filter(Lifestyle.id == lifestyle_id).first()


def update_lifestyle(db: Session, lifestyle_id: int, lifestyle: Lifestyle):
    db_lifestyle = db.query(Lifestyle).filter(Lifestyle.id == lifestyle_id).first()
    if db_lifestyle:
        for key, value in lifestyle.dict().items():
            setattr(db_lifestyle, key, value)
        db.commit()
        db.refresh(db_lifestyle)
        return db_lifestyle


def delete_lifestyle(db: Session, lifestyle_id: int):
    db_lifestyle = db.query(Lifestyle).filter(Lifestyle.id == lifestyle_id).first()
    if db_lifestyle:
        db.delete(db_lifestyle)
        db.commit()
        return True
    return False

'''
