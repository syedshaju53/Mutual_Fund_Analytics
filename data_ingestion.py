import pandas as pd
import os

path = "data/raw"

files = os.listdir(path)

for file in files:

    if file.endswith(".csv"):

        print("\n==============================")
        print("FILE:", file)
        print("==============================")

        df = pd.read_csv(f"{path}/{file}")

        print("Shape:")
        print(df.shape)

        print("\nData Types:")
        print(df.dtypes)

        print("\nFirst 5 rows:")
        print(df.head())

        print("\nMissing Values:")
        print(df.isnull().sum())