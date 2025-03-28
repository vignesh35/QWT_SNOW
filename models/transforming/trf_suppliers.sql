{{ config(materialized = 'table', schema = {{env_var('DBT_TRANFORMSCHEMA', 'TRANSFORMING_DEV')}}) }}
 
select
get(xmlget(supplierinfo, 'ContactName'),'$')::varchar as ContactName,
get(xmlget(supplierinfo, 'SupplierID'),'$')::varchar as SupplierID,
get(xmlget(supplierinfo, 'CompanyName'),'$')::varchar as CompanyName,
get(xmlget(supplierinfo, 'Address'),'$')::varchar as Address,
get(xmlget(supplierinfo, 'City'),'$')::varchar as City,
get(xmlget(supplierinfo, 'PostalCode'),'$')::varchar as PostalCode,
get(xmlget(supplierinfo, 'Country'),'$')::varchar as Country,
get(xmlget(supplierinfo, 'Phone'),'$')::varchar as Phone,
get(xmlget(supplierinfo, 'Fax'),'$')::varchar as Fax
from
{{ref('staging_suppliers')}}