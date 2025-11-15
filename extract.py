import pandas as pd
import os

def extract_data(path):
    try:
        if not os.path.exists(path):
            print("File not found")
            return None
        
        try:
            df = pd.read_csv(path)
        except UnicodeDecodeError:
            print("Encoding issue, retrying with UTF-8")
            df = pd.read_csv(path, encoding="utf-8") 
        
        if df.empty:
            print("File is empty")
            return None
    
        print("Data extracted successfully")
        return df
    
    except Exception as e:
        print("Error during extraction:", e)
        return None
    
if __name__=="__main__":
    path = "/Users/nishanrana/Downloads/train.csv"
    df = extract_data(path)
    if df is not None:
        print(df.head(10))
