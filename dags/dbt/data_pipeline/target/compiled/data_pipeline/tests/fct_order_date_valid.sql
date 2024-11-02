select 
    *
from 
    dbt_db.dbt_schema.fct_orders
where
    date(order_date)> current_date()
or
    date(order_date) < date('1990-01-01')