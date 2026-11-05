seeds:
curso_data_engineering:
+database: "{{ env_var('DBT_SILVER_DB') }}"
+schema: seeds
country_codes:
+column_types:
country_code: varchar(2)
country_name: varchar(100)
continent: varchar(50)
