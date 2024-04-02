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
            