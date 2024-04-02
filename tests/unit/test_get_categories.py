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