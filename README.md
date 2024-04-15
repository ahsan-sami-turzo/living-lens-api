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


## API Endpoints

The API provides several endpoints to interact with the data:

- `GET /`: Returns the project name.
- `GET /get-cities/{country_id}`: Returns cities based on the country ID.
- `GET /get-city-by-id/{city_id}`: Returns a city based on its ID.
- `GET /get-subcategories-by-city-and-category/{city_id}/{category_id}`: Returns subcategories based on city and category IDs.
- `GET /get-lifestyles`: Returns all lifestyles.
- `GET /get-prices/{city_id}/{lifestyle_id}`: Returns prices based on city and lifestyle IDs.
- `GET /get-countries/`: Returns all countries or filters by name.
- `GET /get-categories/`: Returns all categories or filters by name.
- `GET /get-subcategories/{category_id}`: Returns all subcategories or filters by category ID.
- `GET /get/bar-chart/categories/prices/{city_id}`: Returns the average prices of all categories of a city.
- `POST /get/bar-chart/prices/city/categories`: Returns prices for each category of a city.
- `POST /api/v1/get/bar-chart/prices/country/categories`: Returns average prices by country and categories.
- `POST /api/v1/get/pie-chart/percentages/city/categories`: Returns category average prices as percentages.
- `GET /get-piechartdata/{city_id}`: Returns average price percentages for pie chart data.
- `GET /get-barchartdata/{city_id}`: Returns average prices for bar chart data.

## Controllers

- get_cities(country_id: int, db: Session = Depends(SessionLocal)): Queries the database for all cities in a given country.
- get_city_by_id(city_id: int, db: Session = Depends(SessionLocal)): Queries the database for a specific city.
- get_prices(city_id: int, lifestyle_id: int, db: Session = Depends(SessionLocal)): Retrieves prices from the database for a specific city and lifestyle.
- get_categories(name: str = None, db: Session = Depends(SessionLocal)): Retrieves categories from the database, with optional filtering by name.
- get_subcategories(category_id: int = None, db: Session = Depends(SessionLocal)): Retrieves subcategories from the database for a given category.

## Database Tables

### Table: Country
- id (Integer)
- country_name (String)

### Table: City
- id (Integer)
- city_name (String)
- country_id_fk (Integer, Foreign Key)

### Table: Category
- id (Integer)
- category_name (String)

### Table: SubCategory
- id (Integer)
- subcategory_name (String)
- category_id_fk (Integer, Foreign Key)

### Table: Price
- id (Integer)
- city_id_fk (Integer, Foreign Key)
- subcategory_id_fk (Integer, Foreign Key)
- average_price (Float)
- min_price (Float)
- max_price (Float)

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

