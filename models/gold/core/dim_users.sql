with users as (
    select * from {{ ref('slv_sql_server_dbo__users') }}
),

addresses as (
    select * from {{ ref('slv_sql_server_dbo__addresses') }}
),

final as (
    select
        u.*,
        a.* exclude (address_id, date_load)
    from users u
    left join addresses a
        on u.address_id = a.address_id
)

select * from final