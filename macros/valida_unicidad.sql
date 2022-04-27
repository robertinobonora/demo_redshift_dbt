{% test valida_unicidad(model) %}
with validacion as (
    select
salesid, listid, sellerid, userid, catid
    from {{ model }}
),
validacion_duplicidad as (
    select
        salesid, listid, sellerid, userid, catid, count(*)
    from validacion
    group by salesid, listid, sellerid, userid, catid
    having count(*) > 1 
)
select *
from validacion_duplicidad
{% endtest %}