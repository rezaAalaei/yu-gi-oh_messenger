select groupmembership.userID, count(groupID) as group_count
from groupmembership
where role = 'admin'
group by groupmembership.userID
order by group_count desc
limit 1;