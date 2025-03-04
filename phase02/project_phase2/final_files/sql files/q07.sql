with user_followers(user_id, follower_count)
as ( select follow.followedID, count(follow.followedID)
     from follow
     group by follow.followedID
     order by count(follow.followedID) desc
     LIMIT 1)
select `like`.postID, `like`.likeTime, userID
from `like` join user_followers on `like`.userID = user_followers.user_id

