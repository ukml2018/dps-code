from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class BatchInfo(Base):
    __tablename__ = "batch_info"
    __table_args__ = {"schema": "metadata"}
    id = Column(sa.INTEGER, primary_key=True, autoincrement=True)
    batch_id = Column(sa.VARCHAR(100))
    tb_name = Column(sa.VARCHAR(100))
    total_count = Column(sa.INTEGER)
    loaded_count = Column(sa.INTEGER)
    
