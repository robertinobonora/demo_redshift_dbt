with ventas as(
    select * from {{ source('dbt_source_redshift','sales')}}
)

,eventos as(
    select * from {{ source('dbt_source_redshift','event')}}
)

,usuarios as(
    select * from {{ source('dbt_source_redshift','users')}}
)

,categorias as(
    select * from {{ source('dbt_source_redshift','category')}}
)

, qry_final as (
    select 
        vt.salesid, vt.listid, vt.sellerid, us.*, vt.dateid, vt.qtysold, vt.pricepaid, vt.commission, vt.saletime,cat.*
    from ventas as vt 
    left join eventos ev
    on vt.eventid = ev.eventid
    left join categorias cat 
    on ev.catid = cat.catid
    left join usuarios us 
    on vt.buyerid = us.userid
    where cat.catid = {{ var('categoria_id')}}
)

select * from qry_final
