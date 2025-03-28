import snowflake.snowpark.functions as F

def model(dbt, session):

    stg_customers_df = dbt.source('qwt_raw','raw_customers')

    return stg_customers_df