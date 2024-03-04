from fastapi import Depends
from sqlalchemy import text
from sqlalchemy.orm import Session

from database import SessionLocal


## Retrieves prices from the database for pie charts
def get_avg_price_piechart(city_id: int = None, db: Session = Depends(SessionLocal)):
    if (city_id == ''): 'get_avg_price_piechart error: city_id parameter is mandatory'
    if (city_id < 1 or 9 < city_id): 'get_avg_price_piechart error: city_id parameter value is incorrect'

    SQL = text(''' select sum(average_price), category_name  from public.price
                inner join subcategory on  price.subcategory_id_fk = public.subcategory.id 
                and public.subcategory.subcategory_name <> 'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)'
                and public.subcategory.subcategory_name  <> 'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)'
                and public.subcategory.subcategory_name <> 'International Primary School, Yearly for 1 Child'
                inner join category  on public.subcategory.category_id_fk = category.id 
                where price.city_id_fk = ''' + str(city_id) + ''' 
                and category_name <> 'Salaries And Financing' 
                and category_name <> 'Rent Per Month'
                and category_name <> 'Buy Apartment Price'
                group by category_name  '''
               )
    res = db.execute(SQL)
    ## prices
    utilities_price = 0
    childcare_price = 0
    restaurants_price = 0
    clothing_price = 0
    transportation_price = 0
    sum = 0

    for row in res:
        if (row[1] == "Utilities (Monthly)"):
            utilities_price = row[0]
        elif (row[1] == "Childcare"):
            childcare_price = row[0]
        elif (row[1] == "Restaurants"):
            restaurants_price = row[0]
        elif (row[1] == "Clothing And Shoes"):
            clothing_price = row[0]
        elif (row[1] == "Transportation"):
            transportation_price = row[0]

        sum = sum + row[0]

    ## percentages (pct)
    utilities_pct = round(utilities_price / sum * 100, 2)
    childcare_pct = round(childcare_price / sum * 100, 2)
    restaurants_pct = round(restaurants_price / sum * 100, 2)
    clothing_price_pct = round(clothing_price / sum * 100, 2)
    transportation_pct = round(transportation_price / sum * 100, 2)

    return [{
        "Utilities": utilities_pct,
        "Childcare": childcare_pct,
        "Restaurants": restaurants_pct,
        "Clothing": clothing_price_pct,
        "Transportation": transportation_pct
    }]


## Retrieves prices from the database for pie charts
def get_avg_price_barchart(city_id: int = None, db: Session = Depends(SessionLocal)):
    if (city_id == ''): 'get_avg_price_barchart error: city_id parameter is mandatory'
    if (city_id < 1 or 9 < city_id): 'get_avg_price_barchart error: city_id parameter value is incorrect'

    SQL = text ('''select sum(average_price), category_name  from public.price
                    inner join subcategory on  price.subcategory_id_fk = public.subcategory.id 
                    and public.subcategory.subcategory_name <> 'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)'
                    and public.subcategory.subcategory_name  <> 'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)'
                    and public.subcategory.subcategory_name <> 'International Primary School, Yearly for 1 Child'
                    inner join category  on public.subcategory.category_id_fk = category.id 
                    where price.city_id_fk =  ''' + str(city_id) + '''
                    and category_name <> 'Salaries And Financing' 
                    and category_name <> 'Rent Per Month'
                    and category_name <> 'Buy Apartment Price'
                    group by category_name'''
    )

    res = db.execute(SQL)
    ## prices
    utilities_price = 0
    childcare_price = 0
    restaurants_price = 0
    clothing_price = 0
    transportation_price = 0
    sum = 0

    for row in res:
        if (row[1] == "Utilities (Monthly)"):
            utilities_price = row[0]
        elif (row[1] == "Childcare"):
            childcare_price = row[0]
        elif (row[1] == "Restaurants"):
            restaurants_price = row[0]
        elif (row[1] == "Clothing And Shoes"):
            clothing_price = row[0]
        elif (row[1] == "Transportation"):
            transportation_price = row[0]

        sum = sum + row[0]

    return [{
        "Utilities": utilities_price,
        "Childcare": childcare_price,
        "Restaurants": restaurants_price,
        "Clothing": clothing_price,
        "Transportation": transportation_price,
        "Summary": sum
    }]




