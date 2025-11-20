import pandas as pd
from sqlalchemy import create_engine


df = pd.read_csv("cleaned_data.csv")


user = "postgres"
password = "1010"

host = "localhost"
port = "5432"
database = "salesdb"


engine = create_engine(f"postgresql+psycopg2://{user}:{password}@{host}:{port}/{database}")


table_name = "superstore"


df.to_sql(table_name, con=engine, if_exists='replace', index=False)

print(f"Data loaded successfully into table '{table_name}'")
