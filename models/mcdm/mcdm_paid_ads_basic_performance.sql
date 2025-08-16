{{ config(materialized='table') }}

with bing as (
    select
        cast(ad_id as string) as ad_id,
        cast(0 as int64) as add_to_cart,
        cast(adset_id as string) as adset_id,
        cast(campaign_id as string) as campaign_id,
        'Bing' as channel,
        cast(clicks as int64) as clicks,
        cast(0 as int64) as comments,
        cast(null as string) as creative_id,
        cast(date as date) as date,
        cast(0 as int64) as engagements,
        cast(imps as int64) as impressions,
        cast(0 as int64) as installs,
        cast(0 as int64) as likes,
        cast(0 as int64) as link_clicks,
        cast(null as string) as placement_id,
        cast(0 as int64) as post_click_conversions,
        cast(0 as int64) as post_view_conversions,
        cast(0 as int64) as posts,
        cast(0 as int64) as purchase,
        cast(0 as int64) as registrations,
        cast(revenue as int64) as revenue,
        cast(0 as int64) as shares,
        cast(spend as int64) as spend,
        cast(conv as int64) as total_conversions,
        cast(0 as int64) as video_views
    from {{ ref('src_ads_bing_all_data') }}
),

facebook as (
    select
        cast(ad_id as string) as ad_id,
        cast(add_to_cart as int64) as add_to_cart,
        cast(adset_id as string) as adset_id,
        cast(campaign_id as string) as campaign_id,
        'Facebook' as channel,
        cast(clicks as int64) as clicks,
        cast(comments as int64) as comments,
        cast(creative_id as string) as creative_id,
        cast(date as date) as date,
        cast(0 as int64) as engagements,
        cast(impressions as int64) as impressions,
        cast(mobile_app_install as int64) as installs,
        cast(likes as int64) as likes,
        cast(inline_link_clicks as int64) as link_clicks,
        cast(null as string) as placement_id,
        cast(0 as int64) as post_click_conversions,
        cast(0 as int64) as post_view_conversions,
        cast(0 as int64) as posts,
        cast(purchase as int64) as purchase,
        cast(complete_registration as int64) as registrations,
        cast(purchase_value as int64) as revenue,
        cast(shares as int64) as shares,
        cast(spend as int64) as spend,
        cast(0 as int64) as total_conversions,
        cast(views as int64) as video_views
    from {{ ref('src_ads_creative_facebook_all_data') }}
),

tiktok as (
    select
        cast(ad_id as string) as ad_id,
        cast(add_to_cart as int64) as add_to_cart,
        cast(adgroup_id as string) as adset_id,
        cast(campaign_id as string) as campaign_id,
        'TikTok Ads' as channel,
        cast(clicks as int64) as clicks,
        cast(0 as int64) as comments,
        cast(null as string) as creative_id,
        cast(date as date) as date,
        cast(0 as int64) as engagements,
        cast(impressions as int64) as impressions,
        cast(rt_installs as int64) as installs,
        cast(0 as int64) as likes,
        cast(0 as int64) as link_clicks,
        cast(null as string) as placement_id,
        cast(0 as int64) as post_click_conversions,
        cast(0 as int64) as post_view_conversions,
        cast(0 as int64) as posts,
        cast(purchase as int64) as purchase,
        cast(registrations as int64) as registrations,
        cast(0 as int64) as revenue,
        cast(0 as int64) as shares,
        cast(spend as int64) as spend,
        cast(conversions as int64) as total_conversions,
        cast(video_views as int64) as video_views
    from {{ ref('src_ads_tiktok_ads_all_data') }}
),

twitter as (
    select
        cast(null as string) as ad_id,
        cast(0 as int64) as add_to_cart,
        cast(null as string) as adset_id,
        cast(campaign_id as string) as campaign_id,
        'Twitter' as channel,
        cast(clicks as int64) as clicks,
        cast(comments as int64) as comments,
        cast(null as string) as creative_id,
        cast(date as date) as date,
        cast(engagements as int64) as engagements,
        cast(impressions as int64) as impressions,
        cast(0 as int64) as installs,
        cast(likes as int64) as likes,
        cast(url_clicks as int64) as link_clicks,
        cast(null as string) as placement_id,
        cast(0 as int64) as post_click_conversions,
        cast(0 as int64) as post_view_conversions,
        cast(0 as int64) as posts,
        cast(0 as int64) as purchase,
        cast(0 as int64) as registrations,
        cast(0 as int64) as revenue,
        cast(retweets as int64) as shares,
        cast(spend as int64) as spend,
        cast(0 as int64) as total_conversions,
        cast(video_total_views as int64) as video_views
    from {{ ref('src_promoted_tweets_twitter_all_data') }}
)

select * from bing
union all
select * from facebook
union all
select * from tiktok
union all
select * from twitter
