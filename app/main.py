from fastapi import FastAPI
from sqlalchemy import create_engine
from sqlalchemy.orm import Session

from api import router as api_router
from config import settings

app = FastAPI()

# Create the database engine
engine = create_engine(settings.DATABASE_URL)
session = Session(engine)

# Include the API endpoints from api.py
app.include_router(api_router)


@app.get("/")
def read_items():
    return {"project": "living-lens"}


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="127.0.0.1", port=8080)
