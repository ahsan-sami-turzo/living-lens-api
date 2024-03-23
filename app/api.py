from fastapi import APIRouter, HTTPException

from charts_controller import *
from controller import *
from database import get_db, SessionLocal
from pie_chart_controller import *

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
@router.get("/get-cities/{country_id}")
def get_cities_api(country_id: int ,db: Session = Depends(get_db)):
    cities =  get_cities(country_id, db)
    return cities

@router.get("/get-city-by-id/{city_id}")
def get_city_api(city_id: int ,db: Session = Depends(get_db)):
    city =  get_city_by_id(city_id, db)
    return city

@router.get("/get-subcategories-by-city-and-category/{city_id}/{category_id}")
def get_subcategories_by_city_id_and_category_id_api(city_id: int,category_id:int ,db: Session = Depends(get_db)):
    prices =  get_subcategories_by_city_id_and_category_id(city_id,category_id, db)
    return prices


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


@router.get("/get/bar-chart/categories/prices/{city_id}")
def get_categories_prices_by_city_api(city_id: int, db: Session = Depends(get_db)):
    categories = get_categories_prices_by_city(db, city_id)
    if categories is None:
        raise HTTPException(status_code=404, detail="City not found")
    return categories


@router.post("/get/bar-chart/prices/city/categories")
def get_prices_by_city_and_categories_api(request: CityCategoryPriceRequest, db: Session = Depends(get_db)):
    prices = get_prices_by_city_and_categories(db, request.city_id, request.category_ids)
    if prices is None:
        raise HTTPException(status_code=404, detail="City or categories not found")
    return prices


@router.post("/api/v1/get/bar-chart/prices/country/categories")
def get_average_prices_by_country_and_categories_api(request: CountryCategoryPriceRequest,
                                                     db: Session = Depends(get_db)):
    average_prices = get_average_prices_by_country_and_categories(db, request.country_id, request.category_ids)
    if average_prices is None:
        raise HTTPException(status_code=404, detail="Country or categories not found")
    return average_prices


@router.post("/api/v1/get/pie-chart/percentages/city/categories")
def get_category_average_prices_as_percentages_api(request: CityCategoryPriceRequest, db: Session = Depends(get_db)):
    average_prices = get_category_average_prices_as_percentages(db, request.city_id, request.category_ids)
    if average_prices is None:
        raise HTTPException(status_code=404, detail="Country or categories not found")
    return average_prices


@router.get("/get-piechartdata/{city_id}")
def get_avg_price_pct_piechart_data_api(city_id: int = None, db: Session = Depends(get_db)):
    prices_pct = get_avg_price_piechart(city_id, db)
    return prices_pct


@router.get("/get-barchartdata/{city_id}")
def get_avg_price_barchart_data_api(city_id: int = None, db: Session = Depends(get_db)):
    prices = get_avg_price_barchart(city_id, db)
    return prices



'''
APIs to CRUD lifestyles


@router.post("/lifestyles/")
def create_lifestyle(lifestyle: Lifestyle, db: Session = Depends(get_db)):
    return create_lifestyle(db=db, lifestyle=lifestyle)


@router.get("/lifestyles/")
def read_lifestyles(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    lifestyles = get_lifestyles(db, skip=skip, limit=limit)
    return lifestyles


@router.get("/lifestyles/{lifestyle_id}")
def read_lifestyle(lifestyle_id: int, db: Session = Depends(get_db)):
    db_lifestyle = get_lifestyle(db, lifestyle_id=lifestyle_id)
    if db_lifestyle is None:
        raise HTTPException(status_code=404, detail="Lifestyle not found")
    return db_lifestyle


@router.put("/lifestyles/{lifestyle_id}")
def update_lifestyle(lifestyle_id: int, lifestyle: Lifestyle, db: Session = Depends(get_db)):
    updated_lifestyle = update_lifestyle(db=db, lifestyle_id=lifestyle_id, lifestyle=lifestyle)
    if updated_lifestyle is None:
        raise HTTPException(status_code=404, detail="Lifestyle not found")
    return updated_lifestyle


@router.delete("/lifestyles/{lifestyle_id}")
def delete_lifestyle(lifestyle_id: int, db: Session = Depends(get_db)):
    deleted = delete_lifestyle(db=db, lifestyle_id=lifestyle_id)
    if not deleted:
        raise HTTPException(status_code=404, detail="Lifestyle not found")
    return {"message": "Lifestyle deleted successfully"}

'''
