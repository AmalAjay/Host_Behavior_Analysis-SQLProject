create database SQL_PROJECT;
USE SQL_PROJECT;
SELECT * FROM HOST_ATHENS;
SELECT * FROM DF_ATHENS_AVAILABILITY;
SELECT * FROM LISTING_ATHENS_DF;
SELECT * FROM REVIEW_ATHENS;

SELECT * FROM HOST_THESSALONIKI;
SELECT * FROM THESSALONIKI_AVAILABILITY;
SELECT * FROM LISTING_THESSALONIKI;
SELECT * FROM REVIEW_THESSALONIKI;


---(a) Analyze different metrics to draw the distinction between Super Host and Other Hosts:
---To achieve this, you can use the following metrics and explore a few yourself as well. 
---Acceptance rate, response rate, instant booking, profile picture, identity verified, review review scores, average no of bookings per month, etc.         

---(i) (profile pic) (THESSALONIKI)
select round((cast(superhost_with_profilepic as float)/(superhost_with_profilepic+host_with_profilepic)*100),2) as sh_prob_with_profilepic,
round((cast(superhost_without_profilepic as float)/(superhost_without_profilepic+host_without_profilepic)*100),2) as sh_prob_without_profilepic
from(select
sum(case when host_is_superhost=1 and host_has_profile_pic=1 then 1 else 0 end) as superhost_with_profilepic,
sum(case when host_is_superhost=0 and host_has_profile_pic=1 then 1 else 0 end) as host_with_profilepic,
sum(case when host_is_superhost=1 and host_has_profile_pic=0 then 1 else 0 end) as superhost_without_profilepic,
sum(case when host_is_superhost=0 and host_has_profile_pic=0 then 1 else 0 end) as host_without_profilepic
from host_thessaloniki)c

---(i) (profile pic) (ATHENS)
select round((cast(superhost_with_profilepic as float)/(superhost_with_profilepic+host_with_profilepic)*100),2) as sh_prob_with_profilepic,
round((cast(superhost_without_profilepic as float)/(superhost_without_profilepic+host_without_profilepic)*100),2) as sh_prob_without_profilepic
from(select
sum(case when host_is_superhost=1 and host_has_profile_pic=1 then 1 else 0 end) as superhost_with_profilepic,
sum(case when host_is_superhost=0 and host_has_profile_pic=1 then 1 else 0 end) as host_with_profilepic,
sum(case when host_is_superhost=1 and host_has_profile_pic=0 then 1 else 0 end) as superhost_without_profilepic,
sum(case when host_is_superhost=0 and host_has_profile_pic=0 then 1 else 0 end) as host_without_profilepic
from host_athens)c

---(ii) (verified) (THESSALONIKI)
select round((cast(verified_superhost as float)/(verified_superhost+verified_host)*100),2) as sh_prob_with_verification,
round((cast(unverified_superhost as float)/(unverified_superhost+unverified_host)*100),2) as sh_prob_without_verification
from
(select
sum(case when host_is_superhost=1 and host_identity_verified=1 then 1 else 0 end) as verified_superhost,
sum(case when host_is_superhost=0 and host_identity_verified=1 then 1 else 0 end) as verified_host,
sum(case when host_is_superhost=1 and host_identity_verified=0 then 1 else 0 end) as unverified_superhost,
sum(case when host_is_superhost=0 and host_identity_verified=0 then 1 else 0 end) as unverified_host
from host_thessaloniki)c;

---(ii) (verified) (ATHENS)
select round((cast(verified_superhost as float)/(verified_superhost+verified_host)*100),2) as sh_prob_with_verification,
round((cast(unverified_superhost as float)/(unverified_superhost+unverified_host)*100),2) as sh_prob_without_verification
from
(select
sum(case when host_is_superhost=1 and host_identity_verified=1 then 1 else 0 end) as verified_superhost,
sum(case when host_is_superhost=0 and host_identity_verified=1 then 1 else 0 end) as verified_host,
sum(case when host_is_superhost=1 and host_identity_verified=0 then 1 else 0 end) as unverified_superhost,
sum(case when host_is_superhost=0 and host_identity_verified=0 then 1 else 0 end) as unverified_host
from host_athens)c;



---(iii) (response time) (THESSALONIKI)
select round((cast(long_response_superhost as float)/(long_response_superhost+long_response_host)*100),2) as sh_prob_with_long_response,
round((cast(med_response_superhost as float)/(med_response_superhost+med_response_host)*100),2) as sh_prob_with_med_response,
round((cast(fast_response_superhost as float)/(fast_response_superhost+fast_response_host)*100),2) as sh_prob_with_fast_response
from
(select
sum(case when host_is_superhost=1 and host_response_time='a few days or more' then 1 else 0 end) as long_response_superhost,
sum(case when host_is_superhost=0 and host_response_time='a few days or more' then 1 else 0 end) as long_response_host,
sum(case when host_is_superhost=1 and host_response_time='within a few hours' then 1 else 0 end) as med_response_superhost,
sum(case when host_is_superhost=0 and host_response_time='within a few hours' then 1 else 0 end) as med_response_host,
sum(case when host_is_superhost=1 and host_response_time='within an hour' then 1 else 0 end) as fast_response_superhost,
sum(case when host_is_superhost=0 and host_response_time='within an hour' then 1 else 0 end) as fast_response_host
from host_thessaloniki)c;

---(iii) (response_time) ((ATHENS)
select round((cast(long_response_superhost as float)/(long_response_superhost+long_response_host)*100),2) as sh_prob_with_long_response,
round((cast(med_response_superhost as float)/(med_response_superhost+med_response_host)*100),2) as sh_prob_with_med_response,
round((cast(fast_response_superhost as float)/(fast_response_superhost+fast_response_host)*100),2) as sh_prob_with_fast_response
from
(select
sum(case when host_is_superhost=1 and host_response_time='a few days or more' then 1 else 0 end) as long_response_superhost,
sum(case when host_is_superhost=0 and host_response_time='a few days or more' then 1 else 0 end) as long_response_host,
sum(case when host_is_superhost=1 and host_response_time='within a few hours' then 1 else 0 end) as med_response_superhost,
sum(case when host_is_superhost=0 and host_response_time='within a few hours' then 1 else 0 end) as med_response_host,
sum(case when host_is_superhost=1 and host_response_time='within an hour' then 1 else 0 end) as fast_response_superhost,
sum(case when host_is_superhost=0 and host_response_time='within an hour' then 1 else 0 end) as fast_response_host
from host_athens)c;

---(iv) (response rate) (THESSALONIKI)
select round((cast(ideal_superhost_response_rate as float)/(ideal_host_response_rate+ideal_superhost_response_rate)*100),2) as sh_prob_with_ideal_response,
round((cast(bad_superhost_response_rate as float)/(bad_superhost_response_rate+bad_host_response_rate)*100),2) as sh_prob_with_bad_response
from
(select
sum(case when host_is_superhost=1 and host_response_rate>=90 then 1 else 0 end) as ideal_superhost_response_rate,
sum(case when host_is_superhost=1 and host_response_rate<90 then 1 else 0 end) as bad_superhost_response_rate,
sum(case when host_is_superhost=0 and host_response_rate>=90 then 1 else 0 end) as ideal_host_response_rate,
sum(case when host_is_superhost=0 and host_response_rate<90 then 1 else 0 end) as bad_host_response_rate
from host_thessaloniki)c;

---(iv) (response rate) (ATHENS)
select round((cast(ideal_superhost_response_rate as float)/(ideal_host_response_rate+ideal_superhost_response_rate)*100),2) as sh_prob_with_ideal_response,
round((cast(bad_superhost_response_rate as float)/(bad_superhost_response_rate+bad_host_response_rate)*100),2) as sh_prob_with_bad_response
from
(select
sum(case when host_is_superhost=1 and host_response_rate>=90 then 1 else 0 end) as ideal_superhost_response_rate,
sum(case when host_is_superhost=1 and host_response_rate<90 then 1 else 0 end) as bad_superhost_response_rate,
sum(case when host_is_superhost=0 and host_response_rate>=90 then 1 else 0 end) as ideal_host_response_rate,
sum(case when host_is_superhost=0 and host_response_rate<90 then 1 else 0 end) as bad_host_response_rate
from host_athens)c;

---(v) (acceptance rate) (THESSALONIKI)
select round((cast(ideal_superhost_acceptance_rate as float)/(ideal_superhost_acceptance_rate+ideal_host_acceptance_rate)*100),2)
as sh_prob_with_ideal_acceptance_Rate,
round((cast(bad_superhost_acceptance_rate as float)/(bad_superhost_acceptance_rate+bad_host_acceptance_rate)*100),2) 
as sh_prob_with_bad_acceptance_rate
from(select
sum(case when host_is_superhost=1 and host_acceptance_rate>=90 then 1 else 0 end) as ideal_superhost_acceptance_rate,
sum(case when host_is_superhost=1 and host_acceptance_rate<90 then 1 else 0 end) as bad_superhost_acceptance_rate,
sum(case when host_is_superhost=0 and host_acceptance_rate>=90 then 1 else 0 end) as ideal_host_acceptance_rate,
sum(case when host_is_superhost=0 and host_acceptance_rate<90 then 1 else 0 end) as bad_host_acceptance_rate
from host_thessaloniki)c;

---(v) (acceptance rate)(ATHENS)
select round((cast(ideal_superhost_acceptance_rate as float)/(ideal_superhost_acceptance_rate+ideal_host_acceptance_rate)*100),2)
as sh_prob_with_ideal_acceptance_Rate,
round((cast(bad_superhost_acceptance_rate as float)/(bad_superhost_acceptance_rate+bad_host_acceptance_rate)*100),2) 
as sh_prob_with_bad_acceptance_rate
from
(select
sum(case when host_is_superhost=1 and host_acceptance_rate>=90 then 1 else 0 end) as ideal_superhost_acceptance_rate,
sum(case when host_is_superhost=1 and host_acceptance_rate<90 then 1 else 0 end) as bad_superhost_acceptance_rate,
sum(case when host_is_superhost=0 and host_acceptance_rate>=90 then 1 else 0 end) as ideal_host_acceptance_rate,
sum(case when host_is_superhost=0 and host_acceptance_rate<90 then 1 else 0 end) as bad_host_acceptance_rate
from host_athens)c;

---(vi) (pricing) (THESSALONIKI)
select
round(avg(case when a.host_is_superhost=1 then b.price end),0) as superhost_avg_price,
round(avg(case when a.host_is_superhost=0 then b.price end),0) as host_avg_price
from host_thessaloniki as a inner join listing_thessaloniki as b on a.host_id=b.host_id

---(vi) (pricing) (ATHENS)
select
round(avg(case when a.host_is_superhost=1 then b.price end),0) as superhost_avg_price,
round(avg(case when a.host_is_superhost=0 then b.price end),0) as host_avg_price
from host_athens as a inner join listing_athens_df as b on a.host_id=b.host_id

---(vii) (instant_bookable) (THESSALONIKI)
select round((cast(super_host_bookable as float)/(super_host_bookable+host_bookable)*100),2) as sh_prob_with_instant_booking,
round((cast(super_host_unbookable as float)/(super_host_unbookable+host_unbookable)*100),2) as sh_prob_without_instant_booking
from
(select 
sum(case when a.host_is_superhost=1 and b.instant_bookable=1 then 1 else 0 end) as super_host_bookable,
sum(case when a.host_is_superhost=1 and b.instant_bookable=0 then 1 else 0 end) as super_host_unbookable,
sum(case when a.host_is_superhost=0 and b.instant_bookable=1 then 1 else 0 end) as host_bookable,
sum(case when a.host_is_superhost=0 and b.instant_bookable=0 then 1 else 0 end) as host_unbookable
from host_thessaloniki as a inner join listing_thessaloniki as b on a.host_id=b.host_id)c

---(vii) (instant_bookable) (ATHENS)
select round((cast(super_host_bookable as float)/(super_host_bookable+host_bookable)*100),2) as sh_prob_with_instant_booking,
round((cast(super_host_unbookable as float)/(super_host_unbookable+host_unbookable)*100),2) as sh_prob_without_instant_booking
from
(select 
sum(case when a.host_is_superhost=1 and b.instant_bookable=1 then 1 else 0 end) as super_host_bookable,
sum(case when a.host_is_superhost=1 and b.instant_bookable=0 then 1 else 0 end) as super_host_unbookable,
sum(case when a.host_is_superhost=0 and b.instant_bookable=1 then 1 else 0 end) as host_bookable,
sum(case when a.host_is_superhost=0 and b.instant_bookable=0 then 1 else 0 end) as host_unbookable
from host_athens as a inner join listing_athens_df as b on a.host_id=b.host_id)c

---(viii) (hosting duration) (THESSALONIKI)
select round((cast(SH_long_duration as float)/(SH_long_duration+H_long_duration)*100),2) as sh_prob_with_long_hosting_duration,
round((cast(SH_med_duration as float)/(SH_med_duration+H_med_duration)*100),2) as sh_prob_with_med_hosting_duration,
round((cast(SH_short_duration as float)/(SH_short_duration+H_short_duration)*100),2) as sh_prob_with_short_hosting_duration
from
(select
sum(case when host_is_superhost=1 and hosting_duration>1500 then 1 else 0 end) as SH_long_duration,
sum(case when host_is_superhost=1 and hosting_duration>500 and hosting_duration<=1500 then 1 else 0 end) as SH_med_duration,
sum(case when host_is_superhost=1 and hosting_duration>=0 and hosting_duration<=500 then 1 else 0 end) as SH_short_duration,
sum(case when host_is_superhost=0 and hosting_duration>1500 then 1 else 0 end) as H_long_duration,
sum(case when host_is_superhost=0 and hosting_duration>500 and hosting_duration<=1500 then 1 else 0 end) as H_med_duration,
sum(case when host_is_superhost=0 and hosting_duration>=0 and hosting_duration<=500 then 1 else 0 end) as H_short_duration
from(
select c.host_id,datediff(day,c.host_since,max(a.date)) as hosting_duration ,host_is_superhost from review_thessaloniki as a
inner join listing_thessaloniki as b on a.listing_id=b.id
inner join host_thessaloniki as c on b.host_id=c.host_id group by c.host_id ,c.host_since,host_is_superhost)cc)s

---(viii) (hosting duration) (ATHENS)
select round((cast(SH_long_duration as float)/(SH_long_duration+H_long_duration)*100),2) as sh_prob_with_long_hosting_duration,
round((cast(SH_med_duration as float)/(SH_med_duration+H_med_duration)*100),2) as sh_prob_with_med_hosting_duration,
round((cast(SH_short_duration as float)/(SH_short_duration+H_short_duration)*100),2) as sh_prob_with_short_hosting_duration
from
(select
sum(case when host_is_superhost=1 and hosting_duration>1500 then 1 else 0 end) as SH_long_duration,
sum(case when host_is_superhost=1 and hosting_duration>500 and hosting_duration<=1500 then 1 else 0 end) as SH_med_duration,
sum(case when host_is_superhost=1 and hosting_duration>=0 and hosting_duration<=500 then 1 else 0 end) as SH_short_duration,
sum(case when host_is_superhost=0 and hosting_duration>1500 then 1 else 0 end) as H_long_duration,
sum(case when host_is_superhost=0 and hosting_duration>500 and hosting_duration<=1500 then 1 else 0 end) as H_med_duration,
sum(case when host_is_superhost=0 and hosting_duration>=0 and hosting_duration<=500 then 1 else 0 end) as H_short_duration
from(
select c.host_id,datediff(day,c.host_since,max(a.date)) as hosting_duration ,host_is_superhost from review_athens as a
inner join listing_athens_df as b on a.listing_id=b.id
inner join host_athens as c on b.host_id=c.host_id group by c.host_id ,c.host_since,host_is_superhost)cc)s


---(ix) (review scores) (THESSALONIKI)
select round((cast(SH_excellent_avg as float)/(SH_excellent_avg+H_excellent_avg)*100),2) as sh_prob_with_excelent_avg_score,
round((cast(SH_good_avg as float)/(SH_good_avg+H_good_avg)*100),2) as sh_prob_with_good_avg_score,
round((cast(SH_bad_avg as float)/(SH_bad_avg+H_bad_avg)*100),2) as sh_prob_with_short_hosting_duration
from
(select 
sum(case when host_is_superhost=1 and TOTAL_AVG>=4.8 then 1 else 0 end) as SH_excellent_avg,
sum(case when host_is_superhost=1 and TOTAL_AVG>=4 and TOTAL_AVG<4.8 then 1 else 0 end) as SH_good_avg,
sum(case when host_is_superhost=1 and TOTAL_AVG>=0 and TOTAL_AVG<4 then 1 else 0 end) as SH_bad_avg,
sum(case when host_is_superhost=0 and TOTAL_AVG>=4.8 then 1 else 0 end) as H_excellent_avg,
sum(case when host_is_superhost=0 and TOTAL_AVG>=4 and TOTAL_AVG<4.8 then 1 else 0 end) as H_good_avg,
sum(case when host_is_superhost=0 and TOTAL_AVG>=0 and TOTAL_AVG<4 then 1 else 0 end) as H_bad_avg
FROM(SELECT 
(A1+A2+A3+A4+A5+A6+A7)/7 AS TOTAL_AVG,host_is_superhost FROM 
(SELECT a.host_id,A.host_is_superhost,
B.review_scores_rating AS A1,B.review_scores_accuracy AS A2,B.review_scores_cleanliness AS A3
,B.review_scores_checkin AS A4,B.review_scores_communication AS A5,
B.review_scores_location AS A6,B.review_scores_value AS A7 FROM host_thessaloniki AS A
INNER JOIN listing_thessaloniki AS B ON A.host_id=B.host_id
GROUP BY a.host_id ,A.host_is_superhost,B.review_scores_rating,B.review_scores_accuracy ,B.review_scores_cleanliness
,B.review_scores_checkin ,B.review_scores_communication ,
B.review_scores_location ,B.review_scores_value)c WHERE (A1+A2+A3+A4+A5+A6+A7)/7 IS NOT NULL)d)e

---(ix) (review scores) (ATHENS)
select round((cast(SH_excellent_avg as float)/(SH_excellent_avg+H_excellent_avg)*100),2) as sh_prob_with_excelent_avg_score,
round((cast(SH_good_avg as float)/(SH_good_avg+H_good_avg)*100),2) as sh_prob_with_good_avg_score,
round((cast(SH_bad_avg as float)/(SH_bad_avg+H_bad_avg)*100),2) as sh_prob_with_short_hosting_duration
from
(select 
sum(case when host_is_superhost=1 and TOTAL_AVG>=4.8 then 1 else 0 end) as SH_excellent_avg,
sum(case when host_is_superhost=1 and TOTAL_AVG>=4 and TOTAL_AVG<4.8 then 1 else 0 end) as SH_good_avg,
sum(case when host_is_superhost=1 and TOTAL_AVG>=0 and TOTAL_AVG<4 then 1 else 0 end) as SH_bad_avg,
sum(case when host_is_superhost=0 and TOTAL_AVG>=4.8 then 1 else 0 end) as H_excellent_avg,
sum(case when host_is_superhost=0 and TOTAL_AVG>=4 and TOTAL_AVG<4.8 then 1 else 0 end) as H_good_avg,
sum(case when host_is_superhost=0 and TOTAL_AVG>=0 and TOTAL_AVG<4 then 1 else 0 end) as H_bad_avg
FROM(SELECT 
(A1+A2+A3+A4+A5+A6+A7)/7 AS TOTAL_AVG,host_is_superhost FROM 
(SELECT a.host_id,A.host_is_superhost,
B.review_scores_rating AS A1,B.review_scores_accuracy AS A2,B.review_scores_cleanliness AS A3,
B.review_scores_checkin AS A4,B.review_scores_communication AS A5,
B.review_scores_location AS A6,B.review_scores_value AS A7 FROM host_athens AS A
INNER JOIN listing_athens_df AS B ON A.host_id=B.host_id
GROUP BY a.host_id ,A.host_is_superhost,B.review_scores_rating,B.review_scores_accuracy 
,B.review_scores_cleanliness ,B.review_scores_checkin ,B.review_scores_communication ,
B.review_scores_location ,B.review_scores_value)c WHERE (A1+A2+A3+A4+A5+A6+A7)/7 IS NOT NULL)d)e


---(b) Using the above analysis, identify top 3 crucial metrics one needs to maintain to become a Super Host and also, find their average values.

---(i) (avg_review_scores) (THESSALONIKI)
SELECT 
round(avg(case when host_is_superhost=1 then TOTAL_AVG  end),2) as SH_avg_review_scores,
round(avg(case when host_is_superhost=0 then TOTAL_AVG  end),2) as H_avg_review_scores
FROM(SELECT 
(A1+A2+A3+A4+A5+A6+A7)/7 AS TOTAL_AVG,host_is_superhost FROM 
(SELECT a.host_id,A.host_is_superhost,
B.review_scores_rating AS A1,B.review_scores_accuracy AS A2,B.review_scores_cleanliness AS A3,
B.review_scores_checkin AS A4,B.review_scores_communication AS A5,
B.review_scores_location AS A6,B.review_scores_value AS A7 FROM host_thessaloniki AS A
INNER JOIN listing_thessaloniki AS B ON A.host_id=B.host_id
GROUP BY a.host_id ,A.host_is_superhost,B.review_scores_rating,B.review_scores_accuracy ,
B.review_scores_cleanliness ,B.review_scores_checkin ,B.review_scores_communication ,
B.review_scores_location ,B.review_scores_value)c WHERE (A1+A2+A3+A4+A5+A6+A7)/7 IS NOT NULL)d 

---(i) (avg_review_scores) (ATHENS)
SELECT 
round(avg(case when host_is_superhost=1 then TOTAL_AVG  end),2) as SH_avg_review_scores,
round(avg(case when host_is_superhost=0 then TOTAL_AVG  end),2) as H_avg_review_scores
FROM(SELECT 
(A1+A2+A3+A4+A5+A6+A7)/7 AS TOTAL_AVG,host_is_superhost FROM 
(SELECT a.host_id,A.host_is_superhost,
B.review_scores_rating AS A1,B.review_scores_accuracy AS A2,B.review_scores_cleanliness AS A3,
B.review_scores_checkin AS A4,B.review_scores_communication AS A5,
B.review_scores_location AS A6,B.review_scores_value AS A7 FROM host_athens AS A
INNER JOIN listing_athens_df AS B ON A.host_id=B.host_id
GROUP BY a.host_id ,A.host_is_superhost,B.review_scores_rating,B.review_scores_accuracy ,
B.review_scores_cleanliness ,B.review_scores_checkin ,B.review_scores_communication ,
B.review_scores_location ,B.review_scores_value)c WHERE (A1+A2+A3+A4+A5+A6+A7)/7 IS NOT NULL)d 

---(ii) avg days (THESSALONIKI)
select
avg(case when host_is_superhost=1 then hosting_duration end) as SH_avg_days,
avg(case when host_is_superhost=0 then hosting_duration end) as H_avg_days
from(
select c.host_id,datediff(day,c.host_since,max(a.date)) as hosting_duration ,host_is_superhost from review_thessaloniki as a
inner join listing_thessaloniki as b on a.listing_id=b.id
inner join host_thessaloniki as c on b.host_id=c.host_id group by c.host_id ,c.host_since,host_is_superhost)cc

---(ii) avg days (ATHENS)
select
avg(case when host_is_superhost=1 then hosting_duration end) as SH_avg_days,
avg(case when host_is_superhost=0 then hosting_duration end) as H_avg_days
from(
select c.host_id,datediff(day,c.host_since,max(a.date)) as hosting_duration ,host_is_superhost from review_athens as a
inner join listing_athens_df as b on a.listing_id=b.id
inner join host_athens as c on b.host_id=c.host_id group by c.host_id ,c.host_since,host_is_superhost)cc

---(iii) (avg response rate) (THESSALONIKI)
select
round(avg(case when host_is_superhost=1 then host_response_rate end),2)as avg_superhost_response_rate,
round(avg(case when host_is_superhost=0 then host_response_rate end),2) as avg_host_response_rate
from host_thessaloniki;

---(iii) (avg response rate) (ATHENS)
select
round(avg(case when host_is_superhost=1 then host_response_rate end),2)as avg_superhost_response_rate,
round(avg(case when host_is_superhost=0 then host_response_rate end),2) as avg_host_response_rate
from host_athens;

---(c) Analyze how does the comments of reviewers vary for listings of Super Hosts vs Other Hosts(Extract words from the comments provided by the reviewers)

---SUPER HOST VS HOST COMMENTS (THESSALONIKI)
Select
count(Case when host=1 then comments end) as super_host_comments,
sum(Case when host=1 and comments like '%location%' then 1 else 0 end) as location,
sum(Case when host=1 and comments like '%clean%' then 1 else 0 end) as clean,
sum(Case when host=1 and comments like '%great%' then 1 else 0 end) as great,
sum(Case when host=1 and comments like '%host%canceled%' then 1 else 0 end) as host_canceled,
sum(Case when host=1 and comments like '%helpful%' then 1 else 0 end) as helpful
from (select top 30000 c.host_id as h,c.host_is_superhost as host,b.comments as comments from listing_thessaloniki a 
inner join review_thessaloniki b on a.id=b.listing_id
inner join host_thessaloniki c on a.host_id=c.host_id where c.host_is_superhost=1 and b.comments is not null
group by c.host_id,c.host_is_superhost,b.comments)cc

Select 
count(Case when host=0 then comments end) as host_comments,
sum(Case when host=0 and comments like '%location%' then 1 else 0 end) as location,
sum(Case when host=0 and comments like '%clean%' then 1 else 0 end) as clean,
sum(Case when host=0 and comments like '%great%' then 1 else 0 end) as great,
sum(Case when host=0 and comments like '%host%canceled%' then 1 else 0 end) as host_canceled,
sum(Case when host=0 and comments like '%helpful%' then 1 else 0 end) as helpful
from (select top 30000 c.host_id,c.host_is_superhost as host,b.comments as comments from listing_thessaloniki a 
inner join review_thessaloniki b on a.id=b.listing_id
inner join host_thessaloniki c on a.host_id=c.host_id where c.host_is_superhost=0 and b.comments is not null
group by c.host_id,c.host_is_superhost,b.comments)cc

---SUPER HOST VS HOST COMMENTS (ATHENS)
Select
count(Case when host=1 then comments end) as super_host_comments,
sum(Case when host=1 and comments like '%location%' then 1 else 0 end) as location,
sum(Case when host=1 and comments like '%clean%' then 1 else 0 end) as clean,
sum(Case when host=1 and comments like '%great%' then 1 else 0 end) as great,
sum(Case when host=1 and comments like '%host%canceled%' then 1 else 0 end) as host_canceled,
sum(Case when host=1 and comments like '%helpful%' then 1 else 0 end) as helpful
from (select top 150000 c.host_id as h,c.host_is_superhost as host,b.comments as comments from listing_athens_df a 
inner join review_athens b on a.id=b.listing_id
inner join host_athens c on a.host_id=c.host_id where c.host_is_superhost=1 and b.comments is not null
group by c.host_id,c.host_is_superhost,b.comments)cc

Select 
count(Case when host=0 then comments end) as host_comments,
sum(Case when host=0 and comments like '%location%' then 1 else 0 end) as location,
sum(Case when host=0 and comments like '%clean%' then 1 else 0 end) as clean,
sum(Case when host=0 and comments like '%great%' then 1 else 0 end) as great,
sum(Case when host=0 and comments like '%host%canceled%' then 1 else 0 end) as host_canceled,
sum(Case when host=0 and comments like '%helpful%' then 1 else 0 end) as helpful
from (select top 150000 c.host_id,c.host_is_superhost as host,b.comments as comments from listing_athens_df a 
inner join review_athens b on a.id=b.listing_id
inner join host_athens c on a.host_id=c.host_id where c.host_is_superhost=0 and b.comments is not null
group by c.host_id,c.host_is_superhost,b.comments)cc


----(d) Analyze do Super Hosts tend to have large property types as compared to Other Hosts

---SUPER HOST VS HOST LARGE PROPERTY (THESSALONIKI)
select sum(cc) as large_property_superhost from(
Select count(h.host_id) as CC from host_thessaloniki H 
inner join listing_thessaloniki L on H.host_id=L.host_id
 where (property_type like '%entire%' or 
property_type like '%dome house%' or property_type like '%earth house%' or property_type like '%Boat%' or property_type like '%tower%')
and host_is_superhost=1 group by h.host_id)d

select sum(cc) as large_property_host from(
Select count(h.host_id) as CC from host_thessaloniki H 
inner join listing_thessaloniki L on H.host_id=L.host_id
 where (property_type like '%entire%' or 
property_type like '%dome house%' or property_type like '%earth house%' or property_type like '%Boat%' or property_type like '%tower%')
and host_is_superhost=0 group by h.host_id)d



---SUPER HOST VS HOST LARGE PROPERTY (ATHENS)
select sum(cc) as large_property_superhost from(
Select count(h.host_id) as CC from host_athens H 
inner join listing_athens_df L on H.host_id=L.host_id
 where (property_type like '%entire%' or 
property_type like '%cycladic house%' or property_type like '%earth house%' or property_type like '%Boat%' or property_type like '%farm stay%')
and host_is_superhost=1 group by h.host_id)d

select sum(cc) as large_property_host from(
Select count(h.host_id) as CC from host_athens H 
inner join listing_athens_df L on H.host_id=L.host_id
 where (property_type like '%entire%' or 
property_type like '%cycladic house%' or property_type like '%earth house%' or property_type like '%Boat%' or property_type like '%farm stay%')
and host_is_superhost=0 group by h.host_id)d


---(e) Analyze the average price and availability of the listings for the upcoming year between Super Hosts and Other Hosts

---AVERAGE PRICE AND AVAILABILITY FOR HOST VS SUPERHOST (THESSALONIKI)
select round((cast(sum(available_times) as float)/sum(total_days))*100,2) as percent_available,avg(avg_price) as avg_price,host
from(
select sum(case when available=1 then 1 end) as available_times,
count(available) as total_days,host_id,host,avg(price) as avg_price from(
select a.*,b.host_id,c.host_is_superhost as host from thessaloniki_availability as a inner join listing_thessaloniki as b on
a.listing_id=b.id inner join host_thessaloniki as c on c.host_id=b.host_id)d group by host_id,host)e group by host;

---AVERAGE PRICE AND AVAILABILITY FOR HOST VS SUPERHOST(ATHENS)
select round((cast(sum(available_times) as float)/sum(total_days))*100,2) as percent_available,avg(avg_price) as avg_price,host
from(
select sum(case when available=1 then 1 end) as available_times,
count(available) as total_days,host_id,host,avg(price) as avg_price from(
select a.*,b.host_id,c.host_is_superhost as host from df_athens_availability as a inner join listing_athens_df as b on
a.listing_id=b.id inner join host_athens as c on c.host_id=b.host_id)d where host is not null group by host_id,host)e group by host;


---(f) Analyze if there is some difference in above mentioned trends between Local Hosts or Hosts residing in other locations 

---(i) (profile pic) (THESSALONIKI)
select 
round((cast(LH_with_profilepic as float)/(total_lh)*100),2) as LH_percent_with_profilepic,
round((cast(GH_with_profilepic as float)/(total_gh)*100),2) as GH_percent_with_profilepic
from
(select
sum(case when host_is_local=1 then 1 end) as total_lh,
sum(case when host_is_local=0 then 1 end) as total_gh,
sum(case when host_is_local=1 and host_has_profile_pic=1 then 1 else 0 end) as LH_with_profilepic,
sum(case when host_is_local=0 and host_has_profile_pic=1 then 1 else 0 end) as GH_with_profilepic
from
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(SELECT * FROM host_thessaloniki)c)d)e;

---(i) (profile pic) (ATHENS)
select 
round((cast(LH_with_profilepic as float)/(total_lh)*100),2) as LH_percent_with_profilepic,
round((cast(GH_with_profilepic as float)/(total_gh)*100),2) as GH_percent_with_profilepic
from
(select
sum(case when host_is_local=1 then 1 end) as total_lh,
sum(case when host_is_local=0 then 1 end) as total_gh,
sum(case when host_is_local=1 and host_has_profile_pic=1 then 1 else 0 end) as LH_with_profilepic,
sum(case when host_is_local=0 and host_has_profile_pic=1 then 1 else 0 end) as GH_with_profilepic
from
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(SELECT * FROM host_athens)c)d)e;

---(ii) (verified) (THESSALONIKI)
select round((cast(verified_local_host as float)/(total_lh)*100),2) as LH_percent_with_verification,
round((cast(verified_host as float)/(total_gh)*100),2) as GH_percent_with_verification
from
(select
sum(case when host_is_local=1 then 1 end) as total_lh,
sum(case when host_is_local=0 then 1 end) as total_gh,
sum(case when host_is_local=1 and host_identity_verified=1 then 1 else 0 end) as verified_local_host,
sum(case when host_is_local=0 and host_identity_verified=1 then 1 else 0 end) as verified_host
from
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(SELECT * FROM host_thessaloniki)c)d)e;

---(ii) (verified) (ATHENS)
select round((cast(verified_local_host as float)/(total_lh)*100),2) as LH_percent_with_verification,
round((cast(verified_host as float)/(total_gh)*100),2) as GH_percent_with_verification
from
(select
sum(case when host_is_local=1 then 1 end) as total_lh,
sum(case when host_is_local=0 then 1 end) as total_gh,
sum(case when host_is_local=1 and host_identity_verified=1 then 1 else 0 end) as verified_local_host,
sum(case when host_is_local=0 and host_identity_verified=1 then 1 else 0 end) as verified_host
from
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(SELECT * FROM host_athens)c)d)e;

--(iii) (response rate) (THESSALONIKI)
select round((cast(ideal_lh_response_rate as float)/(total_lh)*100),2) as percent_lh_ideal_response_rate,
 round((cast(ideal_gh_response_rate as float)/(total_gh)*100),2) as percent_gh_ideal_response_rate
from
(select
sum(case when host_is_local=1 then 1 end) as total_lh,
sum(case when host_is_local=0 then 1 end) as total_gh,
sum(case when host_is_local=1 and host_response_rate>=90 then 1 else 0 end) as ideal_lh_response_rate,
sum(case when host_is_local=0 and host_response_rate>=90 then 1 else 0 end) as ideal_gh_response_rate
from
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(SELECT * FROM host_thessaloniki)c)d)e;

---(iii) (response rate) (ATHENS)
select round((cast(ideal_lh_response_rate as float)/(total_lh)*100),2) as percent_lh_ideal_response_rate,
 round((cast(ideal_gh_response_rate as float)/(total_gh)*100),2) as percent_gh_ideal_response_rate
from
(select
sum(case when host_is_local=1 then 1 end) as total_lh,
sum(case when host_is_local=0 then 1 end) as total_gh,
sum(case when host_is_local=1 and host_response_rate>=90 then 1 else 0 end) as ideal_lh_response_rate,
sum(case when host_is_local=0 and host_response_rate>=90 then 1 else 0 end) as ideal_gh_response_rate
from
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(SELECT * FROM host_athens)c)d)e;

---(iv) (acceptance rate) (THESSALONIKI)
select round((cast(ideal_lh_acceptance_rate as float)/(total_lh)*100),2) as percent_lh_ideal_acceptance_Rate,
round((cast(ideal_gh_acceptance_rate as float)/(total_gh)*100),2) as percent_gh_ideal_acceptance_Rate
from
(select
sum(case when host_is_local=1 then 1 end) as total_lh,
sum(case when host_is_local=0 then 1 end) as total_gh,
sum(case when host_is_local=1 and host_acceptance_rate>=90 then 1 else 0 end) as ideal_lh_acceptance_rate,
sum(case when host_is_local=0 and host_acceptance_rate>=90 then 1 else 0 end) as ideal_gh_acceptance_rate
from 
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(SELECT * FROM host_thessaloniki)c)d)e

---(iv) (acceptance rate) (ATHENS)
select round((cast(ideal_lh_acceptance_rate as float)/(total_lh)*100),2) as percent_lh_ideal_acceptance_Rate,
round((cast(ideal_gh_acceptance_rate as float)/(total_gh)*100),2) as percent_gh_ideal_acceptance_Rate
from
(select
sum(case when host_is_local=1 then 1 end) as total_lh,
sum(case when host_is_local=0 then 1 end) as total_gh,
sum(case when host_is_local=1 and host_acceptance_rate>=90 then 1 else 0 end) as ideal_lh_acceptance_rate,
sum(case when host_is_local=0 and host_acceptance_rate>=90 then 1 else 0 end) as ideal_gh_acceptance_rate
from 
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(SELECT * FROM host_athens)c)d)e

---(v) (average price) (THESSALONIKI)
select
round(avg(case when host_is_local=1 then price end),0) as lh_avg_price,
round(avg(case when host_is_local=0 then price end),0) as gh_avg_price
from
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(SELECT a.*,b.price FROM host_thessaloniki as a inner join listing_thessaloniki as b on a.host_id=b.host_id)c)d

---(v) (average price) (ATHENS)
select
round(avg(case when host_is_local=1 then price end),0) as lh_avg_price,
round(avg(case when host_is_local=0 then price end),0) as gh_avg_price
from
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(SELECT a.*,b.price FROM host_athens as a inner join listing_athens_df as b on a.host_id=b.host_id)c)d


---(vi) (instant booking) (THESSALONIKI)
select round((cast(lh_bookable as float)/(total_lh)*100),2) as lh_percent_with_instant_booking,
round((cast(gh_bookable as float)/(total_gh)*100),2) as gh_percent_with_instant_booking
from
(select
sum(case when host_is_local=1 then 1 end) as total_lh,
sum(case when host_is_local=0 then 1 end) as total_gh,
sum(case when host_is_local=1 and instant_bookable=1 then 1 else 0 end) as lh_bookable,
sum(case when host_is_local=0 and instant_bookable=1 then 1 else 0 end) as gh_bookable
from
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(SELECT a.*,b.instant_bookable FROM host_thessaloniki as a inner join listing_thessaloniki as b on a.host_id=b.host_id)c)d)e

---(vi) (instant booking) (ATHENS)
select round((cast(lh_bookable as float)/(total_lh)*100),2) as lh_percent_with_instant_booking,
round((cast(gh_bookable as float)/(total_gh)*100),2) as gh_percent_with_instant_booking
from
(select
sum(case when host_is_local=1 then 1 end) as total_lh,
sum(case when host_is_local=0 then 1 end) as total_gh,
sum(case when host_is_local=1 and instant_bookable=1 then 1 else 0 end) as lh_bookable,
sum(case when host_is_local=0 and instant_bookable=1 then 1 else 0 end) as gh_bookable
from
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(SELECT a.*,b.instant_bookable FROM host_athens as a inner join listing_athens_df as b on a.host_id=b.host_id)c)d)e

---(vii) (hosting duration) (THESSALONIKI)
select
avg(case when host_is_local=1 then hosting_duration end) as lh_avg_hosting_duration,
avg(case when host_is_local=0 then hosting_duration end) as gh_avg_hosting_duration
from
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(select c.host_id,datediff(day,c.host_since,max(a.date)) as hosting_duration ,host_location  from review_thessaloniki as a
inner join listing_thessaloniki as b on a.listing_id=b.id
inner join host_thessaloniki as c on b.host_id=c.host_id group by c.host_id ,c.host_since,host_location )c)d

---(vii) (hosting duration) (ATHENS)
select
avg(case when host_is_local=1 then hosting_duration end) as lh_avg_hosting_duration,
avg(case when host_is_local=0 then hosting_duration end) as gh_avg_hosting_duration
from
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(select c.host_id,datediff(day,c.host_since,max(a.date)) as hosting_duration ,host_location  from review_athens as a
inner join listing_athens_df as b on a.listing_id=b.id
inner join host_athens as c on b.host_id=c.host_id group by c.host_id ,c.host_since,host_location )c)d

---(viii) (average review scores) (THESSALONIKI)
SELECT 
round(avg(case when host_is_local=1 then TOTAL_AVG  end),2) as lh_avg_review_scores,
round(avg(case when host_is_local=0 then TOTAL_AVG  end),2) as gh_avg_review_scores
FROM
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(SELECT 
(A1+A2+A3+A4+A5+A6+A7)/7 AS TOTAL_AVG,host_is_superhost,host_location
FROM (SELECT a.host_id,A.host_is_superhost,a.host_location,
B.review_scores_rating AS A1,B.review_scores_accuracy AS A2,B.review_scores_cleanliness AS A3,
B.review_scores_checkin AS A4,B.review_scores_communication AS A5,
B.review_scores_location AS A6,B.review_scores_value AS A7 FROM host_thessaloniki AS A
INNER JOIN listing_thessaloniki AS B ON A.host_id=B.host_id
GROUP BY a.host_id ,A.host_is_superhost,a.host_location,B.review_scores_rating,B.review_scores_accuracy ,
B.review_scores_cleanliness ,B.review_scores_checkin ,B.review_scores_communication ,
B.review_scores_location ,B.review_scores_value)c)d)e

---(viii) (average review scores) (ATHENS)
SELECT 
round(avg(case when host_is_local=1 then TOTAL_AVG  end),2) as lh_avg_review_scores,
round(avg(case when host_is_local=0 then TOTAL_AVG  end),2) as gh_avg_review_scores
FROM
(SELECT *,
(CASE WHEN host_location like '%greece%' OR host_location LIKE '%GR%' THEN 1 ELSE 0 END) AS host_is_local
FROM(SELECT 
(A1+A2+A3+A4+A5+A6+A7)/7 AS TOTAL_AVG,host_is_superhost,host_location
FROM (SELECT a.host_id,A.host_is_superhost,a.host_location,
B.review_scores_rating AS A1,B.review_scores_accuracy AS A2,B.review_scores_cleanliness AS A3,
B.review_scores_checkin AS A4,B.review_scores_communication AS A5,
B.review_scores_location AS A6,B.review_scores_value AS A7 FROM host_athens AS A
INNER JOIN listing_athens_df AS B ON A.host_id=B.host_id
GROUP BY a.host_id ,A.host_is_superhost,a.host_location,B.review_scores_rating,B.review_scores_accuracy ,
B.review_scores_cleanliness ,B.review_scores_checkin ,B.review_scores_communication ,
B.review_scores_location ,B.review_scores_value)c)d)e