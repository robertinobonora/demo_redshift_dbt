{% macro dbt_ejecucion_modelo(this,nombre_ejecucion,nombre_metrica) -%}
{% if nombre_metrica == 'cantidad_registros' %}
insert into dev.dbt_staging.dbt_metrica_ejecucion (nombre_modelo,nombre_ejecucion,nombre_metrica,val_metrica) 
select '{{ this.name }}','{{ nombre_ejecucion }}','{{ nombre_metrica }}',count(1) from {{ this }}; commit;
{% endif %}
{%- endmacro %}