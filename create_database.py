
from pathlib import Path
import sqlite3
import pandas as pd

BASE_DIR = Path(__file__).resolve().parent
DATA_DIR = BASE_DIR / "data"
DB_DIR = BASE_DIR / "database"
DB_PATH = DB_DIR / "ecommerce.db"

DB_DIR.mkdir(parents=True, exist_ok=True)

csv_files = {
    "customers": "olist_customers_dataset.csv",
    "geolocation": "olist_geolocation_dataset.csv",
    "order_items": "olist_order_items_dataset.csv",
    "order_payments": "olist_order_payments_dataset.csv",
    "order_reviews": "olist_order_reviews_dataset.csv",
    "orders": "olist_orders_dataset.csv",
    "products": "olist_products_dataset.csv",
    "sellers": "olist_sellers_dataset.csv",
    "category_translation": "product_category_name_translation.csv",
}

with sqlite3.connect(DB_PATH) as connection:
    for table_name, file_name in csv_files.items():
        file_path = DATA_DIR / file_name

        if not file_path.exists():
            raise FileNotFoundError(
                f"CSV faylı tapılmadı: {file_path}"
            )

        df = pd.read_csv(file_path)

        df.to_sql(
            table_name,
            connection,
            if_exists="replace",
            index=False
        )

        print(f"{table_name}: {len(df)} sətir import edildi.")

print(f"\nDatabase yaradıldı: {DB_PATH}")