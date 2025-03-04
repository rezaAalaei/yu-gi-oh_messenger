with user_post(user_id, post_count)
as ( select userID, count(postID)
     from user left outer join post on user.userID = post.creatorUserID
     group by userID)
select distinct communityID
from user_post join communitymembership on user_post.user_id = communitymembership.userID
where post_count >= 1
order by communityID