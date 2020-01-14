import os
import sys
from sqlalchemy import Column, ForeignKey, Integer, String, Float, Boolean
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship, sessionmaker
from sqlalchemy import create_engine
from sqlalchemy_utils import database_exists, create_database

myPassword = os.environ['mySQLPassword']


dbURL="mysql+mysqlconnector://root:{}@127.0.0.1:3306/carLab".format(myPassword)


#######
# https://www.a2hosting.com/kb/developer-corner/mysql/connecting-to-mysql-using-python
# I had some issues connecting python3 to mysql, I think pip3 install mysql-connector-python solved it


# Connect to engine
engine = create_engine(dbURL)

# Here it a tutorial that I loosely followed to get the logic for the next
# few lines:
# https://www.compose.com/articles/using-postgresql-through-sqlalchemy


# If the database specified at the end of the database url does not 
# work then I need this logic in order to create the database
# You can see this here: https://stackoverflow.com/a/30971098/5420796


# this allows you to create a class
# https://stackoverflow.com/a/16472760/5420796
if not database_exists(engine.url):
    create_database(engine.url)
print(database_exists(engine.url))


Base = declarative_base()


class Inventory(Base):
	__tablename__ = 'inventory'


	vinNumber = Column(
		String(17), primary_key=True, nullable=False)


	manufacturer = Column(
		String(20), nullable=False)

	model = Column(
		String(20), nullable=False)


	year = Column(
		String(4), nullable=False)


	color = Column(
		String(10), nullable=False)



class Customer(Base):
	__tablename__ = 'customer'


	customerID = Column(
		String(5), primary_key=True, nullable=False)


	name = Column(
		String(20), nullable=False)

	phoneNumber = Column(
		String(20), nullable=False)

	email = Column(
		String(20), nullable=False)


	address = Column(
		String(20), nullable=False)

	city = Column(
		String(20), nullable=False)


	state = Column(
		String(20), nullable=False)


	country = Column(
		String(20), nullable=False)


	zipcode = Column(
		String(20), nullable=False)


class SalesPerson(Base):
	__tablename__ = 'salesperson'


	staffID = Column(
		String(5), primary_key=True, nullable=False)


	name = Column(
		String(20), nullable=False)

	store = Column(
		String(20), nullable=False)



class Invoice(Base):
	__tablename__ = 'invoice'


	invoiceNumber = Column(
		String(5), primary_key=True, nullable=False)


	date = Column(
		String(20), nullable=False)

	car = Column(
		String(20), ForeignKey('inventory.vinNumber'), nullable=False)

	customer = Column(
		String(20), ForeignKey('customer.customerID'), nullable=False)

	salesperson = Column(
		String(20), ForeignKey('salesperson.staffID'), nullable=False)


# Create the database
Base.metadata.create_all(engine)
print(database_exists(engine.url))


# Seeding the database
# https://stackoverflow.com/a/31205155/5420796


#s = Session()
#objects = [
#    Inventory(name="u1"),
#    User(name="u2"),
#    User(name="u3")
#]
#s.bulk_save_objects(objects)
#s.commit()
#