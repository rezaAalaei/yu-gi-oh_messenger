with post_likes(post_id, like_count)
as (select `like`.postID, count(like.userID)
    from `like`
    group by `like`.postID)
select hashtagID, sum(like_count) as hashtag_likes
from posthashtag join post_likes on postID = post_id
group by hashtagID
order by hashtag_likes desc
limit 1