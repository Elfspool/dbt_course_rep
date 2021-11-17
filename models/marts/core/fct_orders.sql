with orders as (
    select
    order_id,
    customer_id
    from
    {{ ref('stg_orders') }}
),

payments as (
    select
    orderid as order_id,
    amount
    from
    {{ ref('stg_payments') }}
),

order_payments as (
    select 
    orders.order_id,
    orders.customer_id,
    payments.amount
    from
    orders
    left join payments using (order_id)
)

select * from order_payments
