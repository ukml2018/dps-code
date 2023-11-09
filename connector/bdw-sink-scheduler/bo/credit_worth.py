from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class CreditWorth(Base):
    __tablename__ = "credit_worth"
    __table_args__ = {"schema": "rawdata"}

    id = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    client_id = Column(sa.VARCHAR(100))
    outcome = Column(sa.VARCHAR(100))
    confidence = Column(sa.VARCHAR(100))
    review_status = Column(sa.VARCHAR(100))
    loaded_time = Column(sa.VARCHAR(100))
    batch_id = Column(sa.VARCHAR(100))

    def __init__(self, dict):
        for key, value in dict.items():
            setattr(self, key, value)