from sqlalchemy.orm import Session
from app.models.models import Category


def get_category(db: Session, category_id: int):
    return db.query(Category).filter(Category.id == category_id).first()


def get_categories(db: Session, skip: int = 0, limit: int = 100):
    return db.query(Category).offset(skip).limit(limit).all()


def create_category(db: Session, category_name: str):
    db_category = Category(category_name=category_name)
    db.add(db_category)
    db.commit()
    db.refresh(db_category)
    return db_category
