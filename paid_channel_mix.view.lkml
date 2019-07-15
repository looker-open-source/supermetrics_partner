view: paid_channel_mix {
  derived_table: {
    sql: SELECT
      date as Date,
      campaign_name as Campaign,
      clicks AS Clicks,
      impressions AS Impressions,
      cost AS Cost,
      offsite_conversions AS Conversions,
      "Facebook Ads" AS Source
      FROM `supermetrics-sql.Supermetrics_internal_DWH.FBADS_AD_*`


      UNION ALL

      SELECT
      date as Date,
      campaign_name as Campaign,
      clicks AS Clicks,
      impressions AS Impressions,
      cost AS Cost,
      conversions AS Conversions,
      "Google Ads" AS Source
      FROM `supermetrics-sql.Supermetrics_internal_DWH.GOOGLEADS_CAMPAIGN_*`

      UNION ALL

      SELECT
      date as Date,
      campaign_name as Campaign,
      clicks AS Clicks,
      impressions AS Impressions,
      cost AS Cost,
      conversions AS Conversions,
      "Twitter Ads" AS Source
      FROM `supermetrics-sql.Supermetrics_internal_DWH.TWITTERADS_AD_*`

      UNION ALL

      SELECT
      date as Date,
      campaign_name as Campaign,
      clicks AS Clicks,
      impressions AS Impressions,
      cost AS Cost,
      conversions AS Conversions,
      "Bing Ads" AS Source
      FROM `supermetrics-sql.Supermetrics_internal_DWH.BINGADS_AD_*`

      UNION ALL

      SELECT
      date as Date,
      campaign_name as Campaign,
      clicks AS Clicks,
      impressions AS Impressions,
      cost AS Cost,
      conversions AS Conversions,
      "LinkedIn Ads" AS Source
      FROM `supermetrics-sql.Supermetrics_internal_DWH.LINKEDINADS_AD_*`
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: date {
    type: time
    timeframes: [date, week, month, year]
    sql: timestamp(${TABLE}.Date) ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.Campaign ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.Source ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  measure: sum_clicks {
    type: sum
    sql: ${clicks} ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.Impressions ;;
  }

  measure: sum_impressions {
    type: sum
    sql: ${impressions} ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.Cost ;;
  }

  measure: sum_cost {
    type: sum
    sql: ${cost} ;;
    value_format: "\"€\"0"
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.Conversions ;;
  }

  measure: sum_conversions {
    type: sum
    sql: ${conversions} ;;
    value_format: "#,##0"
  }


  dimension: CTR {
    type: number
    sql: ${clicks} / NULLIF(${impressions},0) ;;
    value_format: "0.00%;(0.00%)"
  }


  measure: weighted_avg_CTR_good_format {
    type: number
    sql: ${sum_clicks}/NULLIF( ${sum_impressions},0) ;;
    value_format: "0.00%;(0.00%)"
  }

  dimension: CPC {
    type: number
    sql: ${cost}/NULLIF(${clicks},0) ;;
    value_format: "\"€\"0"
  }


  measure: avg_CPC {
    type: number
    sql: ${sum_cost}/NULLIF(${sum_clicks},0) ;;
    value_format: "\"€\"0"
  }

  dimension: conversion_rate {
    type: number
    sql: ${conversions}/NULLIF(${clicks},0) ;;
    value_format: "0.00%;(0.00%)"
  }

  measure: avg_conversion_rate {
    type: number
    sql: ${sum_conversions}/NULLIF(${sum_clicks},0) ;;
    value_format: "0.00%;(0.00%)"
  }

  dimension: cost_per_conversion {
    type: number
    sql: ${cost}/NULLIF(${conversions},0) ;;
    value_format: "\"€\"0"
  }

  measure: avg_cost_per_conversion {
    type: number
    sql: ${sum_cost}/NULLIF(${sum_conversions},0) ;;
    value_format: "\"€\"0"
  }

  set: detail {
    fields: [
      date_date,
      campaign,
      clicks,
      impressions,
      cost,
      conversions,
      source
    ]
  }
}
