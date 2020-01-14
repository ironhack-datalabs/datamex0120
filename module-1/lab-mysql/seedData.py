from create_database import Inventory
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker
from sqlalchemy.ext.declarative import declarative_base
import os

myPassword = os.environ['mySQLPassword']
dbURL="mysql+mysqlconnector://root:{}@127.0.0.1:3306/carLab".format(myPassword)


engine = create_engine(dbURL)
Base = declarative_base()


Base.metadata.bind = engine
DBSession = sessionmaker(bind=engine)
session = DBSession()


seedData = [
    Inventory(vinNumber="JH4DB1570LS800098", manufacturer="Ford",model="F150",year="2006",color="Red"),
    Inventory(vinNumber="MN4DB157RTS8000DA", manufacturer="Tesla",model="3",year="2020",color="Silver"),
    Inventory(vinNumber="JH4UI1570LS8000DJ", manufacturer="Honda",model="Civic",year="1993",color="Blue")
]
session.bulk_save_objects(seedData)
session.commit()


session.close()
