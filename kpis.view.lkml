 view: kpis {
   derived_table: {
     datagroup_trigger: etl_datagroup
     sql:
    with this_quarter_metrics as (
      SELECT
        master_stats.ExternalCustomerID as external_customer_id,
        COALESCE(SUM((master_stats.Cost / 1000000) ), 0) AS master_stats_total_cost_usd,
        COALESCE(SUM(master_stats.Conversions ), 0) AS master_stats_total_conversions,
        (COALESCE(SUM(master_stats.Conversions ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Clicks ), 0)),0)  AS master_stats_average_conversion_rate,
        (COALESCE(SUM((master_stats.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Conversions ), 0)),0)  AS master_stats_average_cost_per_conversion,
        (COALESCE(SUM((master_stats.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Impressions ), 0)),0)  AS master_stats_average_cost_per_impression,
        (COALESCE(SUM(master_stats.Interactions ), 0))*1.0/nullif((COALESCE(SUM(master_stats.Impressions ), 0)),0)  AS master_stats_average_interaction_rate
      FROM
      adwords_v201609.AccountBasicStats_6747157124  AS master_stats
      WHERE
        (((TIMESTAMP(master_stats._DATA_DATE) ) >= ((TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER))) AND (TIMESTAMP(master_stats._DATA_DATE) ) <
      ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ',
      CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))
      GROUP BY 1
      ),

      last_quarter_metrics as (
        SELECT
          master_stats.ExternalCustomerID as external_customer_id,
          COALESCE(SUM((master_stats.Cost / 1000000) ), 0) AS master_stats_total_cost_usd,
          COALESCE(SUM(master_stats.Conversions ), 0) AS master_stats_total_conversions,
          (COALESCE(SUM(master_stats.Conversions ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Clicks ), 0)),0)  AS master_stats_average_conversion_rate,
          (COALESCE(SUM((master_stats.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Conversions ), 0)),0)  AS master_stats_average_cost_per_conversion,
          (COALESCE(SUM((master_stats.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Impressions ), 0)),0)  AS master_stats_average_cost_per_impression,
          (COALESCE(SUM(master_stats.Interactions ), 0))*1.0/nullif((COALESCE(SUM(master_stats.Impressions ), 0)),0)  AS master_stats_average_interaction_rate
        FROM   adwords_v201609.AccountBasicStats_6747157124  AS master_stats
        WHERE
          (((TIMESTAMP(master_stats._DATA_DATE) ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP),
        QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))
        AND (TIMESTAMP(master_stats._DATA_DATE) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP),
        QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP))
        AS STRING))) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS
        TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS
        TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))
        AND

         (DATE_DIFF((CAST(TIMESTAMP(master_stats._DATA_DATE)  AS DATE)), CAST(CONCAT((FORMAT_TIMESTAMP('%Y-%m', TIMESTAMP_TRUNC(CAST(TIMESTAMP(master_stats._DATA_DATE)  AS TIMESTAMP), QUARTER))), '-01') as DATE),
          day) + 1) < (DATE_DIFF(CURRENT_DATE(), DATE_TRUNC(CURRENT_DATE(), QUARTER), DAY))
        GROUP BY 1
        ),

      this_month_metrics as (
        SELECT
          master_stats.ExternalCustomerID as external_customer_id,
          COALESCE(SUM((master_stats.Cost / 1000000) ), 0) AS master_stats_total_cost_usd,
          COALESCE(SUM(master_stats.Conversions ), 0) AS master_stats_total_conversions,
          (COALESCE(SUM(master_stats.Conversions ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Clicks ), 0)),0)  AS master_stats_average_conversion_rate,
          (COALESCE(SUM((master_stats.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Conversions ), 0)),0)  AS master_stats_average_cost_per_conversion,
          (COALESCE(SUM((master_stats.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Impressions ), 0)),0)  AS master_stats_average_cost_per_impression,
          (COALESCE(SUM(master_stats.Interactions ), 0))*1.0/nullif((COALESCE(SUM(master_stats.Impressions ), 0)),0)  AS master_stats_average_interaction_rate
        FROM  adwords_v201609.AccountBasicStats_6747157124    AS master_stats
        WHERE
          (((TIMESTAMP(master_stats._DATA_DATE) ) >= ((TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), MONTH))) AND (TIMESTAMP(master_stats._DATA_DATE) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC
        (CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), MONTH) AS DATE), INTERVAL 1 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), MONTH) AS TIMESTAMP)) AS STRING)))))))
        GROUP BY 1
      ),

      last_month_metrics as (
        SELECT
          master_stats.ExternalCustomerID as external_customer_id,
          COALESCE(SUM((master_stats.Cost / 1000000) ), 0) AS master_stats_total_cost_usd,
          COALESCE(SUM(master_stats.Conversions ), 0) AS master_stats_total_conversions,
          (COALESCE(SUM(master_stats.Conversions ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Clicks ), 0)),0)  AS master_stats_average_conversion_rate,
          (COALESCE(SUM((master_stats.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Conversions ), 0)),0)  AS master_stats_average_cost_per_conversion,
          (COALESCE(SUM((master_stats.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Impressions ), 0)),0)  AS master_stats_average_cost_per_impression,
          (COALESCE(SUM(master_stats.Interactions ), 0))*1.0/nullif((COALESCE(SUM(master_stats.Impressions ), 0)),0)  AS master_stats_average_interaction_rate
        FROM   adwords_v201609.AccountBasicStats_6747157124    AS master_stats
        WHERE
          (((TIMESTAMP(master_stats._DATA_DATE) ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), MONTH) AS DATE), INTERVAL -1 MONTH) AS STRING), ' ',
          CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), MONTH) AS TIMESTAMP)) AS STRING))))) AND (TIMESTAMP(master_stats._DATA_DATE) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP(CONCAT(CAST
          (DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), MONTH) AS DATE), INTERVAL -1 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP),
          MONTH) AS TIMESTAMP)) AS STRING))) AS DATE), INTERVAL 1 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), MONTH) AS DATE), INTERVAL -1 MONTH) AS STRING),
          ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), MONTH) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP)) AS STRING)))))))
        AND
         EXTRACT(DAY FROM TIMESTAMP(master_stats._DATA_DATE) ) < EXTRACT(DAY FROM TIMESTAMP(CURRENT_DATE()) )
        GROUP BY 1
        ),

        this_week_metrics as (
          SELECT
            master_stats.ExternalCustomerID as external_customer_id,
            COALESCE(SUM((master_stats.Cost / 1000000) ), 0) AS master_stats_total_cost_usd,
            COALESCE(SUM(master_stats.Conversions ), 0) AS master_stats_total_conversions,
            (COALESCE(SUM(master_stats.Conversions ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Clicks ), 0)),0)  AS master_stats_average_conversion_rate,
            (COALESCE(SUM((master_stats.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Conversions ), 0)),0)  AS master_stats_average_cost_per_conversion,
            (COALESCE(SUM((master_stats.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Impressions ), 0)),0)  AS master_stats_average_cost_per_impression,
            (COALESCE(SUM(master_stats.Interactions ), 0))*1.0/nullif((COALESCE(SUM(master_stats.Impressions ), 0)),0)  AS master_stats_average_interaction_rate
          FROM adwords_v201609.AccountBasicStats_6747157124    AS master_stats

          WHERE
            (((TIMESTAMP(master_stats._DATA_DATE) ) >= ((TIMESTAMP_ADD(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), DAY), INTERVAL (0 - CAST((CASE WHEN (EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY))
          - 1) - 1 + 7 < 0 THEN -1 * (ABS((EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) - (ABS(7) * CAST(FLOOR(ABS(((EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) / (7))) AS INT64)))
          ELSE ABS((EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) - (ABS(7) * CAST(FLOOR(ABS(((EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) / (7))) AS INT64)) END) AS INT64)) DAY)))
          AND (TIMESTAMP(master_stats._DATA_DATE) ) < ((TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), DAY), INTERVAL (0 - CAST((CASE WHEN (EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY))
          - 1) - 1 + 7 < 0 THEN -1 * (ABS((EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) - (ABS(7) * CAST(FLOOR(ABS(((EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) / (7))) AS INT64))) ELSE
          ABS((EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) - (ABS(7) * CAST(FLOOR(ABS(((EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) / (7))) AS INT64)) END) AS INT64)) DAY), INTERVAL (1 * 7) DAY)))))
          GROUP BY 1
        ),

        last_week_metrics as (

          SELECT
            master_stats.ExternalCustomerID as external_customer_id,
            COALESCE(SUM((master_stats.Cost / 1000000) ), 0) AS master_stats_total_cost_usd,
            COALESCE(SUM(master_stats.Conversions ), 0) AS master_stats_total_conversions,
            (COALESCE(SUM(master_stats.Conversions ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Clicks ), 0)),0)  AS master_stats_average_conversion_rate,
            (COALESCE(SUM((master_stats.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Conversions ), 0)),0)  AS master_stats_average_cost_per_conversion,
            (COALESCE(SUM((master_stats.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Impressions ), 0)),0)  AS master_stats_average_cost_per_impression,
            (COALESCE(SUM(master_stats.Interactions ), 0))*1.0/nullif((COALESCE(SUM(master_stats.Impressions ), 0)),0)  AS master_stats_average_interaction_rate
          FROM   adwords_v201609.AccountBasicStats_6747157124   AS master_stats

          WHERE
            (((TIMESTAMP(master_stats._DATA_DATE) ) >= ((TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), DAY), INTERVAL (0 - CAST((CASE WHEN (EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY))
          - 1) - 1 + 7 < 0 THEN -1 * (ABS((EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) - (ABS(7) * CAST(FLOOR(ABS(((EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) / (7))) AS INT64))) ELSE ABS((EXTRACT
          (DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) - (ABS(7) * CAST(FLOOR(ABS(((EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) / (7))) AS INT64)) END) AS INT64)) DAY), INTERVAL (-1 * 7) DAY))) AND (TIMESTAMP
          (master_stats._DATA_DATE) ) < ((TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), DAY), INTERVAL (0 - CAST((CASE WHEN (EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1)
          - 1 + 7 < 0 THEN -1 * (ABS((EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) - (ABS(7) * CAST(FLOOR(ABS(((EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) / (7))) AS INT64))) ELSE ABS((EXTRACT(DAYOFWEEK
          FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) - (ABS(7) * CAST(FLOOR(ABS(((EXTRACT(DAYOFWEEK FROM TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)) - 1) - 1 + 7) / (7))) AS INT64)) END) AS INT64)) DAY), INTERVAL (-1 * 7) DAY), INTERVAL (1 * 7) DAY)))))
          AND
            EXTRACT(DAYOFWEEK FROM TIMESTAMP(master_stats._DATA_DATE) )  < EXTRACT(DAYOFWEEK FROM TIMESTAMP(CURRENT_DATE()) )
          GROUP BY 1
        )

        SELECT
          this_quarter_metrics.master_stats_total_cost_usd as this_quarter_total_cost,
          this_quarter_metrics.master_stats_total_conversions as this_quarter_conversions,
          this_quarter_metrics.master_stats_average_conversion_rate as this_quarter_avg_conversion_rate,
          this_quarter_metrics.master_stats_average_cost_per_conversion as this_quarter_avg_cost_per_conversion,
          this_quarter_metrics.master_stats_average_interaction_rate as this_quarter_avg_interaction_rate,
          this_quarter_metrics.master_stats_average_cost_per_impression as this_quarter_avg_cost_per_impression,

          last_quarter_metrics.master_stats_total_cost_usd as last_quarter_total_cost,
          last_quarter_metrics.master_stats_total_conversions as last_quarter_conversions,
          last_quarter_metrics.master_stats_average_conversion_rate as last_quarter_avg_conversion_rate,
          last_quarter_metrics.master_stats_average_cost_per_conversion as last_quarter_avg_cost_per_conversion,
          last_quarter_metrics.master_stats_average_interaction_rate as last_quarter_avg_interaction_rate,
          last_quarter_metrics.master_stats_average_cost_per_impression as last_quarter_avg_cost_per_impression,

          this_month_metrics.master_stats_total_cost_usd as this_month_total_cost,
          this_month_metrics.master_stats_total_conversions as this_month_conversions,
          this_month_metrics.master_stats_average_conversion_rate as this_month_avg_conversion_rate,
          this_month_metrics.master_stats_average_cost_per_conversion as this_month_avg_cost_per_conversion,
          this_month_metrics.master_stats_average_interaction_rate as this_month_avg_interaction_rate,
          this_month_metrics.master_stats_average_cost_per_impression as this_month_avg_cost_per_impression,

          last_month_metrics.master_stats_total_cost_usd as last_month_total_cost,
          last_month_metrics.master_stats_total_conversions as last_month_conversions,
          last_month_metrics.master_stats_average_conversion_rate as last_month_avg_conversion_rate,
          last_month_metrics.master_stats_average_cost_per_conversion as last_month_avg_cost_per_conversion,
          last_month_metrics.master_stats_average_interaction_rate as last_month_avg_interaction_rate,
          last_month_metrics.master_stats_average_cost_per_impression as last_month_avg_cost_per_impression,

          this_week_metrics.master_stats_total_cost_usd as this_week_total_cost,
          this_week_metrics.master_stats_total_conversions as this_week_conversions,
          this_week_metrics.master_stats_average_conversion_rate as this_week_avg_conversion_rate,
          this_week_metrics.master_stats_average_cost_per_conversion as this_week_avg_cost_per_conversion,
          this_week_metrics.master_stats_average_interaction_rate as this_week_avg_interaction_rate,
          this_week_metrics.master_stats_average_cost_per_impression as this_week_avg_cost_per_impression,

          last_week_metrics.master_stats_total_cost_usd as last_week_total_cost,
          last_week_metrics.master_stats_total_conversions as last_week_conversions,
          last_week_metrics.master_stats_average_conversion_rate as last_week_avg_conversion_rate,
          last_week_metrics.master_stats_average_cost_per_conversion as last_week_avg_cost_per_conversion,
          last_week_metrics.master_stats_average_interaction_rate as last_week_avg_interaction_rate,
          last_week_metrics.master_stats_average_cost_per_impression as last_week_avg_cost_per_impression

        FROM this_quarter_metrics
        LEFT JOIN last_quarter_metrics ON this_quarter_metrics.external_customer_id = last_quarter_metrics.external_customer_id
        LEFT JOIN this_month_metrics ON this_quarter_metrics.external_customer_id = this_month_metrics.external_customer_id
        LEFT JOIN last_month_metrics ON this_quarter_metrics.external_customer_id = last_month_metrics.external_customer_id
        LEFT JOIN this_week_metrics ON this_quarter_metrics.external_customer_id = this_week_metrics.external_customer_id
        LEFT JOIN last_week_metrics ON this_quarter_metrics.external_customer_id = last_week_metrics.external_customer_id

       ;;
   }

  dimension: this_quarter_total_cost {
    type: number
    sql: ${TABLE}.this_quarter_total_cost ;;
    group_label: "This Quarter"
    hidden: yes
   }

  dimension: this_quarter_conversions {
    type: number
    sql: ${TABLE}.this_quarter_conversions ;;
    group_label: "This Quarter"
    hidden: yes
  }

  dimension: this_quarter_avg_conversion_rate {
    type: number
    sql: ${TABLE}.this_quarter_avg_conversion_rate ;;
    group_label: "This Quarter"
    hidden: yes
  }

  dimension: this_quarter_avg_cost_per_conversion {
    type: number
    sql: ${TABLE}.this_quarter_avg_cost_per_conversion ;;
    group_label: "This Quarter"
    hidden: yes
  }

  dimension: this_quarter_avg_interaction_rate {
    type: number
    sql: ${TABLE}.this_quarter_avg_interaction_rate ;;
    group_label: "This Quarter"
    hidden: yes
  }

  dimension: this_quarter_avg_cost_per_impression {
    type: number
    sql: ${TABLE}.this_quarter_avg_cost_per_impression ;;
    group_label: "This Quarter"
    hidden: yes
  }

  dimension: last_quarter_total_cost {
    type: number
    sql: ${TABLE}.last_quarter_total_cost ;;
    group_label: "Last Quarter"
    hidden: yes
  }

  dimension: last_quarter_avg_conversion_rate {
    type: number
    sql: ${TABLE}.last_quarter_avg_conversion_rate ;;
    group_label: "Last Quarter"
    hidden: yes
  }

  dimension: last_quarter_conversions {
    type: number
    sql: ${TABLE}.last_quarter_conversions ;;
    group_label: "Last Quarter"
    hidden: yes
  }

  dimension: last_quarter_avg_cost_per_conversion {
    type: number
    sql: ${TABLE}.last_quarter_avg_cost_per_conversion ;;
    group_label: "Last Quarter"
    hidden: yes
  }

  dimension: last_quarter_avg_interaction_rate {
    type: number
    sql: ${TABLE}.last_quarter_avg_interaction_rate ;;
    group_label: "Last Quarter"
    hidden: yes
  }

  dimension: last_quarter_avg_cost_per_impression {
    type: number
    sql: ${TABLE}.last_quarter_avg_cost_per_impression ;;
    group_label: "This Quarter"
    hidden: yes
  }

  dimension: this_month_total_cost {
    type: number
    sql: ${TABLE}.this_month_total_cost ;;
    group_label: "This Month"
    hidden: yes
  }

  dimension: this_month_conversions {
    type: number
    sql: ${TABLE}.this_month_conversions ;;
    group_label: "This Month"
    hidden: yes
  }

  dimension: this_month_avg_conversion_rate {
    type: number
    sql: ${TABLE}.this_month_avg_conversion_rate ;;
    group_label: "This Month"
    hidden: yes
  }

  dimension: this_month_avg_cost_per_conversion {
    type: number
    sql: ${TABLE}.this_month_avg_cost_per_conversion ;;
    group_label: "This Month"
    hidden: yes
  }

  dimension: this_month_avg_interaction_rate {
    type: number
    sql: ${TABLE}.this_month_avg_interaction_rate ;;
    group_label: "This Month"
    hidden: yes
  }

  dimension: this_month_avg_cost_per_impression {
    type: number
    sql: ${TABLE}.this_month_avg_cost_per_impression ;;
    group_label: "This Month"
    hidden: yes
  }

  dimension: last_month_total_cost {
    type: number
    sql: ${TABLE}.last_month_total_cost ;;
    group_label: "Last Month"
    hidden: yes
  }

  dimension: last_month_avg_conversion_rate {
    type: number
    sql: ${TABLE}.last_month_avg_conversion_rate ;;
    group_label: "Last Month"
    hidden: yes
  }

  dimension: last_month_conversions {
    type: number
    sql: ${TABLE}.last_month_conversions ;;
    group_label: "Last Month"
    hidden: yes
  }

  dimension: last_month_avg_cost_per_conversion {
    type: number
    sql: ${TABLE}.last_month_avg_cost_per_conversion ;;
    group_label: "Last Month"
    hidden: yes
  }

  dimension: last_month_avg_interaction_rate {
    type: number
    sql: ${TABLE}.last_month_avg_interaction_rate ;;
    group_label: "Last Month"
    hidden: yes
  }

  dimension: last_month_avg_cost_per_impression {
    type: number
    sql: ${TABLE}.last_month_avg_cost_per_impression ;;
    group_label: "Last Month"
    hidden: yes
  }

  dimension: this_week_total_cost {
    type: number
    sql: ${TABLE}.this_week_total_cost ;;
    group_label: "This Week"
    hidden: yes
  }

  dimension: this_week_conversions {
    type: number
    sql: ${TABLE}.this_week_conversions ;;
    group_label: "This Week"
    hidden: yes
  }

  dimension: this_week_avg_conversion_rate {
    type: number
    sql: ${TABLE}.this_week_avg_conversion_rate ;;
    group_label: "This Week"
    hidden: yes
  }

  dimension: this_week_avg_cost_per_conversion {
    type: number
    sql: ${TABLE}.this_week_avg_cost_per_conversion ;;
    group_label: "This Week"
    hidden: yes
  }

  dimension: this_week_avg_interaction_rate {
    type: number
    sql: ${TABLE}.this_week_avg_interaction_rate ;;
    group_label: "This Week"
    hidden: yes
  }

  dimension: this_week_avg_cost_per_impression {
    type: number
    sql: ${TABLE}.this_week_avg_cost_per_impression ;;
    group_label: "This Week"
    hidden: yes
  }

  dimension: last_week_total_cost {
    type: number
    sql: ${TABLE}.last_week_total_cost ;;
    group_label: "Last Week"
    hidden: yes
  }

  dimension: last_week_avg_conversion_rate {
    type: number
    sql: ${TABLE}.last_week_avg_conversion_rate ;;
    group_label: "Last Week"
    hidden: yes
  }

  dimension: last_week_conversions {
    type: number
    sql: ${TABLE}.last_week_conversions ;;
    group_label: "Last Week"
    hidden: yes
  }

  dimension: last_week_avg_cost_per_conversion {
    type: number
    sql: ${TABLE}.last_week_avg_cost_per_conversion ;;
    group_label: "Last Week"
    hidden: yes
  }

  dimension: last_week_avg_interaction_rate {
    type: number
    sql: ${TABLE}.last_week_avg_interaction_rate ;;
    group_label: "Last Week"
    hidden: yes
  }

  dimension: last_week_avg_cost_per_impression {
    type: number
    sql: ${TABLE}.last_week_avg_cost_per_impression ;;
    group_label: "Last Week"
    hidden: yes
  }

  parameter: timeframe_filter {
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
  }


  measure: total_cost {
    type: sum
    sql: CASE
          WHEN {% parameter timeframe_filter %} = 'Quarter' THEN ${this_quarter_total_cost}
          WHEN {% parameter timeframe_filter %} = 'Month' THEN ${this_month_total_cost}
          WHEN {% parameter timeframe_filter %} = 'Week' THEN ${this_week_total_cost}
          ELSE NULL
          END ;;
    value_format_name: usd_0
  }

  measure: total_cost_last_period {
    type: sum
    sql: CASE
          WHEN {% parameter timeframe_filter %} = 'Quarter' THEN ${last_quarter_total_cost}
          WHEN {% parameter timeframe_filter %} = 'Month' THEN ${last_month_total_cost}
          WHEN {% parameter timeframe_filter %} = 'Week' THEN ${last_week_total_cost}
          ELSE NULL
          END ;;
    value_format_name: usd_0
  }

  measure: avg_conversion_rate {
    type: average
    sql: CASE
          WHEN {% parameter timeframe_filter %} = 'Quarter' THEN ${this_quarter_avg_conversion_rate}
          WHEN {% parameter timeframe_filter %} = 'Month' THEN ${this_month_avg_conversion_rate}
          WHEN {% parameter timeframe_filter %} = 'Week' THEN ${this_week_avg_conversion_rate}
          ELSE NULL
          END ;;
    value_format_name: percent_2
  }

  measure: avg_conversion_rate_last_period {
    type: average
    sql: CASE
          WHEN {% parameter timeframe_filter %} = 'Quarter' THEN ${last_quarter_avg_conversion_rate}
          WHEN {% parameter timeframe_filter %} = 'Month' THEN ${last_month_avg_conversion_rate}
          WHEN {% parameter timeframe_filter %} = 'Week' THEN ${last_week_avg_conversion_rate}
          ELSE NULL
          END ;;
    value_format_name: percent_2
  }

  measure: conversions {
    type: sum
    sql: CASE
          WHEN {% parameter timeframe_filter %} = 'Quarter' THEN ${this_quarter_conversions}
          WHEN {% parameter timeframe_filter %} = 'Month' THEN ${this_month_conversions}
          WHEN {% parameter timeframe_filter %} = 'Week' THEN ${this_week_conversions}
          ELSE NULL
          END ;;
    value_format_name: decimal_0
  }

  measure: conversions_last_period {
    type: sum
    sql: CASE
          WHEN {% parameter timeframe_filter %} = 'Quarter' THEN ${last_quarter_conversions}
          WHEN {% parameter timeframe_filter %} = 'Month' THEN ${last_month_conversions}
          WHEN {% parameter timeframe_filter %} = 'Week' THEN ${last_week_conversions}
          ELSE NULL
          END ;;
    value_format_name: decimal_0
  }

  measure: avg_cost_per_conversion {
    type: average
    sql: CASE
          WHEN {% parameter timeframe_filter %} = 'Quarter' THEN ${this_quarter_avg_cost_per_conversion}
          WHEN {% parameter timeframe_filter %} = 'Month' THEN ${this_month_avg_cost_per_conversion}
          WHEN {% parameter timeframe_filter %} = 'Week' THEN ${this_week_avg_cost_per_conversion}
          ELSE NULL
          END ;;
    value_format_name: usd
  }

  measure: avg_cost_per_conversion_last_period {
    type: average
    sql: CASE
          WHEN {% parameter timeframe_filter %} = 'Quarter' THEN ${last_quarter_avg_cost_per_conversion}
          WHEN {% parameter timeframe_filter %} = 'Month' THEN ${last_month_avg_cost_per_conversion}
          WHEN {% parameter timeframe_filter %} = 'Week' THEN ${last_week_avg_cost_per_conversion}
          ELSE NULL
          END ;;
    value_format_name: usd
  }


  measure: avg_interaction_rate {
    type: average
    sql: CASE
          WHEN {% parameter timeframe_filter %} = 'Quarter' THEN ${this_quarter_avg_interaction_rate}
          WHEN {% parameter timeframe_filter %} = 'Month' THEN ${this_month_avg_interaction_rate}
          WHEN {% parameter timeframe_filter %} = 'Week' THEN ${this_week_avg_interaction_rate}
          ELSE NULL
          END ;;
    value_format_name: percent_2
  }

  measure: avg_interaction_rate_last_period {
    type: average
    sql: CASE
          WHEN {% parameter timeframe_filter %} = 'Quarter' THEN ${last_quarter_avg_interaction_rate}
          WHEN {% parameter timeframe_filter %} = 'Month' THEN ${last_month_avg_interaction_rate}
          WHEN {% parameter timeframe_filter %} = 'Week' THEN ${last_week_avg_interaction_rate}
          ELSE NULL
          END ;;
    value_format_name: percent_2
  }

  measure: avg_cost_per_ipmression {
    type: average
    sql: CASE
          WHEN {% parameter timeframe_filter %} = 'Quarter' THEN ${this_quarter_avg_cost_per_impression}
          WHEN {% parameter timeframe_filter %} = 'Month' THEN ${this_month_avg_cost_per_impression}
          WHEN {% parameter timeframe_filter %} = 'Week' THEN ${this_week_avg_cost_per_impression}
          ELSE NULL
          END ;;
    value_format_name: usd
  }

  measure: avg_cost_per_impression_last_period {
    type: average
    sql: CASE
          WHEN {% parameter timeframe_filter %} = 'Quarter' THEN ${last_quarter_avg_cost_per_impression}
          WHEN {% parameter timeframe_filter %} = 'Month' THEN ${last_month_avg_cost_per_impression}
          WHEN {% parameter timeframe_filter %} = 'Week' THEN ${last_week_avg_cost_per_impression}
          ELSE NULL
          END ;;
    value_format_name: usd
  }


 }
