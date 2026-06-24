import requests
import pandas as pd


schemes={
"SBI_Bluechip":"119551",
"ICICI_Bluechip":"120503",
"Nippon_Large_Cap":"118632",
"Axis_Bluechip":"119092",
"Kotak_Bluechip":"120841"
}


for name,code in schemes.items():

    url=f"https://api.mfapi.in/mf/{code}"

    response=requests.get(url)

    data=response.json()

    df=pd.DataFrame(data["data"])

    df["scheme"]=name


    df.to_csv(
    f"data/raw/{name}_NAV.csv",
    index=False
    )


    print(name,"saved")