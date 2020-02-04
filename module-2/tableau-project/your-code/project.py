import pandas as pd
from pymongo import MongoClient
from pandas.io.json import json_normalize

client = MongoClient()
db = client.Companies
comp = db.Companies

query2 = list(comp.find({'category_code':'web', 'number_of_employees':{'$lt':300}},{'_id':0,'offices.latitude':1,'offices.longitude':1,'state_code':1,'country_code':1}))

query = list(comp.find({'category_code':'web', 'number_of_employees':{'$lt':300}},
                       {'name':1,'_id':0,'category_code':1,'number_of_employees':1,'offices.latitude':1,'offices.longitude':1,'state_code':1,'country_code':1}))

df = pd.DataFrame(query)

df['offices'].iloc[0]
df['offices'] = df['offices'].apply(lambda x: x[0])

print(df)