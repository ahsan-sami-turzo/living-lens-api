# app/api/controllers/csv_loader_controller.py
import csv
from pathlib import Path

from sqlalchemy.orm import Session

from app.api.models.expense_models import City, ExpenseCategory, Expense


def load_csv_data(db: Session, file_path: Path):
    success_count = 0
    error_count = 0

    # Extract city name from filename
    city_name = file_path.stem  # Use stem to get filename without extension

    # 1. Insert into City table if does not exist
    city = db.query(City).filter(City.CityName == city_name).first()
    if not city:
        city = City(CityName=city_name)
        db.add(city)
        db.commit()
        db.refresh(city)

    # 3. Get CityID of the City table
    city_id = city.CityID

    with open(file_path, mode='r', encoding='utf-8') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            try:
                # 4. Get Category Name from the 'Category' column
                category_name = row['Category']

                # 5. Insert into ExpenseCategory table if does not exist
                category = db.query(ExpenseCategory).filter(ExpenseCategory.CategoryName == category_name).first()
                if not category:
                    category = ExpenseCategory(CategoryName=category_name)
                    db.add(category)
                    db.commit()
                    db.refresh(category)

                # 6. Get CategoryID from ExpenseCategory table
                category_id = category.CategoryID

                # 7. Insert into Expense table
                expense_data = {
                    "CityID": city_id,
                    "CategoryID": category_id,
                    "Title": row['Title'],
                    "PriceMin": float(row['priceMin']),
                    "PriceMax": float(row['priceMax']),
                    "PriceAverage": float(row['priceAverage']),
                }

                expense = Expense(**expense_data)
                db.add(expense)
                db.commit()

                success_count += 1
            except Exception as e:
                # Log or handle the error as needed
                error_count += 1

    return success_count, error_count
