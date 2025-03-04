with post_likes(post_id, like_count)
as ( select `like`.postID, count(like.userID)
     from `like`
     group by `like`.postID)
select post_id, like_count
from post_likes
order by like_count desc
LIMIT 3
