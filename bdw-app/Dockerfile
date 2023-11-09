FROM python:3.9-slim

USER root
RUN mkdir -p /app /app/bo /app/model app/config && chmod +x /app /app/bo /app/model /app/config

WORKDIR /app

RUN apt-get update \
 && apt-get install g++ -y \
 && apt-get install unixodbc -y \
 && apt-get install unixodbc-dev -y \
 && apt-get install freetds-dev -y \
 && apt-get install freetds-bin -y \
 && apt-get install tdsodbc -y \
 && apt-get install --reinstall build-essential -y \
 && apt-get install vim -y

RUN apt-get update \
    && apt-get install -y curl apt-transport-https \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql18 \
    && ACCEPT_EULA=Y apt-get install -y mssql-tools18

# install jre
RUN apt-get install -y default-jre

# RUN ls -la /usr/lib/jvm/
# set env
ENV JAVA_HOME /usr/lib/jvm/java-1.17.0-openjdk-amd64

COPY . /app

# RUN echo "[FreeTDS]\n\
# Description = FreeTDS Driver\n\
# Driver = /usr/lib/x86_64-linux-gnu/odbc/libtdsodbc.so\n\
# Setup = /usr/lib/x86_64-linux-gnu/odbc/libtdsS.so" >> /etc/odbcinst.ini

RUN useradd connUser -u 50000 -g root -d /app
RUN chown -R connUser /app

USER connUser

RUN pip install --no-cache-dir --no-binary :all: pyodbc
RUN pip install --no-cache-dir psycopg2-binary
RUN pip install -r requirements.txt

# CMD ["python","sink.py"]
# CMD ["/bin/sleep", "3650d"]
CMD ["python","bdw_app.py"]