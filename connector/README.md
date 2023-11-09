# Sink Connectors

## bdw-cp-connector

### Description
Sink data from Synapse Conformed layer to temporary table of PostgreSQL leveraging PySpark. PySpark python pacakge contains a standalone Spark cluster with local as Spark master. 

PySpark mechanism diagram:

![pyspark.jpg](/imgs/pyspark.jpg)


### Container build - Docker based
To create a build of container, which will be used in image of Kubernetes, please use Docker and upload build to Azure Container Registry:

1. Log in your Azure account first:
```
az login --tenant b66e4a3a-2d36-4476-9d51-517fed268e58 --use-device-code

az acr login --name crmdadeveastus001
```

2. Go to `connector/bdw-cp-connector` directory

3. To build Docker image use command below:
```
docker rmi -f crmdadeveastus001.azurecr.io/bdw-cp-connector:latest
docker build -t crmdadeveastus001.azurecr.io/bdw-cp-connector:latest .
```

4. Push image to container registry:
```
docker push crmdadeveastus001.azurecr.io/bdw-cp-connector:latest
```

### Helm chart
Helm chart of bdw-cp-connector is available under [bdw-cp-connector-chart](/connector/bdw-cp-connector-chart) directory.

&nbsp;

Variables to be revised of `secretEnvs` section of `values.yaml` file:

**SINK_SOURCE_PASSWORD**: password of source database. In BDW, it should be password of Synapse.

**SINK_TARGET_PASSWORD**: password of target database. In BDW, it should be password of PostgreSQL. 

&nbsp;


If you want to switch to a different Kafka instance, please revise variables of `configEnvs` section of `values.yaml` file:

**KAFKA_BOOTSTRAP_SERVERS**: bootstrap server address of Kafka instance 

**KAFKA_CONSUMER_GROUP**: consumer group name of Kafka instance

&nbsp;

To deploy this connector to Kubernetes for the first time, please use command below under [connector](/connector) directory:

```
helm install -n bdw bdw-cp-connector ./bdw-cp-connector-chart
```

If you need to switch to other database instances, please revise `configEnvs` section of `values.yaml` and then upgrade helm chart:
```
helm upgrade -n bdw bdw-cp-connector ./bdw-cp-connector-chart
```

## bdw-sink-connector (DEPRECATED)
### Description
This version of data sink connector leverages sqlalchemy to read from one type of DB and bulk insert to another DB. 
ATTENTION: This connector supports multiple types of database but the performance is not that good for all types of DB. It should be treated as a backup plan for data migration.

