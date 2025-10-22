create database project1;

select top 10 post_id, platform, post_type, total_engagement, engagement_rate from social_media 
order by total_engagement desc;

select platform, AVG(likes) as avg_likes, AVG(comments) as avg_comments, AVG(shares) as avg_shares, AVG(total_engagement) as avg_total_engagement from social_media 
group by platform
order by avg_total_engagement desc;

select post_day, time_category, AVG(total_engagement) as avg_engagement from social_media
group by post_day, time_category
order by avg_engagement desc;

select post_type, count(*) as post_count, AVG(total_engagement) as avg_engagement, Round(AVG(engagement_rate),3) as avg_rate from social_media
group by post_type
order by avg_engagement desc;

select sentiment_score , count(*) as post_count, AVG(total_engagement) as avg_engagement, AVG(shares) as avg_shares from social_media
group by sentiment_score
order by avg_engagement desc;

select post_month , AVG(total_engagement) as avg_engagement from social_media
group by post_month
ORDER BY MONTH(CONVERT(DATETIME, '01-' + post_month + '-2023', 105))

select platform, post_type, time_category, AVG(total_engagement) as avg_engagement from social_media
group by platform, post_type, time_category
order by platform, avg_engagement desc;

select top 5 post_day, time_category, sentiment_score, AVG(total_engagement) as avg_engagement from social_media
group by post_day, time_category, sentiment_score
order by avg_engagement desc;
