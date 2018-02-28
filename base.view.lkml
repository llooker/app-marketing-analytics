view: base {
  extends: [dated_table]
  extension: required

  dimension: _data_day_of_quarter {
    group_label: "Data Date"
    label: "Day of Quarter"
    type: number
    sql: DATE_DIFF(
           ${_data_date},
          CAST(CONCAT(${_data_quarter}, '-01') as DATE),
          day) + 1
       ;;
  }

  dimension: current_day_of_quarter {
    hidden: yes
    type:  number
    sql: DATE_DIFF(CURRENT_DATE(), DATE_TRUNC(CURRENT_DATE(), QUARTER), DAY) ;;
  }

  dimension: current_day_of_month {
    hidden: yes
    type:  number
    sql: EXTRACT(DAY FROM TIMESTAMP(CURRENT_DATE())) ;;
  }

  dimension: current_day_of_week {
    hidden: yes
    type:  number
    sql: EXTRACT(DAYOFWEEK FROM TIMESTAMP(CURRENT_DATE()))  ;;
  }

  dimension: less_than_current_day_of_quarter {
    type: yesno
    sql: ${_data_day_of_quarter} < ${current_day_of_quarter} ;;
  }


  dimension: less_than_current_day_of_month {
    type: yesno
    sql: ${_data_day_of_month} < ${current_day_of_month} ;;
  }

  dimension: less_than_current_day_of_week {
    type: yesno
    sql: ${_data_day_of_week_index} < ${current_day_of_week} ;;
  }

  dimension: less_than_current_day_of_period {
    type: yesno
    sql: CASE WHEN {% parameter parameter %} = "1 week ago" THEN ${less_than_current_day_of_week}
        WHEN {% parameter parameter %} = "1 quarter ago" THEN ${less_than_current_day_of_quarter}
        WHEN {% parameter parameter %} = "1 month ago" THEN ${less_than_current_day_of_month}
        ELSE NULL
        END;;
  }

  parameter: parameter {}

  dimension: _data_next_quarter {
    hidden: yes
    type: date
    sql: DATE_ADD(CAST(CONCAT(${_data_quarter}, '-01') as DATE), INTERVAL 1 QUARTER) ;;
  }

  dimension:  _data_days_in_quarter {
    hidden: yes
    type: number
    sql: DATE_DIFF(
           ${_data_next_quarter},
           CAST(CONCAT(${_data_quarter}, '-01') as DATE),
           day) ;;
  }

  measure: _data_max_day_of_week_index {
    hidden: yes
    type: max
    sql: ${_data_day_of_week_index} ;;
  }

  measure: _data_max_day_of_month {
    hidden: yes
    type: max
    sql: ${_data_day_of_month} ;;
  }

  measure: _data_max_day_of_quarter {
    hidden: yes
    type: max
    sql: ${_data_day_of_quarter} ;;
  }

  measure: _data_max_day_of_year {
    hidden: yes
    type: max
    sql: ${_data_day_of_year} ;;
  }

  dimension: ad_network_type1 {
    hidden: yes
  }

  dimension: ad_network_type2 {
    hidden: yes
  }

  dimension: ad_network_type {
    type: string
    case: {
      when: {
        sql: ${ad_network_type1} = 'SHASTA_AD_NETWORK_TYPE_1_SEARCH' AND ${ad_network_type2} = 'SHASTA_AD_NETWORK_TYPE_2_SEARCH' ;;
        label: "Search"
      }
      when: {
        sql: ${ad_network_type1} = 'SHASTA_AD_NETWORK_TYPE_1_SEARCH' AND ${ad_network_type2} = 'SHASTA_AD_NETWORK_TYPE_2_SEARCH_PARTNERS' ;;
        label: "Search Partners"
      }
      when: {
        sql: ${ad_network_type1} = 'SHASTA_AD_NETWORK_TYPE_1_CONTENT' ;;
        label: "Content"
      }
      else: "Other"
    }
  }

  dimension: device {
    hidden: yes
  }

  dimension: device_type {
    type: string
    case: {
      when: {
        sql: ${device} LIKE '%Desktop%' ;;
        label: "Desktop"
      }
      when: {
        sql: ${device} LIKE '%Mobile%' ;;
        label: "Mobile"
      }
      when: {
        sql: ${device} LIKE '%Tablet%' ;;
        label: "Tablet"
      }
      else: "Other"
    }
  }
}