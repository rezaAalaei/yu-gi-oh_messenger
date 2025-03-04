with most_followed_member(user_id, follower_count)
as ( select followedID, count(followerID)
     from follow
     group by followedID
     order by count(followerID) desc
     limit 1),
    member_circle(user_id, followed_id)
as ( select most_followed_member.user_id, follow.followedID
     from follow, most_followed_member
     where followerID = user_id)
select distinct (case
          when member_circle.followed_id = `like`.userID then `like`.postID
          else comment.postID
        end) as timeline
from member_circle, `like`, comment
where member_circle.followed_id = `like`.userID or member_circle.followed_id = comment.userID
