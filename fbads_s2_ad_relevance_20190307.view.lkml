view: fbads_s2_ad_relevance {
  sql_table_name: Supermetrics_public_FB_Ads_example.FBADS_S2_AD_RELEVANCE_* ;;

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}.ad_name ;;
  }

  dimension: ad_status {
    type: string
    sql: ${TABLE}.ad_status ;;
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

  dimension: relevance_score_number {
    type: number
    sql: ${TABLE}.relevance_score_number ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name, ad_name]
  }
}
