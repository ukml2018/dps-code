from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class Review(Base):
    __tablename__ = "crm_reviews"
    __table_args__ = {"schema": "rawdata"}

    id = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    date = Column(sa.VARCHAR(100))
    stars = Column(sa.VARCHAR(100))
    reviews = Column(sa.VARCHAR(6000))
    product = Column(sa.VARCHAR(100))
    district_id = Column(sa.VARCHAR(100))
    loaded_time = Column(sa.VARCHAR(100))
    batch_id = Column(sa.VARCHAR(100))

    def __init__(self, dict):
        for key, value in dict.items():
            setattr(self, key, value)
