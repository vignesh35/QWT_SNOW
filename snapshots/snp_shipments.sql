{% snapshot  shipments_snapshot %}

{{
    config
    (target_database = 'QWT_ANALYTICS_DB',
    target_schema = 'SNAPSHOTS_DEV',
    unique_key = "order_id || '-' || LINE_NO",
    strategy = 'timestamp',
    updated_at = 'SHIPMENT_DATE'
    )
}}

select * from {{ref('staging_shipments')}}

{% endsnapshot %}