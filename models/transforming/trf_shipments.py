import snowflake.snowpark.functions as F
 
def model(dbt, session):
 
    dbt.config(materialized = 'table', schema = 'transforming_dev')
 
    shipments_df = dbt.ref('shipments_snapshot')
 
    shippers_df = dbt.ref('lkp_shippers')
 
    shipments_transformed_df = (
                                    shipments_df
                                    .join(shippers_df, shipments_df.shipper_id == shippers_df.shipperid, 'left')
                                    .select(
                                        shipments_df.order_id,
                                        shipments_df.line_no,
                                        shippers_df.companyname,
                                        shipments_df.shipment_date,
                                        shipments_df.status.alias('currentstatus')
                                       
                                    )
 
    )
 
    shipments_currentstatus_df = shipments_transformed_df.filter(F.col('DBT_VALID_TO').isNotNull())
 
    return shipments_currentstatus_df