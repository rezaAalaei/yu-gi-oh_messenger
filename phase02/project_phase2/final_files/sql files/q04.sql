with group_message(group_name, message_count)
as ( select message.groupID, count(message.messageID)
     from message
     group by message.groupID),
    total_message(total)
 as ( select sum(message_count)
      from group_message)
select group_name, (message_count / total) as message_percentage
from group_message, total_message
order by message_percentage desc;