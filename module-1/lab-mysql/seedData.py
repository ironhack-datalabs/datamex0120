from create_database import Inventory, Customer, SalesPerson, Invoice
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
    Inventory(vinNumber="JH4UI1570LS8000DJ", manufacturer="Honda",model="Civic",year="1993",color="Blue"),
    Customer(customerID="12345", name="Juan Perez", phoneNumber="+525576909876", email="juanperez@gmail.com", address="Calzada de Tlalpan 15", state="CDMX", country="Mexico", city="CDMX", zipcode="04080"),
    SalesPerson(staffID="54321", name="Oscar Perez", store="Copilco"),
    Invoice(invoiceNumber="98765", date="08/04/1988", car="JH4DB1570LS800098", customer="12345",salesperson="54321")
]
session.bulk_save_objects(seedData)
session.commit()
session.close()
