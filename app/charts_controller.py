# charts_controller.py
from sqlalchemy import func

from models import *

'''
returns the average prices of all cateogries of a city
'''


def get_categories_prices_by_city(db, city_id):
    # Query the category ids, names and average prices for a given city
    categories = db.query(Category.id, Category.category_name, func.avg(Price.average_price).label("average_price")). \
        join(Price, Price.subcategory_id_fk == Category.id). \
        filter(Price.city_id_fk == city_id). \
        group_by(Category.id, Category.category_name). \
        order_by(Category.id). \
        all()
    # Convert the query result to a list of dictionaries
    categories = [{"id": c.id, "name": c.category_name, "average_price": c.average_price} for c in categories]
    return categories


'''
return a dictionary with prices for each category of a city
'''


def get_prices_by_city_and_categories(db, city_id, category_ids):
    # Query the min, max and average prices for a given city and categories
    prices = db.query(Category.id, Category.category_name, func.min(Price.min_price).label("min_price"),
                      func.max(Price.max_price).label("max_price"),
                      func.avg(Price.average_price).label("average_price")). \
        join(Price, Price.subcategory_id_fk == Category.id). \
        filter(Price.city_id_fk == city_id, Category.id.in_(category_ids)). \
        group_by(Category.id, Category.category_name). \
        order_by(Category.id). \
        all()
    # Convert the query result to a list of dictionaries
    prices = [{"id": p.id, "name": p.category_name, "min_price": p.min_price, "max_price": p.max_price,
               "average_price": p.average_price} for p in prices]
    return prices
