{{ config(materialized = 'table', schema = 'transforming_dev') }}
select
p.productId,
p.Productname,
s.companyname,
s.ContactName,
s.city,
s.Country,
c.categoryname,
p.quantityperunit,
p.unitcost,
p.unitprice,
p.unitsonstock,
p.unitsonorder,
IFF(p.unitsonorder>p.unitsonstock,'Not Available','Available') as stockavailability
from  {{ref("staging_products")}} as p
inner join {{ref("trf_suppliers")}} as s
on p.SupplierID=s.SupplierId
inner join {{ref("lkp_categories")}} as c
on p.CategoryId=c.CategoryId