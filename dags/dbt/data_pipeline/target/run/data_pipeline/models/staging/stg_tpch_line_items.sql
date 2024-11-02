
  create or replace   view dbt_db.dbt_schema.stg_tpch_line_items
  
   as (
    select
    md5(cast(coalesce(cast(l_orderkey as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(l_linenumber as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as order_item_key,
    L_ORDERKEY as order_key,
	L_PARTKEY as part_key,
	L_LINENUMBER as line_number,
	L_QUANTITY as quantity,
	L_EXTENDEDPRICE as extended_price,
	L_DISCOUNT as discount_percentage,
    L_TAX as tax_rate
from 
    snowflake_sample_data.tpch_sf1.lineitem
  );

