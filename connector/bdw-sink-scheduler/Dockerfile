FROM python:3.9-slim

USER root 
RUN mkdir -p /app /app/bo /app/model app/config && chmod +x /app /app/bo /app/model /app/config

WORKDIR /app
COPY . /app

RUN apt-get update \
 && apt-get install unixodbc -y \
 && apt-get install unixodbc-dev -y \
 && apt-get install freetds-dev -y \
 && apt-get install freetds-bin -y \
 && apt-get install tdsodbc -y \
 && apt-get install --reinstall build-essential -y

RUN echo "[FreeTDS]\n\
Description = FreeTDS Driver\n\
Driver = /usr/lib/x86_64-linux-gnu/odbc/libtdsodbc.so\n\
Setup = /usr/lib/x86_64-linux-gnu/odbc/libtdsS.so" >> /etc/odbcinst.ini

RUN useradd connUser -u 50000 -g root -d /app
RUN chown -R connUser /app

USER connUser

RUN pip install --no-cache-dir --no-binary :all: pyodbc
RUN pip install --no-cache-dir psycopg2-binary
RUN pip install -r requirements.txt

CMD ["python","scheduler.py"]