view: product_analytics {
  derived_table: {
    sql: SELECT
      *
      FROM `supermetrics-marketing-auto.reporting_layer.trial_to_license_DS`


       ;;
  }

  measure: count {
    type: count
 #   drill_fields: [detail*]
  }

  dimension_group: date {
    type: time
    timeframes: [date, week, month, year]
    sql: timestamp(${TABLE}.trial_date) ;;
  }

  dimension: customer_segment {
    type: string
    sql: ${TABLE}.customer_segment ;;
  }

  dimension: license_date {
    type: date
    sql: ${TABLE}.license_date ;;
  }

  dimension: trial_country {
    type: string
    sql: ${TABLE}.trial_country ;;
  }


  dimension: product_id {
    type: string
    sql: ${TABLE}.trial_product_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: trial_started {
    type: count_distinct
    sql: ${user_id} ;;
  }

  dimension: license_user_14 {
    type: number
    sql: ${TABLE}.license_user_14 ;;
  }

  measure: license_count_14 {
    type: count_distinct
    sql: ${license_user_14};;
  }

  #calculate separately for each conversion window, like in DS
  measure: trial_started_14 {
    type: count_distinct
    sql:
       CASE WHEN DATE_DIFF(CURRENT_DATE(), trial_date, DAY) <= 14 THEN NULL ELSE ${user_id}
       END ;;
  }

  measure: cvr_14_days {
    type: number
    sql: ${license_count_14}/NULLIF(${trial_started_14},0) ;;

    value_format: "0.00%;(0.00%)"
  }

  #calculation without trial count fixed for the last data points
  measure: crv_14_days {
    type: number
    sql: ${license_count_14}/${trial_started} ;;

    value_format: "0.00%;(0.00%)"
  }

  dimension: country
  {
    type: string
  sql: |
  CASE
  WHEN ${TABLE}.trial_country = 'AF' THEN 'AFG'
  WHEN ${TABLE}.trial_country = 'AX' THEN 'ALA'
  WHEN ${TABLE}.trial_country = 'AL' THEN 'ALB'
  WHEN ${TABLE}.trial_country = 'DZ' THEN 'DZA'
  WHEN ${TABLE}.trial_country = 'AS' THEN 'ASM'
  WHEN ${TABLE}.trial_country = 'AD' THEN 'AND'
  WHEN ${TABLE}.trial_country = 'AO' THEN 'AGO'
  WHEN ${TABLE}.trial_country = 'AI' THEN 'AIA'
  WHEN ${TABLE}.trial_country = 'AQ' THEN 'ATA'
  WHEN ${TABLE}.trial_country = 'AG' THEN 'ATG'
  WHEN ${TABLE}.trial_country = 'AR' THEN 'ARG'
  WHEN ${TABLE}.trial_country = 'AM' THEN 'ARM'
  WHEN ${TABLE}.trial_country = 'AW' THEN 'ABW'
  WHEN ${TABLE}.trial_country = 'AU' THEN 'AUS'
  WHEN ${TABLE}.trial_country = 'AT' THEN 'AUT'
  WHEN ${TABLE}.trial_country = 'AZ' THEN 'AZE'
  WHEN ${TABLE}.trial_country = 'BS' THEN 'BHS'
  WHEN ${TABLE}.trial_country = 'BH' THEN 'BHR'
  WHEN ${TABLE}.trial_country = 'BD' THEN 'BGD'
  WHEN ${TABLE}.trial_country = 'BB' THEN 'BRB'
  WHEN ${TABLE}.trial_country = 'BY' THEN 'BLR'
  WHEN ${TABLE}.trial_country = 'BE' THEN 'BEL'
  WHEN ${TABLE}.trial_country = 'BZ' THEN 'BLZ'
  WHEN ${TABLE}.trial_country = 'BJ' THEN 'BEN'
  WHEN ${TABLE}.trial_country = 'BM' THEN 'BMU'
  WHEN ${TABLE}.trial_country = 'BT' THEN 'BTN'
  WHEN ${TABLE}.trial_country = 'BO' THEN 'BOL'
  WHEN ${TABLE}.trial_country = 'BQ' THEN 'BES'
  WHEN ${TABLE}.trial_country = 'BA' THEN 'BIH'
  WHEN ${TABLE}.trial_country = 'BW' THEN 'BWA'
  WHEN ${TABLE}.trial_country = 'BV' THEN 'BVT'
  WHEN ${TABLE}.trial_country = 'BR' THEN 'BRA'
  WHEN ${TABLE}.trial_country = 'IO' THEN 'IOT'
  WHEN ${TABLE}.trial_country = 'BN' THEN 'BRN'
  WHEN ${TABLE}.trial_country = 'BG' THEN 'BGR'
  WHEN ${TABLE}.trial_country = 'BF' THEN 'BFA'
  WHEN ${TABLE}.trial_country = 'BI' THEN 'BDI'
  WHEN ${TABLE}.trial_country = 'KH' THEN 'KHM'
  WHEN ${TABLE}.trial_country = 'CM' THEN 'CMR'
  WHEN ${TABLE}.trial_country = 'CA' THEN 'CAN'
  WHEN ${TABLE}.trial_country = 'CV' THEN 'CPV'
  WHEN ${TABLE}.trial_country = 'KY' THEN 'CYM'
  WHEN ${TABLE}.trial_country = 'CF' THEN 'CAF'
  WHEN ${TABLE}.trial_country = 'TD' THEN 'TCD'
  WHEN ${TABLE}.trial_country = 'CL' THEN 'CHL'
  WHEN ${TABLE}.trial_country = 'CN' THEN 'CHN'
  WHEN ${TABLE}.trial_country = 'CX' THEN 'CXR'
  WHEN ${TABLE}.trial_country = 'CC' THEN 'CCK'
  WHEN ${TABLE}.trial_country = 'CO' THEN 'COL'
  WHEN ${TABLE}.trial_country = 'KM' THEN 'COM'
  WHEN ${TABLE}.trial_country = 'CG' THEN 'COG'
  WHEN ${TABLE}.trial_country = 'CD' THEN 'COD'
  WHEN ${TABLE}.trial_country = 'CK' THEN 'COK'
  WHEN ${TABLE}.trial_country = 'CR' THEN 'CRI'
  WHEN ${TABLE}.trial_country = 'CI' THEN 'CIV'
  WHEN ${TABLE}.trial_country = 'HR' THEN 'HRV'
  WHEN ${TABLE}.trial_country = 'CU' THEN 'CUB'
  WHEN ${TABLE}.trial_country = 'CW' THEN 'CUW'
  WHEN ${TABLE}.trial_country = 'CY' THEN 'CYP'
  WHEN ${TABLE}.trial_country = 'CZ' THEN 'CZE'
  WHEN ${TABLE}.trial_country = 'DK' THEN 'DNK'
  WHEN ${TABLE}.trial_country = 'DJ' THEN 'DJI'
  WHEN ${TABLE}.trial_country = 'DM' THEN 'DMA'
  WHEN ${TABLE}.trial_country = 'DO' THEN 'DOM'
  WHEN ${TABLE}.trial_country = 'EC' THEN 'ECU'
  WHEN ${TABLE}.trial_country = 'EG' THEN 'EGY'
  WHEN ${TABLE}.trial_country = 'SV' THEN 'SLV'
  WHEN ${TABLE}.trial_country = 'GQ' THEN 'GNQ'
  WHEN ${TABLE}.trial_country = 'ER' THEN 'ERI'
  WHEN ${TABLE}.trial_country = 'EE' THEN 'EST'
  WHEN ${TABLE}.trial_country = 'ET' THEN 'ETH'
  WHEN ${TABLE}.trial_country = 'FK' THEN 'FLK'
  WHEN ${TABLE}.trial_country = 'FO' THEN 'FRO'
  WHEN ${TABLE}.trial_country = 'FJ' THEN 'FJI'
  WHEN ${TABLE}.trial_country = 'FI' THEN 'FIN'
  WHEN ${TABLE}.trial_country = 'FR' THEN 'FRA'
  WHEN ${TABLE}.trial_country = 'GF' THEN 'GUF'
  WHEN ${TABLE}.trial_country = 'PF' THEN 'PYF'
  WHEN ${TABLE}.trial_country = 'TF' THEN 'ATF'
  WHEN ${TABLE}.trial_country = 'GA' THEN 'GAB'
  WHEN ${TABLE}.trial_country = 'GM' THEN 'GMB'
  WHEN ${TABLE}.trial_country = 'GE' THEN 'GEO'
  WHEN ${TABLE}.trial_country = 'DE' THEN 'DEU'
  WHEN ${TABLE}.trial_country = 'GH' THEN 'GHA'
  WHEN ${TABLE}.trial_country = 'GI' THEN 'GIB'
  WHEN ${TABLE}.trial_country = 'GR' THEN 'GRC'
  WHEN ${TABLE}.trial_country = 'GL' THEN 'GRL'
  WHEN ${TABLE}.trial_country = 'GD' THEN 'GRD'
  WHEN ${TABLE}.trial_country = 'GP' THEN 'GLP'
  WHEN ${TABLE}.trial_country = 'GU' THEN 'GUM'
  WHEN ${TABLE}.trial_country = 'GT' THEN 'GTM'
  WHEN ${TABLE}.trial_country = 'GG' THEN 'GGY'
  WHEN ${TABLE}.trial_country = 'GN' THEN 'GIN'
  WHEN ${TABLE}.trial_country = 'GW' THEN 'GNB'
  WHEN ${TABLE}.trial_country = 'GY' THEN 'GUY'
  WHEN ${TABLE}.trial_country = 'HT' THEN 'HTI'
  WHEN ${TABLE}.trial_country = 'HM' THEN 'HMD'
  WHEN ${TABLE}.trial_country = 'VA' THEN 'VAT'
  WHEN ${TABLE}.trial_country = 'HN' THEN 'HND'
  WHEN ${TABLE}.trial_country = 'HK' THEN 'HKG'
  WHEN ${TABLE}.trial_country = 'HU' THEN 'HUN'
  WHEN ${TABLE}.trial_country = 'IS' THEN 'ISL'
  WHEN ${TABLE}.trial_country = 'IN' THEN 'IND'
  WHEN ${TABLE}.trial_country = 'ID' THEN 'IDN'
  WHEN ${TABLE}.trial_country = 'IR' THEN 'IRN'
  WHEN ${TABLE}.trial_country = 'IQ' THEN 'IRQ'
  WHEN ${TABLE}.trial_country = 'IE' THEN 'IRL'
  WHEN ${TABLE}.trial_country = 'IM' THEN 'IMN'
  WHEN ${TABLE}.trial_country = 'IL' THEN 'ISR'
  WHEN ${TABLE}.trial_country = 'IT' THEN 'ITA'
  WHEN ${TABLE}.trial_country = 'JM' THEN 'JAM'
  WHEN ${TABLE}.trial_country = 'JP' THEN 'JPN'
  WHEN ${TABLE}.trial_country = 'JE' THEN 'JEY'
  WHEN ${TABLE}.trial_country = 'JO' THEN 'JOR'
  WHEN ${TABLE}.trial_country = 'KZ' THEN 'KAZ'
  WHEN ${TABLE}.trial_country = 'KE' THEN 'KEN'
  WHEN ${TABLE}.trial_country = 'KI' THEN 'KIR'
  WHEN ${TABLE}.trial_country = 'KP' THEN 'PRK'
  WHEN ${TABLE}.trial_country = 'KR' THEN 'KOR'
  WHEN ${TABLE}.trial_country = 'KW' THEN 'KWT'
  WHEN ${TABLE}.trial_country = 'KG' THEN 'KGZ'
  WHEN ${TABLE}.trial_country = 'LA' THEN 'LAO'
  WHEN ${TABLE}.trial_country = 'LV' THEN 'LVA'
  WHEN ${TABLE}.trial_country = 'LB' THEN 'LBN'
  WHEN ${TABLE}.trial_country = 'LS' THEN 'LSO'
  WHEN ${TABLE}.trial_country = 'LR' THEN 'LBR'
  WHEN ${TABLE}.trial_country = 'LY' THEN 'LBY'
  WHEN ${TABLE}.trial_country = 'LI' THEN 'LIE'
  WHEN ${TABLE}.trial_country = 'LT' THEN 'LTU'
  WHEN ${TABLE}.trial_country = 'LU' THEN 'LUX'
  WHEN ${TABLE}.trial_country = 'MO' THEN 'MAC'
  WHEN ${TABLE}.trial_country = 'MK' THEN 'MKD'
  WHEN ${TABLE}.trial_country = 'MG' THEN 'MDG'
  WHEN ${TABLE}.trial_country = 'MW' THEN 'MWI'
  WHEN ${TABLE}.trial_country = 'MY' THEN 'MYS'
  WHEN ${TABLE}.trial_country = 'MV' THEN 'MDV'
  WHEN ${TABLE}.trial_country = 'ML' THEN 'MLI'
  WHEN ${TABLE}.trial_country = 'MT' THEN 'MLT'
  WHEN ${TABLE}.trial_country = 'MH' THEN 'MHL'
  WHEN ${TABLE}.trial_country = 'MQ' THEN 'MTQ'
  WHEN ${TABLE}.trial_country = 'MR' THEN 'MRT'
  WHEN ${TABLE}.trial_country = 'MU' THEN 'MUS'
  WHEN ${TABLE}.trial_country = 'YT' THEN 'MYT'
  WHEN ${TABLE}.trial_country = 'MX' THEN 'MEX'
  WHEN ${TABLE}.trial_country = 'FM' THEN 'FSM'
  WHEN ${TABLE}.trial_country = 'MD' THEN 'MDA'
  WHEN ${TABLE}.trial_country = 'MC' THEN 'MCO'
  WHEN ${TABLE}.trial_country = 'MN' THEN 'MNG'
  WHEN ${TABLE}.trial_country = 'ME' THEN 'MNE'
  WHEN ${TABLE}.trial_country = 'MS' THEN 'MSR'
  WHEN ${TABLE}.trial_country = 'MA' THEN 'MAR'
  WHEN ${TABLE}.trial_country = 'MZ' THEN 'MOZ'
  WHEN ${TABLE}.trial_country = 'MM' THEN 'MMR'
  WHEN ${TABLE}.trial_country = 'NA' THEN 'NAM'
  WHEN ${TABLE}.trial_country = 'NR' THEN 'NRU'
  WHEN ${TABLE}.trial_country = 'NP' THEN 'NPL'
  WHEN ${TABLE}.trial_country = 'NL' THEN 'NLD'
  WHEN ${TABLE}.trial_country = 'NC' THEN 'NCL'
  WHEN ${TABLE}.trial_country = 'NZ' THEN 'NZL'
  WHEN ${TABLE}.trial_country = 'NI' THEN 'NIC'
  WHEN ${TABLE}.trial_country = 'NE' THEN 'NER'
  WHEN ${TABLE}.trial_country = 'NG' THEN 'NGA'
  WHEN ${TABLE}.trial_country = 'NU' THEN 'NIU'
  WHEN ${TABLE}.trial_country = 'NF' THEN 'NFK'
  WHEN ${TABLE}.trial_country = 'MP' THEN 'MNP'
  WHEN ${TABLE}.trial_country = 'NO' THEN 'NOR'
  WHEN ${TABLE}.trial_country = 'OM' THEN 'OMN'
  WHEN ${TABLE}.trial_country = 'PK' THEN 'PAK'
  WHEN ${TABLE}.trial_country = 'PW' THEN 'PLW'
  WHEN ${TABLE}.trial_country = 'PS' THEN 'PSE'
  WHEN ${TABLE}.trial_country = 'PA' THEN 'PAN'
  WHEN ${TABLE}.trial_country = 'PG' THEN 'PNG'
  WHEN ${TABLE}.trial_country = 'PY' THEN 'PRY'
  WHEN ${TABLE}.trial_country = 'PE' THEN 'PER'
  WHEN ${TABLE}.trial_country = 'PH' THEN 'PHL'
  WHEN ${TABLE}.trial_country = 'PN' THEN 'PCN'
  WHEN ${TABLE}.trial_country = 'PL' THEN 'POL'
  WHEN ${TABLE}.trial_country = 'PT' THEN 'PRT'
  WHEN ${TABLE}.trial_country = 'PR' THEN 'PRI'
  WHEN ${TABLE}.trial_country = 'QA' THEN 'QAT'
  WHEN ${TABLE}.trial_country = 'RE' THEN 'REU'
  WHEN ${TABLE}.trial_country = 'RO' THEN 'ROU'
  WHEN ${TABLE}.trial_country = 'RU' THEN 'RUS'
  WHEN ${TABLE}.trial_country = 'RW' THEN 'RWA'
  WHEN ${TABLE}.trial_country = 'BL' THEN 'BLM'
  WHEN ${TABLE}.trial_country = 'SH' THEN 'SHN'
  WHEN ${TABLE}.trial_country = 'KN' THEN 'KNA'
  WHEN ${TABLE}.trial_country = 'LC' THEN 'LCA'
  WHEN ${TABLE}.trial_country = 'MF' THEN 'MAF'
  WHEN ${TABLE}.trial_country = 'PM' THEN 'SPM'
  WHEN ${TABLE}.trial_country = 'VC' THEN 'VCT'
  WHEN ${TABLE}.trial_country = 'WS' THEN 'WSM'
  WHEN ${TABLE}.trial_country = 'SM' THEN 'SMR'
  WHEN ${TABLE}.trial_country = 'ST' THEN 'STP'
  WHEN ${TABLE}.trial_country = 'SA' THEN 'SAU'
  WHEN ${TABLE}.trial_country = 'SN' THEN 'SEN'
  WHEN ${TABLE}.trial_country = 'RS' THEN 'SRB'
  WHEN ${TABLE}.trial_country = 'SC' THEN 'SYC'
  WHEN ${TABLE}.trial_country = 'SL' THEN 'SLE'
  WHEN ${TABLE}.trial_country = 'SG' THEN 'SGP'
  WHEN ${TABLE}.trial_country = 'SX' THEN 'SXM'
  WHEN ${TABLE}.trial_country = 'SK' THEN 'SVK'
  WHEN ${TABLE}.trial_country = 'SI' THEN 'SVN'
  WHEN ${TABLE}.trial_country = 'SB' THEN 'SLB'
  WHEN ${TABLE}.trial_country = 'SO' THEN 'SOM'
  WHEN ${TABLE}.trial_country = 'ZA' THEN 'ZAF'
  WHEN ${TABLE}.trial_country = 'GS' THEN 'SGS'
  WHEN ${TABLE}.trial_country = 'SS' THEN 'SSD'
  WHEN ${TABLE}.trial_country = 'ES' THEN 'ESP'
  WHEN ${TABLE}.trial_country = 'LK' THEN 'LKA'
  WHEN ${TABLE}.trial_country = 'SD' THEN 'SDN'
  WHEN ${TABLE}.trial_country = 'SR' THEN 'SUR'
  WHEN ${TABLE}.trial_country = 'SJ' THEN 'SJM'
  WHEN ${TABLE}.trial_country = 'SZ' THEN 'SWZ'
  WHEN ${TABLE}.trial_country = 'SE' THEN 'SWE'
  WHEN ${TABLE}.trial_country = 'CH' THEN 'CHE'
  WHEN ${TABLE}.trial_country = 'SY' THEN 'SYR'
  WHEN ${TABLE}.trial_country = 'TW' THEN 'TWN'
  WHEN ${TABLE}.trial_country = 'TJ' THEN 'TJK'
  WHEN ${TABLE}.trial_country = 'TZ' THEN 'TZA'
  WHEN ${TABLE}.trial_country = 'TH' THEN 'THA'
  WHEN ${TABLE}.trial_country = 'TL' THEN 'TLS'
  WHEN ${TABLE}.trial_country = 'TG' THEN 'TGO'
  WHEN ${TABLE}.trial_country = 'TK' THEN 'TKL'
  WHEN ${TABLE}.trial_country = 'TO' THEN 'TON'
  WHEN ${TABLE}.trial_country = 'TT' THEN 'TTO'
  WHEN ${TABLE}.trial_country = 'TN' THEN 'TUN'
  WHEN ${TABLE}.trial_country = 'TR' THEN 'TUR'
  WHEN ${TABLE}.trial_country = 'TM' THEN 'TKM'
  WHEN ${TABLE}.trial_country = 'TC' THEN 'TCA'
  WHEN ${TABLE}.trial_country = 'TV' THEN 'TUV'
  WHEN ${TABLE}.trial_country = 'UG' THEN 'UGA'
  WHEN ${TABLE}.trial_country = 'UA' THEN 'UKR'
  WHEN ${TABLE}.trial_country = 'AE' THEN 'ARE'
  WHEN ${TABLE}.trial_country = 'GB' THEN 'GBR'
  WHEN ${TABLE}.trial_country = 'US' THEN 'USA'
  WHEN ${TABLE}.trial_country = 'UM' THEN 'UMI'
  WHEN ${TABLE}.trial_country = 'UY' THEN 'URY'
  WHEN ${TABLE}.trial_country = 'UZ' THEN 'UZB'
  WHEN ${TABLE}.trial_country = 'VU' THEN 'VUT'
  WHEN ${TABLE}.trial_country = 'VE' THEN 'VEN'
  WHEN ${TABLE}.trial_country = 'VN' THEN 'VNM'
  WHEN ${TABLE}.trial_country = 'VG' THEN 'VGB'
  WHEN ${TABLE}.trial_country = 'VI' THEN 'VIR'
  WHEN ${TABLE}.trial_country = 'WF' THEN 'WLF'
  WHEN ${TABLE}.trial_country = 'EH' THEN 'ESH'
  WHEN ${TABLE}.trial_country = 'YE' THEN 'YEM'
  WHEN ${TABLE}.trial_country = 'ZM' THEN 'ZMB'
  WHEN ${TABLE}.trial_country = 'ZW' THEN 'ZWE'
  ELSE NULL
  END ;;
}
#CASE WHEN
#DATE_DIFF(TODAY(), trial_date) <= 14
#THEN 0
#ELSE
#license_user_14/trial_started




#view: product_analytics {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: product_analytics {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }