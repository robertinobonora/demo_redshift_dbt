{% macro dbt_ejecucion_inicial(nombre_ejecucion) %}
insert into dev.dbt_staging.dbt_metrica_ejecucion (nombre_modelo,nombre_ejecucion,nombre_metrica,val_metrica)
values(NULL,'{{ nombre_ejecucion }}',NULL,NULL); commit;
{%- endmacro %}