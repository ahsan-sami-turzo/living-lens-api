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


def get_average_prices_by_country_and_categories(db, country_id, category_ids):
    # Query the average prices and calculate total for each city
    average_prices = (
        db.query(
            City.id,
            City.city_name,
            Category.id,
            Category.category_name,
            func.avg(Price.average_price).label("average_price"),
            func.sum(func.avg(Price.average_price)).over(partition_by=City.id).label("total"),
        )
        .join(Country, Country.id == City.country_id_fk)
        .join(Price, Price.city_id_fk == City.id)
        .join(Category, Category.id == Price.subcategory_id_fk)
        .filter(Country.id == country_id, Category.id.in_(category_ids))
        .group_by(City.id, City.city_name, Category.id, Category.category_name)
        .order_by(City.id, Category.id)
        .all()
    )

    # Convert the query result to the desired nested dictionary structure
    results = {
        "country_id": country_id,
        "cities": {},
    }
    for p in average_prices:
        city_id = p[0]
        city_name = p[1]
        category_id = p[2]
        category_name = p[3]
        average_price = p[4]
        total = p[5]

        if city_id not in results["cities"]:
            results["cities"][city_id] = {
                "city_name": city_name,
                "categories": {},
                "total": total,  # Add the total for the city
            }

        results["cities"][city_id]["categories"][category_id] = {
            "category_name": category_name,
            "average_price": average_price,
        }

    return results


def get_category_average_prices_as_percentages(db, city_id, category_ids):
    city = db.query(City).get(city_id)

    if not city:
        return []

    prices = db.query(Price).join(
        Category, Price.subcategory_id_fk == Category.id
    ).filter(
        Price.city_id_fk == city_id, Category.id.in_(category_ids)
    ).all()

    total_average_price = sum(price.average_price for price in prices) / len(prices) if prices else 0

    category_sums = {}
    category_counts = {}
    for price in prices:
        category_id = price.subcategory_id_fk
        category_sums[category_id] = category_sums.get(category_id, 0) + price.average_price
        category_counts[category_id] = category_counts.get(category_id, 0) + 1

    results = []
    for category_id, category_sum in category_sums.items():
        category_count = category_counts[category_id]
        category_average = category_sum / category_count
        category_percentage = round(category_average / total_average_price * 100, 2)
        category_name = (
            db.query(Category.category_name)
            .filter(Category.id == category_id)
            .scalar()
        )
        results.append(
            CategoryPrice(
                category_id=category_id,
                category_name=category_name,
                average_price_percentage=category_percentage,
            )
        )

    results.sort(key=lambda x: x.category_id)
    return results
