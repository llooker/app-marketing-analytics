include: "fb_stitch_base.view.lkml"
include: "fb_insights_base.view.lkml"

view: ads_insights {
  extends: ["stitch_base", "insights_base"]

  sql_table_name: {{ _user_attributes["facebook_schema"] }}.ads_insights ;;

  dimension: call_to_action_clicks {
    type: number
    sql: ${TABLE}.call_to_action_clicks ;;
  }

  dimension: relevance_score {
    hidden: yes
    sql: ${TABLE}.relevance_score ;;
  }

  dimension: social_spend {
    type: number
    sql: ${TABLE}.social_spend ;;
  }
}

view: ads_insights__relevance_score {
  dimension: negative_feedback {
    type: string
    sql: ${TABLE}.negative_feedback ;;
  }

  dimension: positive_feedback {
    type: string
    sql: ${TABLE}.positive_feedback ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
}
