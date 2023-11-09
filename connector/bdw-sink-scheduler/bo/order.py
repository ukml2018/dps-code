from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class Order(Base):
    __tablename__ = "completed_order"
    __table_args__ = {"schema": "rawdata"}

    id = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    order_id = Column(sa.VARCHAR(100))
    account_id = Column(sa.VARCHAR(100))
    bank_to = Column(sa.VARCHAR(100))
    account_to = Column(sa.VARCHAR(100))
    amount = Column(sa.VARCHAR(100))
    k_symbol = Column(sa.VARCHAR(100))
    loaded_time = Column(sa.VARCHAR(100))
    batch_id = Column(sa.VARCHAR(100))

    def __init__(self, dict):
        for key, value in dict.items():
            setattr(self, key, value)
