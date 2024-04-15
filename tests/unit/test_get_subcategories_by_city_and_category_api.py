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