with order as (
    select * from {{ ref('fct_orders.sql') }}
),

orders_items as (
    select * from {{ ref('fct_orders_items.sql') }}
),

final as (
    select o.*, oi.*
    from orders as o
    left join orders_item as oi
    on o.order_id = oi.order_id
    where oi.product_id is null    
   
)

select * from final
