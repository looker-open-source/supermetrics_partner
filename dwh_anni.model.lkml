connection: "sm_bq"

# include all the views
include: "*.view"
explore: paid_channel_mix {
}

datagroup: dwh_anni_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dwh_anni_default_datagroup
