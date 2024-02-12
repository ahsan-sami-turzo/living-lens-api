from fastapi import FastAPI, Depends, APIRouter
from controller import *
from database import get_db, SessionLocal

router = APIRouter()

# Create the FastAPI app
app = FastAPI()


# Define the api endpoint to get the list of cities
@app.get("/cities")
def get_cities_api(db: SessionLocal = Depends(get_db)):
    # Call the controller method to get the list of cities
    cities = get_cities(db)
    # Return the list of cities as a JSON response
    return {"cities": cities}


# Define the api endpoint to get the list of lifestyles
@app.get("/lifestyles")
def get_cities_api(db: SessionLocal = Depends(get_db)):
    # Call the controller method to get the list of cities
    lifestyles = get_lifestyles(db)
    # Return the list of cities as a JSON response
    return {"lifestyles": lifestyles}
