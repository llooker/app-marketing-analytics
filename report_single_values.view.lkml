view: report_single_values {
  derived_table: {
#     datagroup_trigger: etl_datagroup
    sql:
      WITH underperforming_ad_groups as (
        WITH campaign_avg_cpa AS (
          SELECT
            ad_impressions.ExternalCustomerId  AS external_customer_id,
            ad_impressions.CampaignId  AS campaign_id,
            COALESCE(SUM(ad_impressions.Cost ), 0) AS cost,
            COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS cost_usd,
            COALESCE(SUM(ad_impressions.Clicks ), 0) AS clicks,
            COALESCE(SUM(ad_impressions.Conversions ), 0) AS conversions,
            COALESCE(SUM(ad_impressions.Impressions ), 0) AS impressions,
            COALESCE(SUM(ad_impressions.Interactions ), 0) AS interactions
          FROM
            adwords_v201609.CampaignBasicStats_6747157124
          AS ad_impressions
          WHERE
                  ((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))
          GROUP BY 1,2
        )
        SELECT
          ad_group.AdGroupId  AS ad_group_ad_group_id,
          ad_group.CampaignId  AS ad_group_campaign_id,
          campaign.CampaignId  AS campaign_campaign_id,
          campaign.CampaignName  AS campaign_campaign_name,
          ad_group.AdGroupName  AS ad_group_ad_group_name
        FROM
          adwords_v201609.AdGroupBasicStats_6747157124
        AS ad_impressions
        LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad_impressions.AdGroupId = ad_group.AdGroupId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad_impressions.CampaignId = campaign.CampaignId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(campaign._DATA_DATE))  AS DATE))
        LEFT JOIN campaign_avg_cpa ON ad_impressions.ExternalCustomerId = campaign_avg_cpa.external_customer_id AND
              ad_impressions.CampaignId = campaign_avg_cpa.campaign_id
        WHERE (((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))) AND (ad_group.AdGroupStatus = 'ENABLED')
        GROUP BY 1,2,3,4,5
        HAVING (((COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(ad_impressions.Conversions ), 0)),0)) / NULLIF(((COALESCE(SUM(campaign_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(campaign_avg_cpa.conversions ), 0)),0)),0) > 1.2) AND (((COALESCE(SUM(ad_impressions.Clicks ), 0))*1.0/nullif((COALESCE(SUM(ad_impressions.Impressions ), 0)),0)) / NULLIF(((COALESCE(SUM(campaign_avg_cpa.clicks ), 0)) / NULLIF((COALESCE(SUM(campaign_avg_cpa.impressions ), 0)),0)),0) < 0.8)
      ),

      underperforming_ad_groups_last_quarter as (
        WITH campaign_avg_cpa AS (SELECT
          ad_impressions.ExternalCustomerId  AS external_customer_id,
          ad_impressions.CampaignId  AS campaign_id,
          COALESCE(SUM(ad_impressions.Cost ), 0) AS cost,
          COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS cost_usd,
          COALESCE(SUM(ad_impressions.Clicks ), 0) AS clicks,
          COALESCE(SUM(ad_impressions.Conversions ), 0) AS conversions,
          COALESCE(SUM(ad_impressions.Impressions ), 0) AS impressions,
          COALESCE(SUM(ad_impressions.Interactions ), 0) AS interactions
        FROM
          adwords_v201609.CampaignBasicStats_6747157124
        AS ad_impressions
        WHERE
          ((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))
        GROUP BY 1,2)
        SELECT
          ad_group.AdGroupId  AS ad_group_ad_group_id,
          ad_group.CampaignId  AS ad_group_campaign_id,
          campaign.CampaignId  AS campaign_campaign_id,
          campaign.CampaignName  AS campaign_campaign_name,
          ad_group.AdGroupName  AS ad_group_ad_group_name
        FROM
          adwords_v201609.AdGroupBasicStats_6747157124
        AS ad_impressions
        LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad_impressions.AdGroupId = ad_group.AdGroupId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad_impressions.CampaignId = campaign.CampaignId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(campaign._DATA_DATE))  AS DATE))
        LEFT JOIN campaign_avg_cpa ON ad_impressions.ExternalCustomerId = campaign_avg_cpa.external_customer_id AND
              ad_impressions.CampaignId = campaign_avg_cpa.campaign_id

        WHERE (((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))) AND ((DATE_DIFF(
                   (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)),
                  CAST(CONCAT((FORMAT_TIMESTAMP('%Y-%m', TIMESTAMP_TRUNC(CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS TIMESTAMP), QUARTER))), '-01') as DATE),
                  day) + 1) <= (DATE_DIFF(CURRENT_DATE(), DATE_TRUNC(CURRENT_DATE(), QUARTER), DAY))) AND (ad_group.AdGroupStatus = 'ENABLED')
        GROUP BY 1,2,3,4,5
        HAVING (((COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(ad_impressions.Conversions ), 0)),0)) / NULLIF(((COALESCE(SUM(campaign_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(campaign_avg_cpa.conversions ), 0)),0)),0) > 1.2) AND (((COALESCE(SUM(ad_impressions.Clicks ), 0))*1.0/nullif((COALESCE(SUM(ad_impressions.Impressions ), 0)),0)) / NULLIF(((COALESCE(SUM(campaign_avg_cpa.clicks ), 0)) / NULLIF((COALESCE(SUM(campaign_avg_cpa.impressions ), 0)),0)),0) < 0.8)
        ORDER BY 4
      ),

      underperforming_keywords AS (
        WITH ad_group_avg_cpa AS (
          SELECT
            ad_impressions.ExternalCustomerId  AS external_customer_id,
            ad_impressions.CampaignId  AS campaign_id,
            ad_impressions.AdGroupId  AS ad_group_id,
            COALESCE(SUM(ad_impressions.Cost ), 0) AS cost,
            COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS cost_usd,
            COALESCE(SUM(ad_impressions.Clicks ), 0) AS clicks,
            COALESCE(SUM(ad_impressions.Conversions ), 0) AS conversions,
            COALESCE(SUM(ad_impressions.Impressions ), 0) AS impressions,
            COALESCE(SUM(ad_impressions.Interactions ), 0) AS interactions
          FROM
            adwords_v201609.AdGroupBasicStats_6747157124
          AS ad_impressions
          GROUP BY 1,2,3
        )
        SELECT
          keyword.Criteria  AS keyword_criteria,
          ad_group.AdGroupId  AS ad_group_ad_group_id,
          ad_group.CampaignId  AS ad_group_campaign_id,
          campaign.CampaignId  AS campaign_campaign_id,
          ad_group.AdGroupName  AS ad_group_ad_group_name,
          campaign.CampaignName  AS campaign_campaign_name
        FROM
            adwords_v201609.KeywordBasicStats_6747157124
            AS ad_impressions
        LEFT JOIN adwords_v201609.Keyword_6747157124  AS keyword ON (CONCAT(CAST(ad_impressions.AdGroupId AS STRING), "-", CAST(ad_impressions.CriterionId AS STRING))) = (CONCAT(CAST(keyword.AdGroupId AS STRING), "-", CAST(keyword.CriterionId AS STRING))) AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(keyword._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad_impressions.AdGroupId = ad_group.AdGroupId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad_impressions.CampaignId = campaign.CampaignId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(campaign._DATA_DATE))  AS DATE))
        LEFT JOIN ad_group_avg_cpa ON ad_impressions.ExternalCustomerId = ad_group_avg_cpa.external_customer_id AND
              ad_impressions.CampaignId = ad_group_avg_cpa.campaign_id AND
              ad_impressions.AdGroupId = ad_group_avg_cpa.ad_group_id

        WHERE (((REPLACE(keyword.Status, "Status_", "")) = 'Active')) AND (((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))))))))
        GROUP BY 1,2,3,4,5,6
        HAVING
          (((COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(ad_impressions.Conversions ), 0)),0)) / NULLIF(((COALESCE(SUM(ad_group_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(ad_group_avg_cpa.conversions ), 0)),0)),0) > 1.2)
      ),

      underperforming_keywords_last_quarter AS (
        WITH ad_group_avg_cpa AS (SELECT
          ad_impressions.ExternalCustomerId  AS external_customer_id,
          ad_impressions.CampaignId  AS campaign_id,
          ad_impressions.AdGroupId  AS ad_group_id,
          COALESCE(SUM(ad_impressions.Cost ), 0) AS cost,
          COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS cost_usd,
          COALESCE(SUM(ad_impressions.Clicks ), 0) AS clicks,
          COALESCE(SUM(ad_impressions.Conversions ), 0) AS conversions,
          COALESCE(SUM(ad_impressions.Impressions ), 0) AS impressions,
          COALESCE(SUM(ad_impressions.Interactions ), 0) AS interactions
        FROM

              adwords_v201609.AdGroupBasicStats_6747157124

            AS ad_impressions

        GROUP BY 1,2,3)
        SELECT
          keyword.Criteria  AS keyword_criteria,
          ad_group.AdGroupId  AS ad_group_ad_group_id,
          ad_group.CampaignId  AS ad_group_campaign_id,
          campaign.CampaignId  AS campaign_campaign_id,
          ad_group.AdGroupName  AS ad_group_ad_group_name,
          campaign.CampaignName  AS campaign_campaign_name
        FROM
            adwords_v201609.KeywordBasicStats_6747157124
            AS ad_impressions
        LEFT JOIN adwords_v201609.Keyword_6747157124  AS keyword ON (CONCAT(CAST(ad_impressions.AdGroupId AS STRING), "-", CAST(ad_impressions.CriterionId AS STRING))) = (CONCAT(CAST(keyword.AdGroupId AS STRING), "-", CAST(keyword.CriterionId AS STRING))) AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(keyword._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad_impressions.AdGroupId = ad_group.AdGroupId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad_impressions.CampaignId = campaign.CampaignId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(campaign._DATA_DATE))  AS DATE))
        LEFT JOIN ad_group_avg_cpa ON ad_impressions.ExternalCustomerId = ad_group_avg_cpa.external_customer_id AND
              ad_impressions.CampaignId = ad_group_avg_cpa.campaign_id AND
              ad_impressions.AdGroupId = ad_group_avg_cpa.ad_group_id

        WHERE (((REPLACE(keyword.Status, "Status_", "")) = 'Active')) AND (((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))) AND ((DATE_DIFF(
                   (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)),
                  CAST(CONCAT((FORMAT_TIMESTAMP('%Y-%m', TIMESTAMP_TRUNC(CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS TIMESTAMP), QUARTER))), '-01') as DATE),
                  day) + 1) <= (DATE_DIFF(CURRENT_DATE(), DATE_TRUNC(CURRENT_DATE(), QUARTER), DAY)))
        GROUP BY 1,2,3,4,5,6
        HAVING
          (((COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(ad_impressions.Conversions ), 0)),0)) / NULLIF(((COALESCE(SUM(ad_group_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(ad_group_avg_cpa.conversions ), 0)),0)),0) > 1.2)
      ),

      underperforming_ads AS (
        WITH ad_group_avg_cpa AS (
          SELECT
            ad_impressions.ExternalCustomerId  AS external_customer_id,
            ad_impressions.CampaignId  AS campaign_id,
            ad_impressions.AdGroupId  AS ad_group_id,
            COALESCE(SUM(ad_impressions.Cost ), 0) AS cost,
            COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS cost_usd,
            COALESCE(SUM(ad_impressions.Clicks ), 0) AS clicks,
            COALESCE(SUM(ad_impressions.Conversions ), 0) AS conversions,
            COALESCE(SUM(ad_impressions.Impressions ), 0) AS impressions,
            COALESCE(SUM(ad_impressions.Interactions ), 0) AS interactions
          FROM
            adwords_v201609.AdGroupBasicStats_6747157124
          AS ad_impressions
          GROUP BY 1,2,3
        )
        SELECT
          ad.AdGroupId  AS ad_ad_group_id,
          ad.CampaignId  AS ad_campaign_id,
          SUBSTR(CONCAT(
              COALESCE(CONCAT(ad.Headline, "\n"),"")
              , COALESCE(CONCAT(ad.HeadlinePart1, "\n"),"")
              , COALESCE(CONCAT(ad.HeadlinePart2, "\n"),"")
              ), 0, 50)  AS ad_creative,
          ad_group.AdGroupId  AS ad_group_ad_group_id,
          ad_group.CampaignId  AS ad_group_campaign_id,
          campaign.CampaignId  AS campaign_campaign_id,
          ad_group.AdGroupName  AS ad_group_ad_group_name,
          campaign.CampaignName  AS campaign_campaign_name
        FROM
            adwords_v201609.AdBasicStats_6747157124
            AS ad_impressions
        LEFT JOIN adwords_v201609.Ad_6747157124  AS ad ON ad.CreativeId = ad_impressions.CreativeId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad_impressions.AdGroupId = ad_group.AdGroupId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad_impressions.CampaignId = campaign.CampaignId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(campaign._DATA_DATE))  AS DATE))
        LEFT JOIN ad_group_avg_cpa ON ad_impressions.ExternalCustomerId = ad_group_avg_cpa.external_customer_id AND
              ad_impressions.CampaignId = ad_group_avg_cpa.campaign_id AND
              ad_impressions.AdGroupId = ad_group_avg_cpa.ad_group_id

        WHERE (((REPLACE(ad.Status, "Status_", "")) = 'Enabled')) AND (((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))))))))
        GROUP BY 1,2,3,4,5,6,7,8
        HAVING
          (((COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(ad_impressions.Conversions ), 0)),0)) / NULLIF(((COALESCE(SUM(ad_group_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(ad_group_avg_cpa.conversions ), 0)),0)),0) > 1.2)
      ),

      underperforming_ads_last_quarter as (
         WITH ad_group_avg_cpa AS (
            SELECT
              ad_impressions.ExternalCustomerId  AS external_customer_id,
              ad_impressions.CampaignId  AS campaign_id,
              ad_impressions.AdGroupId  AS ad_group_id,
              COALESCE(SUM(ad_impressions.Cost ), 0) AS cost,
              COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS cost_usd,
              COALESCE(SUM(ad_impressions.Clicks ), 0) AS clicks,
              COALESCE(SUM(ad_impressions.Conversions ), 0) AS conversions,
              COALESCE(SUM(ad_impressions.Impressions ), 0) AS impressions,
              COALESCE(SUM(ad_impressions.Interactions ), 0) AS interactions
            FROM
              adwords_v201609.AdGroupBasicStats_6747157124
            AS ad_impressions

            GROUP BY 1,2,3
          )
          SELECT
            ad.AdGroupId  AS ad_ad_group_id,
            ad.CampaignId  AS ad_campaign_id,
            SUBSTR(CONCAT(
                COALESCE(CONCAT(ad.Headline, "\n"),"")
                , COALESCE(CONCAT(ad.HeadlinePart1, "\n"),"")
                , COALESCE(CONCAT(ad.HeadlinePart2, "\n"),"")
                ), 0, 50)  AS ad_creative,
            ad_group.AdGroupId  AS ad_group_ad_group_id,
            ad_group.CampaignId  AS ad_group_campaign_id,
            campaign.CampaignId  AS campaign_campaign_id,
            ad_group.AdGroupName  AS ad_group_ad_group_name,
            campaign.CampaignName  AS campaign_campaign_name,
            (COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(ad_impressions.Conversions ), 0)),0)  AS ad_impressions_average_cost_per_conversion,
            ((COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(ad_impressions.Conversions ), 0)),0)) / NULLIF(((COALESCE(SUM(ad_group_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(ad_group_avg_cpa.conversions ), 0)),0)),0) AS ad_group_avg_cpa_cpa_compared_to_average_for_ad_group
          FROM
              adwords_v201609.AdBasicStats_6747157124
              AS ad_impressions
          LEFT JOIN adwords_v201609.Ad_6747157124  AS ad ON ad.CreativeId = ad_impressions.CreativeId AND
                (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad._DATA_DATE))  AS DATE))
          LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad_impressions.AdGroupId = ad_group.AdGroupId AND
                (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE))
          LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad_impressions.CampaignId = campaign.CampaignId AND
                (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(campaign._DATA_DATE))  AS DATE))
          LEFT JOIN ad_group_avg_cpa ON ad_impressions.ExternalCustomerId = ad_group_avg_cpa.external_customer_id AND
                ad_impressions.CampaignId = ad_group_avg_cpa.campaign_id AND
                ad_impressions.AdGroupId = ad_group_avg_cpa.ad_group_id

          WHERE (((REPLACE(ad.Status, "Status_", "")) = 'Enabled')) AND (((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))) AND ((DATE_DIFF(
                     (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)),
                    CAST(CONCAT((FORMAT_TIMESTAMP('%Y-%m', TIMESTAMP_TRUNC(CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS TIMESTAMP), QUARTER))), '-01') as DATE),
                    day) + 1) <= (DATE_DIFF(CURRENT_DATE(), DATE_TRUNC(CURRENT_DATE(), QUARTER), DAY)))
          GROUP BY 1,2,3,4,5,6,7,8
          HAVING
            (((COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(ad_impressions.Conversions ), 0)),0)) / NULLIF(((COALESCE(SUM(ad_group_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(ad_group_avg_cpa.conversions ), 0)),0)),0) > 1.2)
          ORDER BY 10 DESC
      ),

      keyword_alerts as (
        WITH ad_group_avg_cpa AS (
          SELECT
            ad_impressions.ExternalCustomerId  AS external_customer_id,
            ad_impressions.CampaignId  AS campaign_id,
            ad_impressions.AdGroupId  AS ad_group_id,
            COALESCE(SUM(ad_impressions.Cost ), 0) AS cost,
            COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS cost_usd,
            COALESCE(SUM(ad_impressions.Clicks ), 0) AS clicks,
            COALESCE(SUM(ad_impressions.Conversions ), 0) AS conversions,
            COALESCE(SUM(ad_impressions.Impressions ), 0) AS impressions,
            COALESCE(SUM(ad_impressions.Interactions ), 0) AS interactions
          FROM
            adwords_v201609.AdGroupBasicStats_6747157124
          AS ad_impressions
          WHERE
            ((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))
          GROUP BY 1,2,3
         )
        SELECT
          ad_group.AdGroupId  AS ad_group_ad_group_id,
          ad_group.CampaignId  AS ad_group_campaign_id,
          campaign.CampaignId  AS campaign_campaign_id,
          campaign.CampaignName  AS campaign_campaign_name,
          ad_group.AdGroupName  AS ad_group_ad_group_name,
          keyword.Criteria  AS keyword_criteria,
          (COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(ad_impressions.Conversions ), 0)),0)  AS ad_impressions_average_cost_per_conversion,
          ((COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0))*1.0 / NULLIF((COALESCE(SUM(ad_impressions.Conversions ), 0)),0)) / NULLIF(((COALESCE(SUM(ad_group_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(ad_group_avg_cpa.conversions ), 0)),0)),0) AS ad_group_avg_cpa_cpa_compared_to_average_for_ad_group_keyword,
          COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS ad_impressions_total_cost
        FROM
            adwords_v201609.KeywordBasicStats_6747157124
            AS ad_impressions
        LEFT JOIN adwords_v201609.Keyword_6747157124  AS keyword ON (CONCAT(CAST(ad_impressions.AdGroupId AS STRING), "-", CAST(ad_impressions.CriterionId AS STRING))) = (CONCAT(CAST(keyword.AdGroupId AS STRING), "-", CAST(keyword.CriterionId AS STRING))) AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(keyword._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad_impressions.AdGroupId = ad_group.AdGroupId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad_impressions.CampaignId = campaign.CampaignId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(campaign._DATA_DATE))  AS DATE))
        LEFT JOIN ad_group_avg_cpa ON ad_impressions.ExternalCustomerId = ad_group_avg_cpa.external_customer_id AND
              ad_impressions.CampaignId = ad_group_avg_cpa.campaign_id AND
              ad_impressions.AdGroupId = ad_group_avg_cpa.ad_group_id

        WHERE (ad_impressions.Conversions  > 0) AND (((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))) AND (((REPLACE(keyword.Status, "Status_", "")) = 'Active')) AND (((((((ad_impressions.Cost / 1000000) ) / CASE WHEN (ad_impressions.Conversions ) IS NULL THEN 0 ELSE (ad_impressions.Conversions ) END
        ) / (CASE WHEN (ad_group_avg_cpa.cost_usd) IS NULL THEN 0 ELSE (ad_group_avg_cpa.cost_usd) END
         / CASE WHEN (ad_group_avg_cpa.conversions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.conversions) END
        )) > 1.2) OR ((((ad_impressions.Clicks ) / CASE WHEN (ad_impressions.Impressions ) IS NULL THEN 0 ELSE (ad_impressions.Impressions ) END
        ) / (CASE WHEN (ad_group_avg_cpa.clicks) IS NULL THEN 0 ELSE (ad_group_avg_cpa.clicks) END
         / CASE WHEN (ad_group_avg_cpa.impressions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.impressions) END
        )) < 0.8)) OR ((((ad_impressions.Conversions ) / CASE WHEN (ad_impressions.Interactions ) IS NULL THEN 0 ELSE (ad_impressions.Interactions ) END
        ) / (CASE WHEN (ad_group_avg_cpa.conversions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.conversions) END
         / CASE WHEN (ad_group_avg_cpa.interactions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.interactions) END
        )) < 0.8))
        GROUP BY 1,2,3,4,5,6
        ORDER BY 8 DESC
      ),

      keyword_alerts_last_quarter as (
        WITH ad_group_avg_cpa AS (SELECT
          ad_impressions.ExternalCustomerId  AS external_customer_id,
          ad_impressions.CampaignId  AS campaign_id,
          ad_impressions.AdGroupId  AS ad_group_id,
          COALESCE(SUM(ad_impressions.Cost ), 0) AS cost,
          COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS cost_usd,
          COALESCE(SUM(ad_impressions.Clicks ), 0) AS clicks,
          COALESCE(SUM(ad_impressions.Conversions ), 0) AS conversions,
          COALESCE(SUM(ad_impressions.Impressions ), 0) AS impressions,
          COALESCE(SUM(ad_impressions.Interactions ), 0) AS interactions
        FROM

              adwords_v201609.AdGroupBasicStats_6747157124

            AS ad_impressions

        WHERE
          ((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))
        GROUP BY 1,2,3)
        SELECT
          ad_group.AdGroupId  AS ad_group_ad_group_id,
          ad_group.CampaignId  AS ad_group_campaign_id,
          campaign.CampaignId  AS campaign_campaign_id,
          campaign.CampaignName  AS campaign_campaign_name,
          ad_group.AdGroupName  AS ad_group_ad_group_name,
          keyword.Criteria  AS keyword_criteria
        FROM
            adwords_v201609.KeywordBasicStats_6747157124
            AS ad_impressions
        LEFT JOIN adwords_v201609.Keyword_6747157124  AS keyword ON (CONCAT(CAST(ad_impressions.AdGroupId AS STRING), "-", CAST(ad_impressions.CriterionId AS STRING))) = (CONCAT(CAST(keyword.AdGroupId AS STRING), "-", CAST(keyword.CriterionId AS STRING))) AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(keyword._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad_impressions.AdGroupId = ad_group.AdGroupId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad_impressions.CampaignId = campaign.CampaignId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(campaign._DATA_DATE))  AS DATE))
        LEFT JOIN ad_group_avg_cpa ON ad_impressions.ExternalCustomerId = ad_group_avg_cpa.external_customer_id AND
              ad_impressions.CampaignId = ad_group_avg_cpa.campaign_id AND
              ad_impressions.AdGroupId = ad_group_avg_cpa.ad_group_id

        WHERE (ad_impressions.Conversions  > 0) AND (((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))) AND (((REPLACE(keyword.Status, "Status_", "")) = 'Active')) AND ((DATE_DIFF(
                   (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)),
                  CAST(CONCAT((FORMAT_TIMESTAMP('%Y-%m', TIMESTAMP_TRUNC(CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS TIMESTAMP), QUARTER))), '-01') as DATE),
                  day) + 1) <= (DATE_DIFF(CURRENT_DATE(), DATE_TRUNC(CURRENT_DATE(), QUARTER), DAY))) AND (((((((ad_impressions.Cost / 1000000) ) / CASE WHEN (ad_impressions.Conversions ) IS NULL THEN 0 ELSE (ad_impressions.Conversions ) END
        ) / (CASE WHEN (ad_group_avg_cpa.cost_usd) IS NULL THEN 0 ELSE (ad_group_avg_cpa.cost_usd) END
         / CASE WHEN (ad_group_avg_cpa.conversions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.conversions) END
        )) > 1.2) OR ((((ad_impressions.Clicks ) / CASE WHEN (ad_impressions.Impressions ) IS NULL THEN 0 ELSE (ad_impressions.Impressions ) END
        ) / (CASE WHEN (ad_group_avg_cpa.clicks) IS NULL THEN 0 ELSE (ad_group_avg_cpa.clicks) END
         / CASE WHEN (ad_group_avg_cpa.impressions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.impressions) END
        )) < 0.8)) OR ((((ad_impressions.Conversions ) / CASE WHEN (ad_impressions.Interactions ) IS NULL THEN 0 ELSE (ad_impressions.Interactions ) END
        ) / (CASE WHEN (ad_group_avg_cpa.conversions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.conversions) END
         / CASE WHEN (ad_group_avg_cpa.interactions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.interactions) END
        )) < 0.8))
        GROUP BY 1,2,3,4,5,6
      ),

      ad_alerts as (
        WITH ad_group_avg_cpa AS (
          SELECT
            ad_impressions.ExternalCustomerId  AS external_customer_id,
            ad_impressions.CampaignId  AS campaign_id,
            ad_impressions.AdGroupId  AS ad_group_id,
            COALESCE(SUM(ad_impressions.Cost ), 0) AS cost,
            COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS cost_usd,
            COALESCE(SUM(ad_impressions.Clicks ), 0) AS clicks,
            COALESCE(SUM(ad_impressions.Conversions ), 0) AS conversions,
            COALESCE(SUM(ad_impressions.Impressions ), 0) AS impressions,
            COALESCE(SUM(ad_impressions.Interactions ), 0) AS interactions
          FROM
            adwords_v201609.AdGroupBasicStats_6747157124
          AS ad_impressions
          GROUP BY 1,2,3
        )
        SELECT
          ad.AdGroupId  AS ad_ad_group_id,
          ad.CampaignId  AS ad_campaign_id,
          ad_group.AdGroupId  AS ad_group_ad_group_id,
          ad_group.CampaignId  AS ad_group_campaign_id,
          campaign.CampaignId  AS campaign_campaign_id,
          campaign.CampaignName  AS campaign_campaign_name,
          ad_group.AdGroupName  AS ad_group_ad_group_name,
          SUBSTR(CONCAT(
              COALESCE(CONCAT(ad.Headline, "\n"),"")
              , COALESCE(CONCAT(ad.HeadlinePart1, "\n"),"")
              , COALESCE(CONCAT(ad.HeadlinePart2, "\n"),"")
              ), 0, 50)  AS ad_creative
        FROM
            adwords_v201609.AdBasicStats_6747157124
            AS ad_impressions
        LEFT JOIN adwords_v201609.Ad_6747157124  AS ad ON ad.CreativeId = ad_impressions.CreativeId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad_impressions.AdGroupId = ad_group.AdGroupId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad_impressions.CampaignId = campaign.CampaignId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(campaign._DATA_DATE))  AS DATE))
        LEFT JOIN ad_group_avg_cpa ON ad_impressions.ExternalCustomerId = ad_group_avg_cpa.external_customer_id AND
              ad_impressions.CampaignId = ad_group_avg_cpa.campaign_id AND
              ad_impressions.AdGroupId = ad_group_avg_cpa.ad_group_id

        WHERE (ad_impressions.Conversions  > 0) AND (((REPLACE(ad.Status, "Status_", "")) = 'Enabled')) AND (((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))) AND (((((((ad_impressions.Cost / 1000000) ) / CASE WHEN (ad_impressions.Conversions ) IS NULL THEN 0 ELSE (ad_impressions.Conversions ) END
        ) / (CASE WHEN (ad_group_avg_cpa.cost_usd) IS NULL THEN 0 ELSE (ad_group_avg_cpa.cost_usd) END
         / CASE WHEN (ad_group_avg_cpa.conversions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.conversions) END
        )) > 1.2) OR ((((ad_impressions.Clicks ) / CASE WHEN (ad_impressions.Impressions ) IS NULL THEN 0 ELSE (ad_impressions.Impressions ) END
        ) / (CASE WHEN (ad_group_avg_cpa.clicks) IS NULL THEN 0 ELSE (ad_group_avg_cpa.clicks) END
         / CASE WHEN (ad_group_avg_cpa.impressions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.impressions) END
        )) < 0.8)) OR ((((ad_impressions.Conversions ) / CASE WHEN (ad_impressions.Interactions ) IS NULL THEN 0 ELSE (ad_impressions.Interactions ) END
        ) / (CASE WHEN (ad_group_avg_cpa.conversions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.conversions) END
         / CASE WHEN (ad_group_avg_cpa.interactions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.interactions) END
        )) < 0.8))
        GROUP BY 1,2,3,4,5,6,7,8
      ),

      ad_alerts_last_quarter as (
        WITH ad_group_avg_cpa AS (SELECT
          ad_impressions.ExternalCustomerId  AS external_customer_id,
          ad_impressions.CampaignId  AS campaign_id,
          ad_impressions.AdGroupId  AS ad_group_id,
          COALESCE(SUM(ad_impressions.Cost ), 0) AS cost,
          COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS cost_usd,
          COALESCE(SUM(ad_impressions.Clicks ), 0) AS clicks,
          COALESCE(SUM(ad_impressions.Conversions ), 0) AS conversions,
          COALESCE(SUM(ad_impressions.Impressions ), 0) AS impressions,
          COALESCE(SUM(ad_impressions.Interactions ), 0) AS interactions
        FROM
              adwords_v201609.AdGroupBasicStats_6747157124
            AS ad_impressions
        GROUP BY 1,2,3)
        SELECT
          ad.AdGroupId  AS ad_ad_group_id,
          ad.CampaignId  AS ad_campaign_id,
          ad_group.AdGroupId  AS ad_group_ad_group_id,
          ad_group.CampaignId  AS ad_group_campaign_id,
          campaign.CampaignId  AS campaign_campaign_id,
          campaign.CampaignName  AS campaign_campaign_name,
          ad_group.AdGroupName  AS ad_group_ad_group_name,
          SUBSTR(CONCAT(
              COALESCE(CONCAT(ad.Headline, "\n"),"")
              , COALESCE(CONCAT(ad.HeadlinePart1, "\n"),"")
              , COALESCE(CONCAT(ad.HeadlinePart2, "\n"),"")
              ), 0, 50)  AS ad_creative
        FROM
            adwords_v201609.AdBasicStats_6747157124
            AS ad_impressions
        LEFT JOIN adwords_v201609.Ad_6747157124  AS ad ON ad.CreativeId = ad_impressions.CreativeId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad_impressions.AdGroupId = ad_group.AdGroupId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad_impressions.CampaignId = campaign.CampaignId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(campaign._DATA_DATE))  AS DATE))
        LEFT JOIN ad_group_avg_cpa ON ad_impressions.ExternalCustomerId = ad_group_avg_cpa.external_customer_id AND
              ad_impressions.CampaignId = ad_group_avg_cpa.campaign_id AND
              ad_impressions.AdGroupId = ad_group_avg_cpa.ad_group_id

        WHERE (ad_impressions.Conversions  > 0) AND ((DATE_DIFF(
                   (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)),
                  CAST(CONCAT((FORMAT_TIMESTAMP('%Y-%m', TIMESTAMP_TRUNC(CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS TIMESTAMP), QUARTER))), '-01') as DATE),
                  day) + 1) <= (DATE_DIFF(CURRENT_DATE(), DATE_TRUNC(CURRENT_DATE(), QUARTER), DAY))) AND (((REPLACE(ad.Status, "Status_", "")) = 'Enabled')) AND (((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))) AND (((((((ad_impressions.Cost / 1000000) ) / CASE WHEN (ad_impressions.Conversions ) IS NULL THEN 0 ELSE (ad_impressions.Conversions ) END
        ) / (CASE WHEN (ad_group_avg_cpa.cost_usd) IS NULL THEN 0 ELSE (ad_group_avg_cpa.cost_usd) END
         / CASE WHEN (ad_group_avg_cpa.conversions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.conversions) END
        )) > 1.2) OR ((((ad_impressions.Clicks ) / CASE WHEN (ad_impressions.Impressions ) IS NULL THEN 0 ELSE (ad_impressions.Impressions ) END
        ) / (CASE WHEN (ad_group_avg_cpa.clicks) IS NULL THEN 0 ELSE (ad_group_avg_cpa.clicks) END
         / CASE WHEN (ad_group_avg_cpa.impressions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.impressions) END
        )) < 0.8)) OR ((((ad_impressions.Conversions ) / CASE WHEN (ad_impressions.Interactions ) IS NULL THEN 0 ELSE (ad_impressions.Interactions ) END
        ) / (CASE WHEN (ad_group_avg_cpa.conversions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.conversions) END
         / CASE WHEN (ad_group_avg_cpa.interactions) IS NULL THEN 0 ELSE (ad_group_avg_cpa.interactions) END
        )) < 0.8))
        GROUP BY 1,2,3,4,5,6,7,8
        ORDER BY 6
      ),

      nonconverting_ads as (
        WITH ad_group_avg_cpa AS (SELECT
          ad_impressions.ExternalCustomerId  AS external_customer_id,
          ad_impressions.CampaignId  AS campaign_id,
          ad_impressions.AdGroupId  AS ad_group_id,
          COALESCE(SUM(ad_impressions.Cost ), 0) AS cost,
          COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS cost_usd,
          COALESCE(SUM(ad_impressions.Clicks ), 0) AS clicks,
          COALESCE(SUM(ad_impressions.Conversions ), 0) AS conversions,
          COALESCE(SUM(ad_impressions.Impressions ), 0) AS impressions,
          COALESCE(SUM(ad_impressions.Interactions ), 0) AS interactions
        FROM

              adwords_v201609.AdGroupBasicStats_6747157124

            AS ad_impressions

        GROUP BY 1,2,3)
        SELECT
          ad.AdGroupId  AS ad_ad_group_id,
          ad.CampaignId  AS ad_campaign_id,
          ad_group.AdGroupId  AS ad_group_ad_group_id,
          ad_group.CampaignId  AS ad_group_campaign_id,
          campaign.CampaignId  AS campaign_campaign_id,
          campaign.CampaignName  AS campaign_campaign_name,
          ad_group.AdGroupName  AS ad_group_ad_group_name,
          SUBSTR(CONCAT(
              COALESCE(CONCAT(ad.Headline, "\n"),"")
              , COALESCE(CONCAT(ad.HeadlinePart1, "\n"),"")
              , COALESCE(CONCAT(ad.HeadlinePart2, "\n"),"")
              ), 0, 50)  AS ad_creative,
          (COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0)) / NULLIF(((COALESCE(SUM(ad_group_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(ad_group_avg_cpa.conversions ), 0)),0)),0)  AS ad_group_avg_cpa_expected_conversions_for_ad,
          COALESCE(SUM(ad_impressions.Conversions ), 0) AS ad_impressions_total_conversions,
          COALESCE(SUM(ad_impressions.Impressions ), 0) AS ad_impressions_total_impressions,
          COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS ad_impressions_total_cost
        FROM
            adwords_v201609.AdBasicStats_6747157124
            AS ad_impressions
        LEFT JOIN adwords_v201609.Ad_6747157124  AS ad ON ad.CreativeId = ad_impressions.CreativeId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad_impressions.AdGroupId = ad_group.AdGroupId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad_impressions.CampaignId = campaign.CampaignId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(campaign._DATA_DATE))  AS DATE))
        LEFT JOIN ad_group_avg_cpa ON ad_impressions.ExternalCustomerId = ad_group_avg_cpa.external_customer_id AND
              ad_impressions.CampaignId = ad_group_avg_cpa.campaign_id AND
              ad_impressions.AdGroupId = ad_group_avg_cpa.ad_group_id

        WHERE (((REPLACE(ad.Status, "Status_", "")) = 'Enabled')) AND (((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))))))))
        GROUP BY 1,2,3,4,5,6,7,8
        HAVING (COALESCE(SUM(ad_impressions.Conversions ), 0) = 0) AND ((COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0)) / NULLIF(((COALESCE(SUM(ad_group_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(ad_group_avg_cpa.conversions ), 0)),0)),0)  > 4)
      ),

      nonconverting_ads_last_quarter as (
        WITH ad_group_avg_cpa AS (SELECT
          ad_impressions.ExternalCustomerId  AS external_customer_id,
          ad_impressions.CampaignId  AS campaign_id,
          ad_impressions.AdGroupId  AS ad_group_id,
          COALESCE(SUM(ad_impressions.Cost ), 0) AS cost,
          COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS cost_usd,
          COALESCE(SUM(ad_impressions.Clicks ), 0) AS clicks,
          COALESCE(SUM(ad_impressions.Conversions ), 0) AS conversions,
          COALESCE(SUM(ad_impressions.Impressions ), 0) AS impressions,
          COALESCE(SUM(ad_impressions.Interactions ), 0) AS interactions
        FROM

              adwords_v201609.AdGroupBasicStats_6747157124

            AS ad_impressions

        GROUP BY 1,2,3)
        SELECT
          ad.AdGroupId  AS ad_ad_group_id,
          ad.CampaignId  AS ad_campaign_id,
          ad_group.AdGroupId  AS ad_group_ad_group_id,
          ad_group.CampaignId  AS ad_group_campaign_id,
          campaign.CampaignId  AS campaign_campaign_id,
          campaign.CampaignName  AS campaign_campaign_name,
          ad_group.AdGroupName  AS ad_group_ad_group_name,
          SUBSTR(CONCAT(
              COALESCE(CONCAT(ad.Headline, "\n"),"")
              , COALESCE(CONCAT(ad.HeadlinePart1, "\n"),"")
              , COALESCE(CONCAT(ad.HeadlinePart2, "\n"),"")
              ), 0, 50)  AS ad_creative,
          CASE WHEN (DATE_DIFF(
                   (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)),
                  CAST(CONCAT((FORMAT_TIMESTAMP('%Y-%m', TIMESTAMP_TRUNC(CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS TIMESTAMP), QUARTER))), '-01') as DATE),
                  day) + 1) <= (DATE_DIFF(CURRENT_DATE(), DATE_TRUNC(CURRENT_DATE(), QUARTER), DAY))  THEN 'Yes' ELSE 'No' END
         AS ad_group_less_than_current_day_of_quarter,
          (COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0)) / NULLIF(((COALESCE(SUM(ad_group_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(ad_group_avg_cpa.conversions ), 0)),0)),0)  AS ad_group_avg_cpa_expected_conversions_for_ad,
          COALESCE(SUM(ad_impressions.Conversions ), 0) AS ad_impressions_total_conversions,
          COALESCE(SUM(ad_impressions.Impressions ), 0) AS ad_impressions_total_impressions,
          COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS ad_impressions_total_cost
        FROM
            adwords_v201609.AdBasicStats_6747157124
            AS ad_impressions
        LEFT JOIN adwords_v201609.Ad_6747157124  AS ad ON ad.CreativeId = ad_impressions.CreativeId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad_impressions.AdGroupId = ad_group.AdGroupId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad_impressions.CampaignId = campaign.CampaignId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(campaign._DATA_DATE))  AS DATE))
        LEFT JOIN ad_group_avg_cpa ON ad_impressions.ExternalCustomerId = ad_group_avg_cpa.external_customer_id AND
              ad_impressions.CampaignId = ad_group_avg_cpa.campaign_id AND
              ad_impressions.AdGroupId = ad_group_avg_cpa.ad_group_id

        WHERE (((REPLACE(ad.Status, "Status_", "")) = 'Enabled')) AND (((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))) AND ((DATE_DIFF(
                   (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)),
                  CAST(CONCAT((FORMAT_TIMESTAMP('%Y-%m', TIMESTAMP_TRUNC(CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS TIMESTAMP), QUARTER))), '-01') as DATE),
                  day) + 1) <= (DATE_DIFF(CURRENT_DATE(), DATE_TRUNC(CURRENT_DATE(), QUARTER), DAY)))
        GROUP BY 1,2,3,4,5,6,7,8,9
        HAVING (COALESCE(SUM(ad_impressions.Conversions ), 0) = 0) AND ((COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0)) / NULLIF(((COALESCE(SUM(ad_group_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(ad_group_avg_cpa.conversions ), 0)),0)),0)  > 4)
      ),

      nonconverting_keywords as (
        WITH ad_group_avg_cpa AS (SELECT
          ad_impressions.ExternalCustomerId  AS external_customer_id,
          ad_impressions.CampaignId  AS campaign_id,
          ad_impressions.AdGroupId  AS ad_group_id,
          COALESCE(SUM(ad_impressions.Cost ), 0) AS cost,
          COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS cost_usd,
          COALESCE(SUM(ad_impressions.Clicks ), 0) AS clicks,
          COALESCE(SUM(ad_impressions.Conversions ), 0) AS conversions,
          COALESCE(SUM(ad_impressions.Impressions ), 0) AS impressions,
          COALESCE(SUM(ad_impressions.Interactions ), 0) AS interactions
        FROM
              adwords_v201609.AdGroupBasicStats_6747157124
            AS ad_impressions
        GROUP BY 1,2,3)
        SELECT
          ad_group.AdGroupId  AS ad_group_ad_group_id,
          ad_group.CampaignId  AS ad_group_campaign_id,
          campaign.CampaignId  AS campaign_campaign_id,
          campaign.CampaignName  AS campaign_campaign_name,
          ad_group.AdGroupName  AS ad_group_ad_group_name,
          keyword.Criteria  AS keyword_criteria,
          (COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0)) / NULLIF(((COALESCE(SUM(ad_group_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(ad_group_avg_cpa.conversions ), 0)),0)),0)  AS ad_group_avg_cpa_expected_conversions_for_keyword,
          COALESCE(SUM(ad_impressions.Conversions ), 0) AS ad_impressions_total_conversions,
          COALESCE(SUM(ad_impressions.Impressions ), 0) AS ad_impressions_total_impressions,
          COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS ad_impressions_total_cost
        FROM
            adwords_v201609.KeywordBasicStats_6747157124
            AS ad_impressions
        LEFT JOIN adwords_v201609.Keyword_6747157124  AS keyword ON (CONCAT(CAST(ad_impressions.AdGroupId AS STRING), "-", CAST(ad_impressions.CriterionId AS STRING))) = (CONCAT(CAST(keyword.AdGroupId AS STRING), "-", CAST(keyword.CriterionId AS STRING))) AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(keyword._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad_impressions.AdGroupId = ad_group.AdGroupId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad_impressions.CampaignId = campaign.CampaignId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(campaign._DATA_DATE))  AS DATE))
        LEFT JOIN ad_group_avg_cpa ON ad_impressions.ExternalCustomerId = ad_group_avg_cpa.external_customer_id AND
              ad_impressions.CampaignId = ad_group_avg_cpa.campaign_id AND
              ad_impressions.AdGroupId = ad_group_avg_cpa.ad_group_id

        WHERE (((REPLACE(keyword.Status, "Status_", "")) = 'Active')) AND (((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))))))))
        GROUP BY 1,2,3,4,5,6
        HAVING (COALESCE(SUM(ad_impressions.Conversions ), 0) = 0) AND ((COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0)) / NULLIF(((COALESCE(SUM(ad_group_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(ad_group_avg_cpa.conversions ), 0)),0)),0)  > 4)
      ),

      nonconverting_keywords_last_quarter as (
        WITH ad_group_avg_cpa AS (SELECT
          ad_impressions.ExternalCustomerId  AS external_customer_id,
          ad_impressions.CampaignId  AS campaign_id,
          ad_impressions.AdGroupId  AS ad_group_id,
          COALESCE(SUM(ad_impressions.Cost ), 0) AS cost,
          COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS cost_usd,
          COALESCE(SUM(ad_impressions.Clicks ), 0) AS clicks,
          COALESCE(SUM(ad_impressions.Conversions ), 0) AS conversions,
          COALESCE(SUM(ad_impressions.Impressions ), 0) AS impressions,
          COALESCE(SUM(ad_impressions.Interactions ), 0) AS interactions
        FROM
              adwords_v201609.AdGroupBasicStats_6747157124
            AS ad_impressions
        WHERE
          ((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))
        GROUP BY 1,2,3)
        SELECT
          ad_group.AdGroupId  AS ad_group_ad_group_id,
          ad_group.CampaignId  AS ad_group_campaign_id,
          campaign.CampaignId  AS campaign_campaign_id,
          campaign.CampaignName  AS campaign_campaign_name,
          ad_group.AdGroupName  AS ad_group_ad_group_name,
          keyword.Criteria  AS keyword_criteria,
          (COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0)) / NULLIF(((COALESCE(SUM(ad_group_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(ad_group_avg_cpa.conversions ), 0)),0)),0)  AS ad_group_avg_cpa_expected_conversions_for_keyword,
          COALESCE(SUM(ad_impressions.Conversions ), 0) AS ad_impressions_total_conversions,
          COALESCE(SUM(ad_impressions.Impressions ), 0) AS ad_impressions_total_impressions,
          COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0) AS ad_impressions_total_cost
        FROM
            adwords_v201609.KeywordBasicStats_6747157124
            AS ad_impressions
        LEFT JOIN adwords_v201609.Keyword_6747157124  AS keyword ON (CONCAT(CAST(ad_impressions.AdGroupId AS STRING), "-", CAST(ad_impressions.CriterionId AS STRING))) = (CONCAT(CAST(keyword.AdGroupId AS STRING), "-", CAST(keyword.CriterionId AS STRING))) AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(keyword._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad_impressions.AdGroupId = ad_group.AdGroupId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE))
        LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad_impressions.CampaignId = campaign.CampaignId AND
              (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)) = (CAST((TIMESTAMP(campaign._DATA_DATE))  AS DATE))
        LEFT JOIN ad_group_avg_cpa ON ad_impressions.ExternalCustomerId = ad_group_avg_cpa.external_customer_id AND
              ad_impressions.CampaignId = ad_group_avg_cpa.campaign_id AND
              ad_impressions.AdGroupId = ad_group_avg_cpa.ad_group_id

        WHERE (((((TIMESTAMP(ad_impressions._DATA_DATE)) ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))))) AND ((TIMESTAMP(ad_impressions._DATA_DATE)) ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL 3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS DATE), INTERVAL -3 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), QUARTER) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), QUARTER) AS TIMESTAMP)) AS STRING)))))))) AND ((DATE_DIFF(
                   (CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS DATE)),
                  CAST(CONCAT((FORMAT_TIMESTAMP('%Y-%m', TIMESTAMP_TRUNC(CAST((TIMESTAMP(ad_impressions._DATA_DATE))  AS TIMESTAMP), QUARTER))), '-01') as DATE),
                  day) + 1) <= (DATE_DIFF(CURRENT_DATE(), DATE_TRUNC(CURRENT_DATE(), QUARTER), DAY))) AND (((REPLACE(keyword.Status, "Status_", "")) = 'Active'))
        GROUP BY 1,2,3,4,5,6
        HAVING (COALESCE(SUM(ad_impressions.Conversions ), 0) = 0) AND ((COALESCE(SUM((ad_impressions.Cost / 1000000) ), 0)) / NULLIF(((COALESCE(SUM(ad_group_avg_cpa.cost_usd ), 0)) / NULLIF((COALESCE(SUM(ad_group_avg_cpa.conversions ), 0)),0)),0)  > 4)
        ORDER BY 7 DESC
      )

      select 'underperforming_ad_groups' as key, count(*) as value, (select count(*) from underperforming_ad_groups_last_quarter) as compare from underperforming_ad_groups
      UNION ALL
      select 'underperforming_keywords' as key, count(*) as value, (select count(*) from underperforming_keywords_last_quarter) as compare from underperforming_keywords
      UNION ALL
      select 'underperforming_ads' as key, count(*) as value, (select count(*) from underperforming_ads_last_quarter) as compare from underperforming_ads
      UNION ALL
      select 'keyword_alerts' as key, count(*) as value, (select count(*) from keyword_alerts_last_quarter) as compare from keyword_alerts
      UNION ALL
      select 'nonconverting_ads' as key, count(*) as value, (select count(*) from nonconverting_ads_last_quarter) as compare from nonconverting_ads
      UNION ALL
      select 'ad_alerts' as key, count(*) as value, (select count(*) from ad_alerts_last_quarter) as compare from ad_alerts
      UNION ALL
      select 'nonconverting_keywords' as key, count(*) as value, (select count(*) from nonconverting_keywords_last_quarter) as compare from nonconverting_keywords
    ;;
  }
  dimension: key {
    type:  string
    primary_key:  yes
    sql: ${TABLE}.key ;;
  }
  dimension: value {
    label: "value"
    type:  number
    sql: ${TABLE}.value ;;
  }
  dimension: compare {
    label: "compare"
    type:  number
    sql: ${TABLE}.compare ;;
  }
}