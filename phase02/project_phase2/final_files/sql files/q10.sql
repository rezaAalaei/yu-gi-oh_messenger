with community_admin(user_id, community_count)
as ( select communitymembership.userID, count(communitymembership.communityID)
     from communitymembership
     where role = 'admin'
     group by communitymembership.userID),
    group_admin(user_id, group_count)
as ( select groupmembership.userID, count(groupmembership.groupID)
     from groupmembership
     where role = 'admin'
     group by groupmembership.userID)
select user_id, community_count,group_count
from community_admin natural join group_admin
where community_count >= 1 and group_count >= 1
order by (community_count + group_count) desc