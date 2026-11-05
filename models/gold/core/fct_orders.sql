with orders as (
    select * from {{ ref('gold_orders__enriched') }}
),

final as (
    select
        -- clave del hecho
          order_id

        -- claves hacia las dimensiones
        , user_id
        , address_id
        , promo_id

        -- fechas
        , created_at_utc

        -- atributos del pedido
        , order_status

        -- métricas (los números)
        , total_order_cost_usd

    from orders
)

select * from final