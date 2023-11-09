# bdw_consumption
The dbt project used to build consumption tables from consumption tables.

## build models

Build models with a provided batch number

```
dbt run --vars '{"batch_nbr":"$batch_number"}' -s models/consumption --profiles-dir config
```