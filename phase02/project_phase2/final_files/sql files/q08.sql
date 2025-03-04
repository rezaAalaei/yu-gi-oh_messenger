with user_likes(user_id, like_count)
as ( select `like`.userID, count(`like`.postID)
     from `like`
     group by userID),
    user_comments(user_id, comment_count)
as ( select comment.userID, count(comment.commentID)
     from comment
     group by userID)
select user_id, like_count, comment_count, (like_count + comment_count) as user_interaction
from user_comments natural join user_likes
order by user_interaction desc
limit 1;