select groupmembership.groupID, count(role) as admin_count
from groupmembership
where role = 'admin'
group by groupmembership.groupID
order by admin_count desc
limit 1