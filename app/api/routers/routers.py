# app/api/routers/csv_loader_router.py
from pathlib import Path

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.api.controllers.csv_loader_controller import load_csv_data
from app.api.dependencies import get_db

router = APIRouter()


@router.post("/load-csv/{filename}")
async def load_csv_to_database(filename: str, db: Session = Depends(get_db)):
    try:
        csv_file_path = Path("data") / filename  # Assuming 'data' is the folder
        success_count, error_count = load_csv_data(db, csv_file_path)
        return {"success_count": success_count, "error_count": error_count}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
