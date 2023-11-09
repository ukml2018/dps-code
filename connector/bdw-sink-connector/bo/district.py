from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class District(Base):
    __tablename__ = "completed_district"
    __table_args__ = {"schema": "rawdata"}

    id = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    district_id = Column(sa.VARCHAR(100))
    city = Column(sa.VARCHAR(100))
    state_name = Column(sa.VARCHAR(100))
    state_abbrev = Column(sa.VARCHAR(100))
    region = Column(sa.VARCHAR(100))
    division = Column(sa.VARCHAR(100))
    loaded_time = Column(sa.VARCHAR(100))
    batch_id = Column(sa.VARCHAR(100))

    def __init__(self, dict):
        for key, value in dict.items():
            setattr(self, key, value)