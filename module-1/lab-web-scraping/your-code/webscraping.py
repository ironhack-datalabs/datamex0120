# -*- coding: utf-8 -*-
"""WebScraping.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/10xNqS1Z6V2ZJJSAdUSBcAhFYDbOBB3Fj
"""

pip install Unidecode

import requests
from bs4 import BeautifulSoup as bs
import pandas as pd
import random
import re
import unidecode

URL = 'https://github.com/trending/developers'

html = requests.get(URL).content
html

soup = bs(html, 'lxml')

titles = soup.find_all('div', {'class':'usctitlechanged'})
len(titles)

url = 'https://www.fbi.gov/wanted/topten'
html = requests.get(url).content
soup = bs(html, 'lxml')

titles = soup.find_all('h3', {'class':'title'})

names = []
for i in range(len(titles)):
    names.append(titles[i].select('a')[0].text)

names

url = 'https://www.emsc-csem.org/Earthquake/'
html = requests.get(url).content
soup = bs(html, 'lxml')

rows = soup.find_all('tr', {'class':'ligne1 normal'})
eartqs = pd.DataFrame(rows)
eartqs

eartqs = eartqs.drop([0, 1, 2, 3, 8, 9, 10], axis=1)

eartqs.rename(columns={4:'Latitude', 5:'Latitud Cardinality', 6:'Longitud', 7:'Longitud Cardinality', 11:'Region', 12:'Datetime'}, inplace=True)
eartqs

for column in eartqs.columns:
    eartqs[column] = eartqs[column].apply(lambda x: unidecode.unidecode(x.text))
    
eartqs

url = 'https://twitter.com/twitter'
html = requests.get(url).content
soup = bs(html, 'html.parser')
soup