import pandas as pd
from extract import extract_data

def transform_data(df):
    try:
        duplicate_count = df.duplicated().sum()
        if duplicate_count > 0:
            print(f"Found {duplicate_count} duplicate rows. Removing duplicates...")
            df = df.drop_duplicates()
        else:
            print("No duplicate rows found.")

        null_counts = df.isnull().sum()
        null_columns = null_counts[null_counts > 0]
        if not null_columns.empty:
            print("Columns with missing values:")
            print(null_columns)
            
            for col in null_columns.index:
                if df[col].dtype in ['int64', 'float64']:
                    df[col] = df[col].fillna(0)
                else:
                    df[col] = df[col].fillna('Unknown')
            print("Missing values filled based on column type.")
        else:
            print("No missing values found.")

        return df
    
    except Exception as e:
        print("Error in transform_data:", e)
        return None


if __name__ == "__main__":
    path = "/Users/nishanrana/Downloads/train.csv"
    df = extract_data(path)

    if df is not None:
        df_cleaned = transform_data(df)
        print("\nTransformed DataFrame:")
        print(df_cleaned.head())
        df_cleaned.to_csv("cleaned_data.csv", index=False)
        print("\nCleaned data saved to 'cleaned_data.csv'.")
    else:
        print("Extraction failed, cannot transform data.")
