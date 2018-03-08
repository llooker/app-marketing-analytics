view: status_changes {
  derived_table: {
    sql: with ad_status as (
      SELECT
        ad.ExternalCustomerId as external_customer_id,
        ad.CreativeId  AS ad_creative_id,
        ad.Status  AS ad_status,
        CAST(TIMESTAMP(ad._DATA_DATE)  AS DATE) AS ad_date,
        LAG(ad.Status) OVER (PARTITION BY ad.CreativeId ORDER BY CAST(TIMESTAMP(ad._DATA_DATE) AS DATE) ASC) AS ad_PreValue
      FROM adwords_v201609.Ad_6747157124  AS ad
      LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON ad.AdGroupId = ad_group.AdGroupId  AND
            (TIMESTAMP(ad._DATA_DATE)) = (TIMESTAMP(ad_group._DATA_DATE))
      LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON ad.CampaignId = campaign.CampaignId AND
            (TIMESTAMP(ad._DATA_DATE)) = (TIMESTAMP(campaign._DATA_DATE))

      ORDER BY 1, 3 DESC
    ),

    ad_changed as (
    SELECT * FROM ad_status WHERE ad_status.ad_status != ad_status.ad_PreValue),

    keyword_status as (
      SELECT
        keyword.ExternalCustomerId as external_customer_id,
        keyword.CriterionId  AS keyword_criterion_id,
        keyword.Status  AS keyword_status,
        CAST(TIMESTAMP(keyword._DATA_DATE)  AS DATE) AS keyword_date,
        LAG(keyword.Status) OVER (PARTITION BY keyword.CriterionId ORDER BY CAST(TIMESTAMP(keyword._DATA_DATE) AS DATE) ASC) AS keyword_PreValue
      FROM
          adwords_v201609.KeywordBasicStats_6747157124
          AS master_stats
      LEFT JOIN adwords_v201609.Keyword_6747157124  AS keyword ON (CONCAT(CAST(master_stats.AdGroupId AS STRING),CAST(master_stats.CriterionId AS STRING))) = (CONCAT(CAST(keyword.AdGroupId AS STRING),CAST(keyword.CriterionId AS STRING))) AND
            (TIMESTAMP(master_stats._DATA_DATE)) = (TIMESTAMP(keyword._DATA_DATE))

      ORDER BY 1, 3 DESC
    ),

    keywords_changed as (
    SELECT * FROM keyword_status WHERE keyword_status.keyword_status != keyword_status.keyword_PreValue),

    campaign_status as (
      SELECT
        campaign.ExternalCustomerId as external_customer_id,
        campaign.CampaignId  AS campaign_id,
        campaign.CampaignStatus  AS campaign_status,
        CAST(TIMESTAMP(campaign._DATA_DATE)  AS DATE) AS campaign_date,
        LAG(campaign.CampaignStatus) OVER (PARTITION BY campaign.CampaignId ORDER BY CAST(TIMESTAMP(campaign._DATA_DATE) AS DATE) ASC) AS campaign_PreValue
      FROM
            adwords_v201609.CampaignBasicStats_6747157124
          AS master_stats
      LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON master_stats.CampaignId = campaign.CampaignId AND
            (TIMESTAMP(master_stats._DATA_DATE)) = (TIMESTAMP(campaign._DATA_DATE))
      ORDER BY 1 ,3 DESC
    ),

    campaign_changed as (
    SELECT * FROM campaign_status WHERE campaign_status.campaign_status != campaign_status.campaign_PreValue),

    ad_group_status as (
      SELECT
        ad_group.ExternalCustomerId as external_customer_id,
        ad_group.AdGroupId  AS ad_group_id,
        ad_group.AdGroupStatus  AS ad_group_status,
        CAST(TIMESTAMP(ad_group._DATA_DATE)  AS DATE) AS ad_group_date,
        LAG(ad_group.AdGroupStatus) OVER (PARTITION BY ad_group.AdGroupId ORDER BY CAST(TIMESTAMP(ad_group._DATA_DATE) AS DATE) ASC) AS ad_group_PreValue
      FROM
            adwords_v201609.AdGroupBasicStats_6747157124 AS master_stats
      LEFT JOIN adwords_v201609.AdGroup_6747157124  AS ad_group ON master_stats.AdGroupId = ad_group.AdGroupId AND
            (TIMESTAMP(master_stats._DATA_DATE)) = (TIMESTAMP(ad_group._DATA_DATE))
      ORDER BY 1, 3 DESC
    ),

    ad_group_changed as (
    SELECT * FROM ad_group_status WHERE ad_group_status.ad_group_status != ad_group_status.ad_group_PreValue)


    SELECT
      ad_changed.external_customer_id as external_customer_id,
      ad_changed.ad_creative_id as ad_creative_id,
      null as keyword_criterion_id,
      null as campaign_id,
      null as ad_group_id,
      ad_changed.ad_date as date,
      ad_changed.ad_status as new_status,
      ad_changed.ad_PreValue as old_status
    FROM ad_changed
    UNION ALL
    SELECT
      keywords_changed.external_customer_id as external_customer_id,
      null as ad_creative_id,
      keywords_changed.keyword_criterion_id,
      null as campaign_id,
      null as ad_group_id,
      keywords_changed.keyword_date,
      keywords_changed.keyword_status,
      keywords_changed.keyword_PreValue
    FROM keywords_changed
    UNION ALL
    SELECT
      campaign_changed.external_customer_id as external_customer_id,
      null as ad_creative_id,
      null as keyword_criterion_id,
      campaign_changed.campaign_id,
      null as ad_group_id,
      campaign_changed.campaign_date,
      campaign_changed.campaign_status,
      campaign_changed.campaign_PreValue
    FROM campaign_changed
    UNION ALL
    SELECT
      ad_group_changed.external_customer_id as external_customer_id,
      null as ad_creative_id,
      null as keyword_criterion_id,
      null as campaign_id,
      ad_group_changed.ad_group_id,
      ad_group_changed.ad_group_date,
      ad_group_changed.ad_group_status,
      ad_group_changed.ad_group_PreValue
    FROM ad_group_changed
    ORDER BY 1,2,3,4 DESC
     ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.external_customer_id ;;
    hidden: yes
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
    hidden: yes
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.ad_group_id ;;
    hidden: yes
  }

  dimension: ad_creative_id {
    type: number
    sql: ${TABLE}.ad_creative_id ;;
    hidden: yes
  }

  dimension: keyword_criterion_id {
    type: number
    sql: ${TABLE}.keyword_criterion_id ;;
    hidden: yes
  }

  dimension: old_status {
    type: string
    sql: ${TABLE}.old_status ;;
  }

  dimension: new_status {
    type: string
    sql: ${TABLE}.new_status ;;
  }

  dimension: change_date {
    type: date
    sql: TIMESTAMP(${TABLE}.date) ;;
  }

  dimension: type {
    type: string
    sql: CASE WHEN ${TABLE}.campaign_id IS NOT NULL THEN 'Campaign'
              WHEN ${TABLE}.ad_group_id IS NOT NULL THEN 'Ad_Group'
              WHEN ${TABLE}.ad_creative_id IS NOT NULL THEN 'Ad'
              WHEN ${TABLE}.keyword_criterion_id IS NOT NULL THEN 'Keyword'
         END;;
  }
}
