# E-Commerce Sales Analysis

## About the Project

This project explores the Olist Brazilian E-Commerce Public Dataset using SQL and Python. The goal is to analyze e-commerce sales data, identify business patterns, and extract useful insights from customers, orders, products, and revenue.

The project combines SQL queries, SQLite database management, Python-based exploratory data analysis, and data visualization.

## Tools & Technologies

* Python
* Pandas
* SQLite
* SQL
* Matplotlib
* Jupyter Notebook
* Git and GitHub

## Dataset

The project uses the [Olist Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).

The dataset includes information about customers, orders, products, sellers, payments, reviews, geolocation, and product categories.

Raw CSV files and the generated SQLite database are not stored in this repository because of their size. Download the dataset from Kaggle and place the required CSV files in the `data/` directory.

## Project Structure

```text
ecommerce-sales-analysis/
├── data/                  # Raw CSV files (not tracked by Git)
├── database/              # Generated SQLite database (not tracked by Git)
├── SQL/
│   ├── 01_customer_orders.sql
│   ├── 02_orders_by_city.sql
│   ├── 03_city_revenue.sql
│   ├── 04_city_order_count.sql
│   └── 05_city_average_order_value.sql
├── notebooks/
│   └── 01_explore_data.ipynb
├── create_database.py     # Imports CSV files into SQLite
├── .gitignore
└── Readme.md
```

## CSV to SQLite Database

The original dataset is provided as CSV files. To perform SQL analysis, these files are imported into a SQLite database.

The `create_database.py` script automates this process:

1. Reads the CSV files using Pandas.
2. Creates the `database/` directory if it does not exist.
3. Imports each CSV file into a separate SQLite table.
4. Creates the `database/ecommerce.db` database file.
5. Prints the number of rows imported into each table.

This makes the project reproducible: the database can be generated again on another computer without downloading the database file from GitHub.

To create the database, first download and extract the dataset from Kaggle, then place the CSV files in the `data/` directory and run:

```bash
py -m pip install pandas
py create_database.py
```

The script uses SQLite's `to_sql()` functionality through Pandas. Existing tables with the same names are replaced when the script is run again.

## SQL Analysis

The SQL scripts investigate practical business questions:

* Joining customers and orders
* Finding cities with the highest number of orders
* Calculating total sales revenue by city
* Comparing order counts across cities
* Calculating average order value by city

The analysis uses joins, aggregation, grouping, and sorting to extract meaningful information.

## Python Analysis

The Jupyter Notebook covers the initial exploratory data analysis:

* Loading CSV files with Pandas
* Inspecting dataset dimensions and columns
* Checking missing values
* Combining order items, products, and category translations
* Exploring product category distribution
* Calculating minimum, maximum, mean, and median item prices
* Visualizing item price distribution with Matplotlib

## Initial Findings

* Order items dataset: 112,650 rows
* Products dataset: 32,951 rows
* Translated product categories: 71
* Minimum item price: 0.85
* Maximum item price: 6,735.00
* Mean item price: approximately 120.65
* Median item price: 74.99

The mean price is higher than the median, suggesting that some higher-priced items may influence the average.

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Cavidan232/ecommerce-sales-analysis.git
cd ecommerce-sales-analysis
```

### 2. Install Dependencies

```bash
py -m pip install pandas matplotlib jupyter
```

### 3. Download the Dataset

Download the [Olist dataset from Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce), extract the CSV files, and place them in the `data/` directory.

### 4. Create the SQLite Database

From the project root, run:

```bash
py create_database.py
```

This creates `database/ecommerce.db` and imports the CSV data into SQLite tables.

### 5. Run the Python Notebook

```bash
jupyter notebook
```

Open `notebooks/01_explore_data.ipynb` and run the cells in order.

### 6. Run the SQL Queries

Open `database/ecommerce.db` with SQLite or a compatible database extension, then execute the scripts in the `SQL/` directory.

## Future Improvements

* Analyze monthly sales trends
* Compare revenue by product category
* Explore customer purchasing patterns
* Investigate delivery performance and customer reviews
* Develop additional visualizations and a business dashboard

## Author

**Cavidan Vəlizadə**

GitHub: [@Cavidan232](https://github.com/Cavidan232)
