view: fbads_s2_campaign {
  sql_table_name: Supermetrics_public_FB_Ads_example.FBADS_S2_CAMPAIGN_* ;;

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: account_status {
    type: string
    sql: ${TABLE}.account_status ;;
  }

  dimension: action_comment {
    type: number
    sql: ${TABLE}.action_comment ;;
  }

  dimension: business_city {
    type: string
    sql: ${TABLE}.business_city ;;
  }

  dimension: business_country_code {
    type: string
    sql: ${TABLE}.business_country_code ;;
  }

  dimension: business_name {
    type: string
    sql: ${TABLE}.business_name ;;
  }

  dimension: campaign_budget_remaining {
    type: number
    sql: ${TABLE}.campaign_budget_remaining ;;
  }

  dimension: campaign_buying_type {
    type: string
    sql: ${TABLE}.campaign_buying_type ;;
  }

  dimension: campaign_configured_status {
    type: string
    sql: ${TABLE}.campaign_configured_status ;;
  }

  dimension: campaign_daily_budget {
    type: number
    sql: ${TABLE}.campaign_daily_budget ;;
  }

  dimension_group: campaign_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.campaign_end_date ;;
  }

  dimension: campaign_end_time {
    type: string
    sql: ${TABLE}.campaign_end_time ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_lifetime_budget {
    type: number
    sql: ${TABLE}.campaign_lifetime_budget ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_objective {
    type: string
    sql: ${TABLE}.campaign_objective ;;
  }

  dimension: campaign_spend_cap {
    type: number
    sql: ${TABLE}.campaign_spend_cap ;;
  }

  dimension_group: campaign_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.campaign_start_date ;;
  }

  dimension: campaign_start_time {
    type: string
    sql: ${TABLE}.campaign_start_time ;;
  }

  dimension: campaign_status {
    type: string
    sql: ${TABLE}.campaign_status ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: cost_eur {
    type: number
    sql: ${TABLE}.cost_eur ;;
  }

  dimension: cost_gbp {
    type: number
    sql: ${TABLE}.cost_gbp ;;
  }

  dimension: cost_usd {
    type: number
    sql: ${TABLE}.cost_usd ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: impression_device {
    type: string
    sql: ${TABLE}.impression_device ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}.reach ;;
  }

  dimension: spend_cap {
    type: number
    sql: ${TABLE}.spend_cap ;;
  }

  dimension: timezone_id {
    type: number
    sql: ${TABLE}.timezone_id ;;
  }

  dimension: unique_action_comment {
    type: number
    sql: ${TABLE}.unique_action_comment ;;
  }

  dimension: unique_action_follow {
    type: number
    sql: ${TABLE}.unique_action_follow ;;
  }

  dimension: unique_action_like {
    type: number
    sql: ${TABLE}.unique_action_like ;;
  }

  dimension: unique_action_link_click {
    type: number
    sql: ${TABLE}.unique_action_link_click ;;
  }

  dimension: unique_action_mention {
    type: number
    sql: ${TABLE}.unique_action_mention ;;
  }

  dimension: unique_action_page_engagement {
    type: number
    sql: ${TABLE}.unique_action_page_engagement ;;
  }

  dimension: unique_action_photo_view {
    type: number
    sql: ${TABLE}.unique_action_photo_view ;;
  }

  dimension: unique_action_post {
    type: number
    sql: ${TABLE}.unique_action_post ;;
  }

  dimension: unique_action_post_engagement {
    type: number
    sql: ${TABLE}.unique_action_post_engagement ;;
  }

  dimension: unique_action_post_reaction {
    type: number
    sql: ${TABLE}.unique_action_post_reaction ;;
  }

  dimension: unique_action_video_play {
    type: number
    sql: ${TABLE}.unique_action_video_play ;;
  }

  dimension: unique_action_video_view {
    type: number
    sql: ${TABLE}.unique_action_video_view ;;
  }

  dimension: unique_inline_link_clicks {
    type: number
    sql: ${TABLE}.unique_inline_link_clicks ;;
  }

  dimension: unique_outbound_clicks {
    type: number
    sql: ${TABLE}.unique_outbound_clicks ;;
  }

  measure: count {
    type: count
    drill_fields: [campaign_name, account_name, business_name]
  }
}
