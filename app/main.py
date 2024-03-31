from fastapi import Depends, FastAPI
from sqlalchemy.orm import Session

from app.routers import category_router

#
# from api import router as api_router
# from config import settings
# from fastapi.middleware.cors import CORSMiddleware
#
app = FastAPI()

app.include_router(category_router.router)
#
# app.add_middleware(
#     CORSMiddleware,
#     allow_origins=["http://localhost:3001"],
#     allow_credentials=True,
#     allow_methods=["*"],
#     allow_headers=["*"],
# )
#
# # Create the database engine
# engine = create_engine(settings.DATABASE_URL)
# session = Session(engine)
#
# # Include the API endpoints from api.py
# app.include_router(api_router, prefix=settings.API_V1_STR)
#
#
# @app.get("/")
# def read_items():
#     return {"project": "living-lens"}
@app.get("/")
def read_root():
    return {"Hello": "Jynx"}


#
#
# if __name__ == "__main__":
#     import uvicorn
#
#     uvicorn.run(app, host="127.0.0.1", port=8080)

