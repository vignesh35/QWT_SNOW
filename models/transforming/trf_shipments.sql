{{ config(materialized = 'table', schema = 'transforming_dev') }}
 
select

ss.order_id,
ss.LINE_NO,
sh.companyname,
ss.SHIPMENT_DATE,
ss.status
from
{{ref('shipments_snapshot')}}  as ss inner join
{{ref('lkp_shippers')}} as sh on
ss.SHIPPER_ID = sh.SHIPPERID
where ss.dbt_valid_to is null