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