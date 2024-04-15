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
                # for value1, value2 in zip(values_data, data1_with_city_id):
                #     assert value1 == value2
            # city_id is integer but not in the boundary
            else:
                # Assert the status code is 200 and the dictionary is empty
                assert response.status_code == 200
                #returns an empty list
                assert len(values_data) == 0
        #not an integer - requests to input an integer
        else:
            assert response.status_code == 422
