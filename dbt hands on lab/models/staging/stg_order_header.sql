with source as (
    select * from {{ source('tasty_bytes', 'raw_pos_order_header') }}
),

cleaned as (
    select
        order_id,
        truck_id,
        order_ts,
        customer_id,
        order_total as order_net_total
    from source
    where order_id is not null
)

select * from cleaned
