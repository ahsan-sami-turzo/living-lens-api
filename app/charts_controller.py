# charts_controller.py
from sqlalchemy import func

from models import *


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
