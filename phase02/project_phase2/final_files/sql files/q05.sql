with user_followers(user_id, follower_count)
as ( select follow.followedID, count(follow.followedID)
     from follow
     group by follow.followedID)
select user_id, follower_count
from user_followers
order by follower_count desc
LIMIT 3
