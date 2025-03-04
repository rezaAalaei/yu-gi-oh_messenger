with post_comments(post_id, comment_count)
as (select comment.postID, count(comment.commentID)
    from comment
    group by comment.postID),
    post_likes(post_id, like_count)
as (select `like`.postID, count(like.userID)
    from `like`
    group by `like`.postID)

select post_id, comment_count, like_count
from post_comments natural join post_likes
where comment_count > like_count
order by comment_count desc;
