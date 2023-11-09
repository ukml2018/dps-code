from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class Tradeline(Base):
    __tablename__ = "tradelines"
    __table_args__ = {"schema": "rawdata"}

    id = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    customerid = Column(sa.VARCHAR(100))
    externalriskscore = Column(sa.VARCHAR(100))
    monthssinceoldesttradelineopen = Column(sa.VARCHAR(100))
    monthssincemostrecenttradelineopen = Column(sa.VARCHAR(100))
    averageminfile = Column(sa.VARCHAR(100))
    numbersatisfactorytradelines = Column(sa.VARCHAR(100))
    numbertradelinesderogatorylast60days = Column(sa.VARCHAR(100))
    numbertradelinesderogatorylast90days = Column(sa.VARCHAR(100))
    percenttradesneverlate = Column(sa.VARCHAR(100))
    monthssincemostrecentderogatory = Column(sa.VARCHAR(100))
    maxdelinqent2publicrecords = Column(sa.VARCHAR(100))
    maxdelinquentever = Column(sa.VARCHAR(100))
    numbertotaltradelines = Column(sa.VARCHAR(100))
    numbertradelinesopenlast12months = Column(sa.VARCHAR(100))
    percentinstallmenttradelines = Column(sa.VARCHAR(100))
    monthssincemostrecentinstallment = Column(sa.VARCHAR(100))
    numberinquirieslast6months = Column(sa.VARCHAR(100))
    numberinquirieslast6monthsexcludingsoft = Column(sa.VARCHAR(100))
    loaded_time = Column(sa.VARCHAR(100))
    batch_id = Column(sa.VARCHAR(100))

    def __init__(self, dict):
        for key, value in dict.items():
            setattr(self, key, value)