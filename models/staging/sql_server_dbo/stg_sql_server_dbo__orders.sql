with source as (
select * from {{ source('sql_server_dbo', 'orders') }}
),
renamed as (
select
order_id
, user_id
, created_at as created_at_utc
, order_total as total_order_cost_usd
, status as order_status
, address_id
, promo_id
, estimated_delivery_at
, delivered_at
, tracking_id
, shipping_service
, shipping_cost
, order_cost
, _fivetran_deleted
, _loaded_at
, coalesce(_fivetran_deleted, false) as is_deleted
, _fivetran_synced as date_load
from source
)
select * from renamed