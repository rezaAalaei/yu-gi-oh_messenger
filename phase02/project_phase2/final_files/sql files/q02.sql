select g1.groupID, g2.groupID, count(g1.userID) as same_members_count
from groupmembership g1, groupmembership g2
where g1.groupID != g2.groupID and g1.userID = g2.userID
group by g1.groupID
order by same_members_count desc
limit 1