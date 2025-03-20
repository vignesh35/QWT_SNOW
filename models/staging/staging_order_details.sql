{{config(materialized = 'incremental', unique_key=['orderid','lineno'])}}
select od.orderid,
od.lineno,
od.productid,
od.unitprice,
od.quantity,
od.discount,
o.orderdate from 
{{source("qwt_raw","raw_orders")}} as o
inner join {{source("qwt_raw","raw_order_details")}} as od
on o.orderid=od.orderid
{% if is_incremental() %}

where o.orderdate > (select max(orderdate) from {{this}})

{% endif %}