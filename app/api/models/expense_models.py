# app/models.py
from sqlalchemy import Column, Integer, String, ForeignKey, DECIMAL
from sqlalchemy.orm import declarative_base

Base = declarative_base()


class City(Base):
    __tablename__ = 'City'

    CityID = Column(Integer, primary_key=True)
    CityName = Column(String(255), nullable=False)


class ExpenseCategory(Base):
    __tablename__ = 'ExpenseCategory'

    CategoryID = Column(Integer, primary_key=True)
    CategoryName = Column(String(255), nullable=False)


class Expense(Base):
    __tablename__ = 'Expense'

    ExpenseID = Column(Integer, primary_key=True)
    CityID = Column(Integer, ForeignKey('City.CityID'), nullable=False)
    CategoryID = Column(Integer, ForeignKey('ExpenseCategory.CategoryID'), nullable=False)
    MinCost = Column(DECIMAL(10, 2), nullable=False)
    MaxCost = Column(DECIMAL(10, 2), nullable=False)
    MedianCost = Column(DECIMAL(10, 2), nullable=False)
