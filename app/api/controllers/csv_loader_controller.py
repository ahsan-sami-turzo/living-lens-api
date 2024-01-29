# app/api/controllers/csv_loader_controller.py
import csv

from sqlalchemy.orm import Session

from app.api.models.expense_models import City, ExpenseCategory, Expense


def load_csv_data(db: Session):
    success_count = 0
    error_count = 0

    with open('your_csv_file.csv', mode='r', encoding='utf-8') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            try:
                # Assuming your CSV has columns 'CityID', 'CityName', 'CategoryID', ...
                city_data = {"CityID": int(row['CityID']), "CityName": row['CityName']}
                expense_category_data = {"CategoryID": int(row['CategoryID']), "CategoryName": row['CategoryName']}
                expense_data = {
                    "ExpenseID": int(row['ExpenseID']),
                    "CityID": int(row['CityID']),
                    "CategoryID": int(row['CategoryID']),
                    "MinCost": float(row['MinCost']),
                    "MaxCost": float(row['MaxCost']),
                    "MedianCost": float(row['MedianCost']),
                }

                # Insert data into tables
                db.merge(City(**city_data))
                db.merge(ExpenseCategory(**expense_category_data))
                db.merge(Expense(**expense_data))

                success_count += 1
            except Exception as e:
                # Log or handle the error as needed
                error_count += 1

    # Commit the changes to the database
    db.commit()

    return success_count, error_count
