from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class Loan(Base):
    __tablename__ = "completed_loan"
    __table_args__ = {"schema": "rawdata"}

    id = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    loan_id = Column(sa.VARCHAR(100))
    account_id = Column(sa.VARCHAR(100))
    amount = Column(sa.VARCHAR(100))
    duration = Column(sa.VARCHAR(100))
    payments = Column(sa.VARCHAR(100))
    status = Column(sa.VARCHAR(100))
    year = Column(sa.VARCHAR(100))
    month = Column(sa.VARCHAR(100))
    day = Column(sa.VARCHAR(100))
    fulldate = Column(sa.VARCHAR(100))
    location = Column(sa.VARCHAR(100))
    purpose = Column(sa.VARCHAR(100))
    date = Column(sa.VARCHAR(100))
    loaded_time = Column(sa.VARCHAR(100))
    batch_id = Column(sa.VARCHAR(100))

    def __init__(self, dict):
        for key, value in dict.items():
            setattr(self, key, value)
