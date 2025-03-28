{{ config(materialized = 'table', schema = {{env_var('DBT_TRANFORMSCHEMA', 'TRANSFORMING_DEV')}}) }}
 
select
 
c.customerid,
c.companyname,
c.contactname,
c.city,
c.country,
d.divisionname,
c.address,
c.fax,
c.phone,
c.postalcode,
IFF(c.stateprovince = '', 'NA', c.stateprovince) as statename
 
from
 
{{ref('staging_customers')}}  as c left join
 
{{ref('lkp_divisions')}} as d on
 
c.divisionid = d.divisonid