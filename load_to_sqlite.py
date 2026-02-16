import sqlite3
import pandas as pd

CSV_PATH = "data/procurement_data_clean.csv"
DB_PATH = "data/procurement.db"
TABLE = "procurement"

def main():
    df = pd.read_csv(CSV_PATH)
    conn = sqlite3.connect(DB_PATH)
    df.to_sql(TABLE, conn, if_exists="replace", index=False)
    conn.commit()
    conn.close()
    print(f"Loaded {len(df)} rows into {DB_PATH} (table: {TABLE})")

if __name__ == "__main__":
    main()
