with group_list(group_id, user_id)
as ( select g1.groupID, g1.userID
     from groupmembership g1, groupmembership g2
     where g1.groupID = g2.groupID and g1.userID != g2.userID)
select distinct group_id
from group_list
where group_list.user_id in ( select blockerID
                              from blacklist);