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