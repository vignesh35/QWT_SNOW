{{config(materialized = 'table')}}
select ORDER_ID,
LINE_NO,
SHIPPER_ID,
CUSTOMER_ID,
PRODUCT_ID,
EMPLOYEE_ID,
SPLIT_PART(SHIPMENT_DATE,' ',1)::DATE AS SHIPMENT_DATE,
STATUS from 
{{source("qwt_raw","raw_shipments")}}