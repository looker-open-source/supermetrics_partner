view: fbads_s2_video_20190307 {
  sql_table_name: Supermetrics_public_FB_Ads_example.FBADS_S2_VIDEO_20190307 ;;

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

  dimension: video_10_sec_watched_actions {
    type: number
    sql: ${TABLE}.video_10_sec_watched_actions ;;
  }

  dimension: video_15_sec_watched_actions {
    type: number
    sql: ${TABLE}.video_15_sec_watched_actions ;;
  }

  dimension: video_30_sec_watched_actions {
    type: number
    sql: ${TABLE}.video_30_sec_watched_actions ;;
  }

  dimension: video_average_watch_time {
    type: number
    sql: ${TABLE}.video_average_watch_time ;;
  }

  dimension: video_p_100_watched_actions {
    type: number
    sql: ${TABLE}.video_p_100_watched_actions ;;
  }

  dimension: video_p_25_watched_actions {
    type: number
    sql: ${TABLE}.video_p_25_watched_actions ;;
  }

  dimension: video_p_50_watched_actions {
    type: number
    sql: ${TABLE}.video_p_50_watched_actions ;;
  }

  dimension: video_p_75_watched_actions {
    type: number
    sql: ${TABLE}.video_p_75_watched_actions ;;
  }

  dimension: video_p_95_watched_actions {
    type: number
    sql: ${TABLE}.video_p_95_watched_actions ;;
  }

  measure: count {
    type: count
    drill_fields: [ad_name, account_name]
  }
}
