from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class Txn(Base):
    __tablename__ = "completed_transaction"
    __table_args__ = {"schema": "rawdata"}

    id = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    column_a = Column(sa.VARCHAR(100))
    trans_id = Column(sa.VARCHAR(100))
    account_id = Column(sa.VARCHAR(100))
    type = Column(sa.VARCHAR(100))
    operation = Column(sa.VARCHAR(100))
    amount = Column(sa.VARCHAR(100))
    balance = Column(sa.VARCHAR(100))
    k_symbol = Column(sa.VARCHAR(100))
    bank = Column(sa.VARCHAR(100))
    account = Column(sa.VARCHAR(100))
    year = Column(sa.VARCHAR(100))
    month = Column(sa.VARCHAR(100))
    day = Column(sa.VARCHAR(100))
    fulldate = Column(sa.VARCHAR(100))
    fulltime = Column(sa.VARCHAR(100))
    fulldatewithtime = Column(sa.VARCHAR(100))
    date = Column(sa.VARCHAR(100))
    loaded_time = Column(sa.VARCHAR(100))
    batch_id = Column(sa.VARCHAR(100))

    def __init__(self, dict):
        for key, value in dict.items():
            setattr(self, key, value)
    # TXN_ID = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    # TXN_TP_ID = Column(sa.VARCHAR(100))
    # RQS_CNL_ID = Column(sa.NUMERIC(15,2))
    # SETL_CNL_ID = Column(sa.NUMERIC(15,2))
    # TXN_CCY_ID = Column(sa.NUMERIC(15,2))
    # CNVR_CCY_ID = Column(sa.NUMERIC(15,2))
    # EXG_RATE_TO_CNVR_CCY = Column(sa.NUMERIC(15,2))
    # MSR_PRD_ID = Column(sa.NUMERIC(15,2))
    # TM_OF_DAY_TBND_ID = Column(sa.NUMERIC(15,2))
    # EXCP_CAUS_ID = Column(sa.NUMERIC(15,2))
    # EXCP_IMP_ID = Column(sa.NUMERIC(15,2))
    # OU_ID = Column(sa.VARCHAR(100))
    # PRIM_AR_ID = Column(sa.VARCHAR(100))
    # RQS_CMM_ID = Column(sa.INTEGER)
    # NET_CASH_FLOW_AMT = Column(sa.NUMERIC)
    # TXN_TM = Column(sa.VARCHAR(100))
    # TXN_DT = Column(sa.VARCHAR(100))
    # TXN_BOOK_DT = Column(sa.TIMESTAMP)
    # TXN_VAL_DT = Column(sa.TIMESTAMP)
    # DVC_ID = Column(sa.VARCHAR(100))
    # SSPCS_EV_GRP_ID = Column(sa.NUMERIC(15,2))
    # FEE_X_CMSN_AMT = Column(sa.NUMERIC)
    # BATCH_ID = Column(sa.VARCHAR(100))

    # def __init__(tablename):
    #     __tablename__ = tablename