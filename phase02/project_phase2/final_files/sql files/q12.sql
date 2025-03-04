select community.ownerID, community.communityID
from community
where community.ownerID not in ( select distinct creatorUserID
                                 from communityposts, post
                                 where communityposts.postID = post.postID)

