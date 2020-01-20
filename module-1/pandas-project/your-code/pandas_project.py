# importa pandas
import pandas as pd

# ---------------------------------------------------------------------------------------------------------------------------------------------
# lee el archivo con un encoding diferente a utf-8 ya que no reconoce ciertos caracteres dentro de el csv

shark = pd.read_csv('attacks.csv',encoding = "ISO-8859-1")
shark_info = pd.DataFrame(shark)
# ---------------------------------------------------------------------------------------------------------------------------------------------

# elimina todas las filas que contienen valores iguales, que para este caso es nan en todas sus columnas
duplicados = shark_info.drop_duplicates()
duplicados.shape
# ---------------------------------------------------------------------------------------------------------------------------------------------

# reorganizacion de las columnas de la mas importante a menos importante 
cols = ['Case Number', 'Date', 'Year','Type','Country', 'Area','Location',
       'Activity', 'Name', 'Sex ', 'Age', 'Injury', 'Fatal (Y/N)','Species ', 'Time','Investigator or Source',
       'original order','Case Number.1', 'Case Number.2','pdf', 'href formula', 'href','Unnamed: 22','Unnamed: 23']
shark_clean = pd.DataFrame(duplicados, columns=cols)
shark_clean = shark_clean
# ---------------------------------------------------------------------------------------------------------------------------------------------

# limpiando primera columna de tabla "case Number"
shark_clean['Case Number'] = shark_clean['Case Number'].str.replace('\.[a-z]+|\.[A-Z]+','', regex=True).fillna('2010.01.01')
#print(shark_clean)
# ---------------------------------------------------------------------------------------------------------------------------------------------
shark_clean['Date'] = shark_clean['Date'].str.replace('Reported| Early| Late|\.[a-z]|\.[A-Z]|Between May &' ,'').fillna('01-01-2000')

#print(shark_clean.head(10))
#print('-'*100)
shark_clean['Date'] = pd.to_datetime(shark_clean['Date'], errors='coerce', infer_datetime_format=True)

#print(shark_clean.head(10))
#print(shark_clean.dtypes)

# ---------------------------------------------------------------------------------------------------------------------------------------------
'''
# Limpieza de la columna year 
'''
shark_clean['Year']=shark_clean['Year'].fillna(0.0)
#print(shark_clean)
# convierte los años a str para poder eliminar el punto decimal
shark_clean['Year']= shark_clean['Year'].astype({'Year':'str'})
#print(shark_clean.dtypes)

# elimina el punto decimal, todo lo que vaya despues del punto es eliminado
shark_clean['Year'] = shark_clean['Year'].str.replace('\.[0-9]+','',regex=True)
#shark_clean

# hace un replace de todos los años 0 por años 2000 para dejarlo en una media
shark_clean['Year'] = shark_clean['Year'].replace('0','2000')
#shark_clean

# shark_clean
shark_clean['Year'] = shark_clean['Year'].apply(pd.to_numeric)
print(shark_clean.dtypes)

'''
# opcion 2 para la conversion de str to int 
shark_clean['Year'] = shark_clean['Year'].astype({'Year':'int'})
shark_clean.dtypes
# opcion 3 
aux_fun = lambda x : int(x)
shark_clean['Year'] = shark_clean['Year'].map(aux_fun)
shark_clean
'''
# ---------------------------------------------------------------------------------------------------------------------------------------------
#  Limpieza de la columna type
shark_clean['Type']= shark_clean['Type'].str.replace('Invalid|0, ','Unknown',regex=True).fillna('Unknown')
#print(shark_clean.sample(10))	
# ---------------------------------------------------------------------------------------------------------------------------------------------

# limpieza de la columna Country
shark_clean['Country'] = shark_clean['Country'].fillna('Unknown')
print(shark_clean['Type'].value_counts())

# ---------------------------------------------------------------------------------------------------------------------------------------------
# limpieza de la columna Area

shark_clean['Area'] = shark_clean['Area'].fillna('Unknown')
shark_clean.sample(60)

# ---------------------------------------------------------------------------------------------------------------------------------------------
# limpieza de location
shark_clean['Location']=shark_clean['Location'].fillna('Unknown')


# ---------------------------------------------------------------------------------------------------------------------------------------------
# limpieza de activity
shark_clean['Activity']=shark_clean['Activity'].fillna('Unknown')

# ---------------------------------------------------------------------------------------------------------------------------------------------
# limpieza de name
shark_clean['Name']=shark_clean['Name'].str.replace('male|female|boy|2 males|boat','Unknown',regex=True).fillna('Unknown')

# ---------------------------------------------------------------------------------------------------------------------------------------------
# limpieza de sex 
shark_clean['Sex ']=shark_clean['Year'].rename({'Sex ':'Sex'})
shark_clean['Sex ']=shark_clean['Sex '].fillna('ND')


# ---------------------------------------------------------------------------------------------------------------------------------------------
# limpieza de time 


# ---------------------------------------------------------------------------------------------------------------------------------------------
# limpieza de investigator or source
shark_clean['Investigator or Source']=shark_clean['Investigator or Source'].fillna('Unknown')
# ---------------------------------------------------------------------------------------------------------------------------------------------
# limpieza de original order
shark_clean['original order'] =shark_clean['original order'].fillna('6000')

# ---------------------------------------------------------------------------------------------------------------------------------------------
# limpieza de case number 1
shark_clean['Case Number.1']= shark_clean['Case Number.1'].fillna('2010.01.01')

# ---------------------------------------------------------------------------------------------------------------------------------------------
# limpieza de case number 2
shark_clean['Case Number.2']=shark_clean['Case Number.2'].fillna('2010.01.01')

print(shark_clean.head)