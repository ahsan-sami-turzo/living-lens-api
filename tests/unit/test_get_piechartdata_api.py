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