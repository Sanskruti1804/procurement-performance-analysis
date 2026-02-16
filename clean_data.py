import pandas as pd

RAW_PATH = "data/procurement_data_raw.csv"
OUT_PATH = "data/procurement_data_clean.csv"

def main():
    df = pd.read_csv(RAW_PATH)

    # Parse dates
    date_cols = ["PO_Date", "Planned_Delivery_Date", "Delivery_Date"]
    for c in date_cols:
        df[c] = pd.to_datetime(df[c], errors="coerce")

    # Ensure numeric columns
    num_cols = ["Quantity", "Unit_Price", "Planned_Cost", "Actual_Cost"]
    for c in num_cols:
        df[c] = pd.to_numeric(df[c], errors="coerce")

    # Derived fields
    df["Delay_Days"] = (df["Delivery_Date"] - df["Planned_Delivery_Date"]).dt.days
    df["Cost_Variance"] = df["Actual_Cost"] - df["Planned_Cost"]
    df["On_Time"] = (df["Delay_Days"] <= 0).astype(int)

    # Basic QA checks
    df = df.dropna(subset=["PO_Number", "Vendor_ID", "Material_ID", "PO_Date", "Planned_Delivery_Date", "Delivery_Date"])

    df.to_csv(OUT_PATH, index=False)
    print(f"Saved cleaned dataset to: {OUT_PATH}")
    print(df.head(3).to_string(index=False))

if __name__ == "__main__":
    main()
