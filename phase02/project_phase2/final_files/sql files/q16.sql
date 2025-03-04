with community_posts(community_id, post_count)
as ( select communityID, count(postID)
     from communityposts
     group by communityID),
    community_members(community_id, member_count)
as ( select communityID, count(userID)
     from communitymembership
     group by communityID)
select community_id, (post_count / member_count) as post_member_ratio
from community_posts natural join community_members
order by post_member_ratio desc
limit 3;