from sqlalchemy.orm import Session

from models import *


# Define the controller method to get the list of cities
def get_cities(db: Session):
    # Query the database for all the cities
    cities = db.query(City).all()
    # Convert the city objects to dictionaries
    cities = [city.__dict__ for city in cities]
    # Return the list of cities
    return cities


# Define the controller method to get the list of lifestyles
def get_lifestyles(db: Session):
    # Query the database for all the cities
    lifestyles = db.query(Lifestyle).all()
    # Convert the lifestyle objects to dictionaries
    lifestyles = [lifestyle.__dict__ for lifestyle in lifestyles]
    # Return the list of lifestyles
    return lifestyles
