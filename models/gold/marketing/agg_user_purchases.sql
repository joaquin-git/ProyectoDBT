-- =============================================================================
-- agg_user_purchases
-- =============================================================================
-- Métricas de compra por usuario para Marketing. Grano: usuario.
-- Los usuarios sin pedidos aparecen con total_orders = 0 y segmento never_bought.
-- =============================================================================

with users as (
    select * from {{ ref('dim_users') }}
),

orders as (
    select * from {{ ref('fct_orders') }}
),

orders_per_user as (
    select
          user_id
        , count(order_id) as total_orders
    from orders
    group by user_id
),

final as (
    select
          u.user_id
        , coalesce(o.total_orders, 0) as total_orders
        , case
            when coalesce(o.total_orders, 0) = 0 then 'never_bought'
            when o.total_orders = 1             then 'one_purchase'
            when o.total_orders = 2             then 'two_purchases'
            else 'three_or_more'
          end as purchase_segment
    from users u
    left join orders_per_user o
        on u.user_id = o.user_id
)

select * from final