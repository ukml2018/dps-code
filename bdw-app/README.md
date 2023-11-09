# bdw-app

## Description

The main purpose of this service is to synchronize data from COS (ADLS) to Synapse Raw data layer, including 3 steps:

1. load csv files from COS referring to Kafka message of `bdw_rawfiles_topic`.

Sample message of `bdw_rawfiles_topic`:

```
{
	"pipeline_id": "0",
    "batch_id": "20230926190717483117",
	"cos_conn_dict": {
		"type": "Azure",
		"container": "demo-bdw",
		"conn_str": "gAAAAABlErtuvMUrYodaUoI2_mecsib0XX49n-o0musy4JFclsNF9vYNvOHH3mT6LtEDryacWA_6uTZyyfE-_ZVOYCGCTaf1DMo6hQkv0phPITILdlzqilMYMsfw-PSzePHMGfRX0Uw4GogUbrbEzwqMOcb_Meu97AsaxHGwKuQW3noKYwt71ARYg32qhI35C69BiGtjnH4R325r_TUtQklB-Lvry2-tooxQdR3lU6zBqDoIrVz4jhdwkIvQgfKJ_L_pEGEN2GeS7ZkA_d6a_ZYIj_mn8g-H1o8WXdxaYEKCMKrtFcKCh5mcbzWwJfa2CtudNpSLrgfBg41DpA2aeTLG6mcUemgBAw==",
		"url": "https://adlsmdadmshdeveastus001.blob.core.windows.net"
	},
	"files_list": [
		"landing-zone/20230926190717483117/completed_account.csv",
		"landing-zone/20230926190717483117/completed_card.csv"
	],
	"db_conn_dict": {
		"conn_str": "gAAAAABlErtv5bqSio3TBuoBoCCY2ZHGeWBFf-Wc8ZwbOuyeRkhfqNeDf53cbsSp8MmjfnhgUunSXgDt4opQjqA2EuAkZaGExez3lbDSIIhk2_Wta20OUvwzcRr3LvHiCObf5EfiiS6uBV-eQ5Yhs6G9n_O7--jZVgkxBwDfFffW17eQDPEbO2a33t48ZrLBUTjsaOCMiMiFeZK9rbyJrfChF01WWbSpnvEERvPt8jbfJnARJ88bcBMfJrIYfFyNjC5shsZglZzN",
		"schema": "rawdata"
	},
	"bck_container": "raw-layer",
	"bck_dir": "bdw"
}
```

2. trigger main Airflow DAG with "batch_id" and "pipeline_id".
Sample DAG API trigger payload:

```
{
    "pipeline_id": "0",
    "batch_id" : "202309201741"
}
```

3. back up data in landing zone COS folder to backup target COS folder(backup folder and COS instance info are part of Kafka message) in format `/raw-layer/YEAR/MONTH/DAY/HOUR/MINUTE/FILE_NAME`.


## Container build - Docker based
To create a build of container, which will be used in image of Kubernetes, please use Docker and upload build to Azure Container Registry:

1. Log in your Azure account first:
```
az login --tenant b66e4a3a-2d36-4476-9d51-517fed268e58 --use-device-code

az acr login --name crmdadeveastus001
```

2. Go to `bdw-app` directory

3. To build Docker image use command below:
```
docker rmi -f crmdadeveastus001.azurecr.io/bdw-app:latest
docker build -t crmdadeveastus001.azurecr.io/bdw-app:latest .
```

4. Push image to container registry:
```
docker push crmdadeveastus001.azurecr.io/bdw-app:latest
```


## Helm chart
Helm chart of bdw-app is available in [/bdw-app-chart](/bdw-app/bdw-app-chart) folder.

Variables to be revised of `secretEnvs` section of `values.yaml` file before deployment:

**FERNET_KEY**: Fernet key for DB connection string encryption and decryption

**AIRFLOW_PWD**: password to do Airflow authentication

If you need to switch to other Airflow instance or databases, please revise `configEnvs` section of `values.yaml` and then upgrade helm chart:
```
helm upgrade -n bdw bdw-app ./bdw-app-chart
```

To deploy this service to Kubernetes for the first time, please use command below under [bdw-app](/bdw-app) directory:

```
helm install -n bdw bdw-app ./bdw-app-chart
```

