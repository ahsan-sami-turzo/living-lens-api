# Living Lens API

## Product Summary
The Living Lens API is a FastAPI-based web service that allows users to import data from a CSV file into a set of relational tables. The tables include City, ExpenseCategory, and Expense, each with specific fields.

## What the Code Does
The code reads data from a CSV file containing information about cities, expense categories, and related expenses. It then stores this data in the specified database tables using SQLAlchemy for database operations.

### Tables and Fields
- **City Table:**
  - CityID (Primary Key)
  - CityName

- **ExpenseCategory Table:**
  - CategoryID (Primary Key)
  - CategoryName

- **Expense Table:**
  - ExpenseID (Primary Key)
  - CityID (Foreign Key referencing City.CityID)
  - CategoryID (Foreign Key referencing ExpenseCategory.CategoryID)
  - MinCost
  - MaxCost
  - MedianCost

## How to Run with Docker
1. Clone the repository:

```bash
   git clone https://github.com/your-username/living-lens-api.git
   cd living-lens-api
```

2. Create a .env file in the project root and set the database variables:

```bash
MONGO_URI=mongodb://localhost:27017/
PG_USER=your_pg_username
PG_PASSWORD=your_pg_password
PG_DATABASE=your_pg_database
PG_HOST=localhost
```

3. Build the Docker image

```bash
docker build -t living-lens-api .
```

4. Run the Docker container

```bash
docker run -p 8000:8000 -d living-lens-api
```

### API Documentation
Swagger: http://localhost:8000/docs
ReDoc: http://localhost:8000/redoc

### License
This project is licensed under the MIT License.

