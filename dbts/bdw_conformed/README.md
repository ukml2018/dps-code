# bdw_conformed
The dbt project used to build conformed tables from rawdata tables.

## build models

Build models with a provided batch number

```
dbt run --vars '{"batch_nbr":"$batch_number"}' -s models/conformed --profiles-dir config
```
