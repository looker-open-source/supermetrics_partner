connection: "sm_bq"

# include all the views
include: "*.view"

datagroup: dwh_anni_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dwh_anni_default_datagroup

explore: paid_channel_mix {}

explore: fbads_s2_ad {
  label: "Facebook Ads"
  view_label: "Ads"
  join: fbads_s2_ad_relevance {
    view_label: "Ad Relevance"
    sql_on: ${fbads_s2_ad.ad_id} = ${fbads_s2_ad_relevance.ad_id} ;;
    relationship: many_to_one
  }

  join: fbads_s2_campaign {
    view_label: "Campaign"
    sql_on: ${fbads_s2_ad.campaign_id} = ${fbads_s2_campaign.campaign_id} ;;
    relationship: many_to_one
  }
}
