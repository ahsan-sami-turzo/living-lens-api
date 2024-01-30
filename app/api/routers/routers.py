# app/api/routers/csv_loader_router.py
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.api.dependencies import get_db, get_async_db
from app.api.controllers.csv_loader_controller import load_csv_data

router = APIRouter()


class AsyncIOMotorClient:
    pass


@router.post("/load-csv/{filename}")
async def load_csv_to_database(filename: str, db: Session = Depends(get_db)):
    try:
        success_count, error_count = load_csv_data(db, filename)
        return {"success_count": success_count, "error_count": error_count}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
