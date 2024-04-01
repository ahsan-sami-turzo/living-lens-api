from fastapi import FastAPI
from fastapi.testclient import TestClient
from fastapi import Depends
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import Session, sessionmaker

from app import api
from app import models

app_test = FastAPI()
app_test.include_router(api.router)

client = TestClient(app_test)

# database_url = "postgresql://postgres:Aadhi1997*@localhost:5432/livinglens"

# engine = create_engine(database_url)
# session = Session(engine)
# SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)


# def get_db():
#     db = SessionLocal()
#     try:
#         yield db
#     finally:
#         db.close()

# db: Session = Depends(get_db)

def test_get_cities():
    country_ids = [1, 5, "*"]
    # till now 3 cities in each country so
    length = 3
    for country_id in country_ids:
        # Make a request to the API with the current country_id
        response = client.get(f"/get-cities/{country_id}")
        #Extract the JSON response
        data = response.json()
        # Check whether an integer is passed
        if isinstance(country_id, int):
             # Finding the length of the JSON response 
            length_res = len(data)
            # correct value of country_id is given. Till now only 3 countries in db
            if 1<= country_id <=3 :
                assert response.status_code == 200
                assert length_res == length
            # city_id is integer but not in the boundary
            else:
                # Assert the status code is 200 and the dictionary is empty
                assert response.status_code == 200
                #returns an empty list
                assert length_res == 0
        #not an integer - requests to input an integer
        else:
            assert response.status_code == 422
            

# def test_get_city():
#     city_id = 1
#     data1 = ["Berlin", 1]
#     data1.append(city_id)
#     response =  client.get(f"/get-city-by-id/{city_id}")
#     assert response.status_code == 200
#     data = response.json()
#     values_data = list(data.values())
#     assert len(data1) == len(values_data)
#     for value1, value2 in zip(data1, values_data):
#         assert value1 == value2
    
def test_get_city():
    # List of city_id values to test
    city_ids = [1, 't']
    # Data to check only the values for the first index in the list 'city_ids' here
    data1 = ["Berlin", 1]
    # data1 has to be updated with values to check for each city when correct city_id is given
    for city_id in city_ids:
        # Make a request to the API with the current city_id
        response = client.get(f"/get-city-by-id/{city_id}")
        #Extract the JSON response
        data = response.json()
        # Extract values from the JSON response
        values_data = list(data.values())
        # Check whether an integer is passed
        if isinstance(city_id, int):
            # correct value of city_id is given. Till now only 9 cities in db
            if 1<= city_id <=9 :
                assert response.status_code == 200
                data1_with_city_id = data1 + [city_id]
                assert len(data1_with_city_id) == len(values_data)
                for value1, value2 in zip(values_data, data1_with_city_id):
                    assert value1 == value2
            # city_id is integer but not in the boundary
            else:
                # Assert the status code is 200 and the dictionary is empty
                assert response.status_code == 200
                #returns an empty list
                assert len(values_data) == 0
        #not an integer - requests to input an integer
        else:
            assert response.status_code == 422

def test_get_subcategories_by_city_and_category():
    city_ids = [1, 2, 13, 'i']
    category_ids = [4, 20, 't']

    for city_id in city_ids:
        for category_id in category_ids:
            response = client.get(f"/get-subcategories-by-city-and-category/{city_id}/{category_id}")
            data = response.json()
            if isinstance(city_id, int) and isinstance(category_id, int):
                if 1 <= city_id <= 9 and 1 <= category_id <= 10:
                    assert response.status_code == 200
                    assert len(data) >= 1
                else:
                    assert response.status_code == 200
                    assert len(data) == 0
            else:
                assert response.status_code == 422

def test_get_subcategories():
    category_ids = [1, 5, 12, '$']

    for category_id in category_ids:
        response = client.get(f"/get-subcategories/{category_id}")
        data = response.json()
        if isinstance(category_id, int):
            if 1 <= category_id <= 10:
                assert response.status_code == 200
                assert len(data) >= 1
            else:
                assert response.status_code == 200
                assert len(data) == 0
        else:
            assert response.status_code == 422

def test_get_piechartdata():
    city_ids = [1, '$']

    for city_id in city_ids:
        response = client.get(f"/get-piechartdata/{city_id}")
        data = response.json()
        if isinstance(city_id, int):
            if 1 <= city_id <= 9:
                assert response.status_code == 200
                assert len(data) >= 1
            else:
                assert response.status_code == 200
                assert len(data) == 0
        else:
            assert response.status_code == 422
            
def test_get_barchartdata():
    city_ids = [5, '$']

    for city_id in city_ids:
        response = client.get(f"/get-barchartdata/{city_id}")
        data = response.json()
        if isinstance(city_id, int):
            if 1 <= city_id <= 9:
                assert response.status_code == 200
                assert len(data) >= 1
            else:
                assert response.status_code == 200
                assert len(data) == 0
        else:
            assert response.status_code == 422

def test_get_categories_prices_by_city_():
    city_ids = [1, 19, '$']

    for city_id in city_ids:
        response = client.get(f"/get/bar-chart/categories/prices/{city_id}")
        data = response.json()
        if isinstance(city_id, int):
            if 1 <= city_id <= 9:
                assert response.status_code == 200
                assert len(data) >= 1
            else:
                assert response.status_code == 200
                assert len(data) == 0
        else:
            assert response.status_code == 422

def test_get_countries():
    country_names = ["Finland", "Germany", "Sweden"]
    existing = ["Finland", "Germany", "Italy"]
    for country_name in country_names:
        response = client.get(f"/get-countries/?name={country_name}")
        data = response.json()
        if country_name in existing:
            assert response.status_code == 200 and len(data) == 1
        else:
            assert response.status_code == 200 and len(data) == 0

def test_get_categories():
    category_names = ["Transportation", "Utilities (Monthly)", "Groceries"]
    existing = ["Restaurants", "Markets", "Transportation", "Utilities (Monthly)", "Sports And Leisure", "Childcare", "Clothing And Shoes", "Rent Per Month",  "Buy Apartment Price", "Salaries And Financing"]
    for category_name in category_names:
        response = client.get(f"/get-categories/?name={category_name}")
        data = response.json()
        if category_name in existing:
            assert response.status_code == 200 and len(data) == 1
        else:
            assert response.status_code == 200 and len(data) == 0