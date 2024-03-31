from sqlalchemy import Column, Integer, String, Float, ForeignKey
from sqlalchemy.orm import relationship
from app.database.database import Base


class Category(Base):
    __tablename__ = 'category'

    id = Column(Integer, primary_key=True)
    category_name = Column(String(50))

    subcategories = relationship("Subcategory", back_populates="category")


class City(Base):
    __tablename__ = 'city'

    id = Column(Integer, primary_key=True)
    city_name = Column(String(100))
    country_id_fk = Column(Integer, ForeignKey('country.id'))

    country = relationship("Country", back_populates="cities")
    prices = relationship("Price", back_populates="city")


class Country(Base):
    __tablename__ = 'country'

    id = Column(Integer, primary_key=True)
    country_name = Column(String(100))

    cities = relationship("City", back_populates="country")


class Price(Base):
    __tablename__ = 'price'

    id = Column(Integer, primary_key=True)
    city_id_fk = Column(Integer, ForeignKey('city.id'))
    subcategory_id_fk = Column(Integer, ForeignKey('subcategory.id'))
    average_price = Column(Float)
    min_price = Column(Float)
    max_price = Column(Float)

    city = relationship("City", back_populates="prices")
    subcategory = relationship("Subcategory", back_populates="prices")


class Subcategory(Base):
    __tablename__ = 'subcategory'

    id = Column(Integer, primary_key=True)
    subcategory_name = Column(String(100))
    category_id_fk = Column(Integer, ForeignKey('category.id'))

    category = relationship("Category", back_populates="subcategories")
    prices = relationship("Price", back_populates="subcategory")