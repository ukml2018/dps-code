from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class Acct(Base):
    __tablename__ = "completed_account"
    __table_args__ = {"schema": "rawdata"}
    id = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    account_id = Column(sa.VARCHAR(100))
    district_id = Column(sa.VARCHAR(100))
    frequency = Column(sa.VARCHAR(100))
    parseddate = Column(sa.VARCHAR(100))
    year = Column(sa.VARCHAR(100))
    month = Column(sa.VARCHAR(100))
    day = Column(sa.VARCHAR(100))
    date = Column(sa.VARCHAR(100))
    loaded_time = Column(sa.VARCHAR(100))
    batch_id = Column(sa.VARCHAR(100))

    def __init__(self, dict):
        for key, value in dict.items():
            setattr(self, key, value)