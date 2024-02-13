from fastapi import APIRouter

from controller import *
from database import get_db, SessionLocal

router = APIRouter()


@router.get("/")
def read_items():
    return {"project": "living-lens"}


def get_data(model_type, db: Session = Depends(SessionLocal)):
    # Query the database for all relevant objects
    data = db.query(model_type).all()
    # Convert objects to dictionaries and return
    return [obj.__dict__ for obj in data]


# Usage in API endpoints:
@router.get("/get-cities")
def get_cities_api(db: Session = Depends(get_db)):
    return get_data(City, db)


@router.get("/get-lifestyles")
def get_lifestyles_api(db: Session = Depends(get_db)):
    return get_data(Lifestyle, db)


# API endpoint to retrieve prices based on city and lifestyle
@router.get("/get-prices/{city_id}/{lifestyle_id}")
async def get_prices_api(
        city_id: int, lifestyle_id: int, db: Session = Depends(get_db)
):
    prices = await get_prices(city_id, lifestyle_id, db)
    return prices


'''
return a list of all the countries, such as “Finland”, “Germany”, “Sweden”
filter by country name using a query parameter: /countries?name=Finland
'''


@router.get("/get-countries/")
def get_countries_api(name: str = None, db: Session = Depends(get_db)):
    countries = get_countries(name, db)
    return countries


'''
return a list of all the categories 
filtering by category name: /categories?name=Restaurants.
'''


@router.get("/get-categories/")
def get_categories_api(name: str = None, db: Session = Depends(get_db)):
    categories = get_categories(name, db)
    return categories


'''
return a list of all the sub-categories 
filtering by category id: /subcategories/{category_id}
'''


@router.get("/get-subcategories/{category_id}")
def get_subcategories_api(category_id: int = None, db: Session = Depends(get_db)):
    categories = get_subcategories(category_id, db)
    return categories

# @router.get("/lifestyles")(get_lifestyles)
# @router.get("/cities")(get_cities)
# @router.get("/categories")(get_categories)
# @router.get("/subcategories")(get_subcategories)
# @router.get("/prices")(get_prices)
