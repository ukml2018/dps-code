from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class Client(Base):
    __tablename__ = "completed_client"
    __table_args__ = {"schema": "rawdata"}

    id = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    client_id = Column(sa.VARCHAR(100))
    sex = Column(sa.VARCHAR(100))
    fulldate = Column(sa.VARCHAR(100))
    day = Column(sa.VARCHAR(100))
    month = Column(sa.VARCHAR(100))
    year = Column(sa.VARCHAR(100))
    age = Column(sa.VARCHAR(100))
    social = Column(sa.VARCHAR(100))
    first = Column(sa.VARCHAR(100))
    middle = Column(sa.VARCHAR(100))
    last = Column(sa.VARCHAR(100))
    phone = Column(sa.VARCHAR(100))
    email = Column(sa.VARCHAR(100))
    address_1 = Column(sa.VARCHAR(100))
    address_2 = Column(sa.VARCHAR(100))
    city = Column(sa.VARCHAR(100))
    state = Column(sa.VARCHAR(100))
    zipcode = Column(sa.VARCHAR(100))
    district_id = Column(sa.VARCHAR(100))
    creditscore = Column(sa.VARCHAR(100))
    criminalrecord = Column(sa.VARCHAR(100))
    acorncategory = Column(sa.VARCHAR(100))
    loaded_time = Column(sa.VARCHAR(100))
    batch_id = Column(sa.VARCHAR(100))

    def __init__(self, dict):
        for key, value in dict.items():
            setattr(self, key, value)
