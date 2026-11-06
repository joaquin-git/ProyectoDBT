{% macro seconds_to_minutes(column_name, precision_dec=2) -%}
round({{ column_name }} / 60, {{precision_dec }})
{%- endmacro %}