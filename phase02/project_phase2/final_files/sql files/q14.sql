with user_post_max(user_id, post_count)
as ( select post.creatorUserID, count(post.postID)
     from post
     group by post.creatorUserID
     order by count(post.postID) desc
     limit 1),
    user_post(user_id, post_count)
as ( select post.creatorUserID, count(post.postID)
     from post
     group by post.creatorUserID
     order by count(post.postID) desc)

select user_post_max.user_id, sum(user_post.post_count) as hidden_post_count
from blacklist join user_post on blacklist.blockerID = user_post.user_id, user_post_max
where blacklist.blockedID = user_post_max.user_id
group by user_post.user_id

