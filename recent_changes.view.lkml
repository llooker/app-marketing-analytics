view: status_changes {
  derived_table: {
    sql: with ad_status as (
      SELECT
       ad.ExternalCustomerId as external_customer_id,
       ad.CreativeId  AS ad_creative_id,
       ad.Status  AS ad_status,
       ad._DATA_DATE  AS ad_date,
       LAG(ad.Status, 1, "Not Present") OVER (PARTITION BY ad.CreativeId ORDER BY  ad._DATA_DATE  ASC) AS ad_status_lag
     FROM adwords_v201609.Ad_6747157124  AS ad
   ),

   ad_changed as (
   SELECT * FROM ad_status WHERE ad_status.ad_status != ad_status.ad_status_lag),

   keyword_status as (
     SELECT
       keyword.ExternalCustomerId as external_customer_id,
       keyword.AdGroupId  AS ad_group_id,
       keyword.CriterionId  AS keyword_criterion_id,
       keyword.Status  AS keyword_status,
       keyword._DATA_DATE AS keyword_date,
       LAG(keyword.Status, 1, "Not Present") OVER (PARTITION BY keyword.AdGroupId, keyword.CriterionId ORDER BY keyword._DATA_DATE ASC) AS keyword_status_lag
     FROM adwords_v201609.Keyword_6747157124 as keyword
   ),

   keywords_changed as (
   SELECT * FROM keyword_status WHERE keyword_status.keyword_status != keyword_status.keyword_status_lag),

   campaign_status as (
     SELECT
       campaign.ExternalCustomerId as external_customer_id,
       campaign.CampaignId  AS campaign_id,
       campaign.CampaignStatus  AS campaign_status,
       campaign._DATA_DATE AS campaign_date,
       LAG(campaign.CampaignStatus, 1, "Not Present") OVER (PARTITION BY campaign.CampaignId ORDER BY campaign._DATA_DATE ASC) AS campaign_status_lag
     FROM adwords_v201609.Campaign_6747157124 as campaign
   ),

   campaign_changed as (
   SELECT * FROM campaign_status WHERE campaign_status.campaign_status != campaign_status.campaign_status_lag),

   ad_group_status as (
     SELECT
       ad_group.ExternalCustomerId as external_customer_id,
       ad_group.AdGroupId  AS ad_group_id,
       ad_group.AdGroupStatus  AS ad_group_status,
       ad_group._DATA_DATE AS ad_group_date,
       LAG(ad_group.AdGroupStatus, 1, "Not Present") OVER (PARTITION BY ad_group.AdGroupId ORDER BY ad_group._DATA_DATE ASC) AS ad_group_status_lag
     FROM adwords_v201609.AdGroup_6747157124 as ad_group
   ),

   ad_group_changed as (
   SELECT * FROM ad_group_status WHERE ad_group_status.ad_group_status != ad_group_status.ad_group_status_lag)


   SELECT
     ad_changed.external_customer_id as external_customer_id,
     ad_changed.ad_creative_id as ad_creative_id,
     null as keyword_criterion_id,
     null as campaign_id,
     null as ad_group_id,
     ad_changed.ad_date as date,
     ad_changed.ad_status as status,
     ad_changed.ad_status_lag as status_lag
   FROM ad_changed
   UNION ALL
   SELECT
     keywords_changed.external_customer_id as external_customer_id,
     null as ad_creative_id,
     keywords_changed.keyword_criterion_id,
     null as campaign_id,
     keywords_changed.ad_group_id as ad_group_id,
     keywords_changed.keyword_date,
     keywords_changed.keyword_status,
     keywords_changed.keyword_status_lag
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
     campaign_changed.campaign_status_lag
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
     ad_group_changed.ad_group_status_lag
   FROM ad_group_changed
   ORDER BY 1,2,3,4 DESC
    ;;
  }

  dimension: external_customer_id {
    type: number
    hidden: yes
  }

  dimension: campaign_id {
    type: number
    hidden: yes
  }

  dimension: ad_group_id {
    type: number
    hidden: yes
  }

  dimension: ad_creative_id {
    type: number
    hidden: yes
  }

  dimension: keyword_criterion_id {
    type: number
    hidden: yes
  }

  dimension: status_lag {
    hidden: yes
  }

  dimension: status {
    hidden: yes
  }

  dimension: status_display {
    label: "Status Update"
    type: string
    case: {
      when: {
        sql: ${status} = 'Status_Enabled' OR ${status} = "ENABLED" OR ${status} = "Status_Active" ;;
        label: "Enabled"
      }
      else: "Disabled"
    }
  }

  dimension_group: change {
    type: time
    sql: TIMESTAMP(${TABLE}.date) ;;
    timeframes: [date, week, month, day_of_week]
  }

  dimension: type {
    type: string
    case: {
      when: {
        sql: ${campaign_id} IS NOT NULL ;;
        label: "Campaign"
      }
      when: {
        sql: ${ad_creative_id} IS NOT NULL ;;
        label: "Ad"
      }
      when: {
        sql: ${keyword_criterion_id} IS NOT NULL AND ${ad_group_id} IS NOT NULL;;
        label: "Keyword"
      }
      when: {
        sql: ${ad_group_id} IS NOT NULL AND ${keyword_criterion_id} IS NULL ;;
        label: "Ad Group"
      }
      else: "Other"
    }
  }

  measure: count {
    type: count_distinct
    sql: COALESCE(${ad_creative_id}, ${ad_group_id}, ${campaign_id}, ${keyword_criterion_id}) ;;
    description: "The number of Ads, Ad Groups, Keywords and Campaigns that changed status"
    html:  {% if (status_changes.type._value == 'Ad') %}
    <a href= "/explore/looker_app_google_adwords/status_changes?fields=ad.creative,status_changes.change_date, status_changes.status_display&f[status_changes.change_date]={{_filters['status_changes.change_date']}}"> {{value}}  </a>
    {% elsif (status_changes.type._value == 'Keyword') %}
    <a href= "/explore/looker_app_google_adwords/status_changes?fields=keyword.criteria,status_changes.change_date, status_changes.status_display&f[status_changes.change_date]={{_filters['status_changes.change_date']}}"> {{value}} </a>
     {% elsif (status_changes.type._value == 'Ad Group') %}
    <a href= "/explore/looker_app_google_adwords/status_changes?fields=ad_group.ad_group_name,status_changes.change_date, status_changes.status_display&f[status_changes.change_date]={{_filters['status_changes.change_date']}}"> {{value}}  </a>
    {% elsif (status_changes.type._value == 'Campaign') %}
    <a href= "/explore/looker_app_google_adwords/status_changes?fields=campaign.campaign_name,status_changes.change_date, status_changes.status_display&f[status_changes.change_date]={{_filters['status_changes.change_date']}}"> {{value}}  </a>
    {% endif %};;
}


}
