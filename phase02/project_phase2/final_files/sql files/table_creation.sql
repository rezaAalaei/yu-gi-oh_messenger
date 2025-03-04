create table User (
    userID      varchar(25),
    username    varchar(25) not null,
    email       varchar(50) not null,
    password    varchar(50) not null,
    phoneNumber varchar(13),

    primary key (userID),
    unique (username)
);

create table UserProfile (
    userID varchar(25),
    firstName varchar (25) not null ,
    lastName varchar (25) not null ,
    bio text,
    profilePictureUrl varchar (200),

    primary key (userID)
);

create table Post (
    postID        varchar(25),
    creatorUserID varchar(25) not null ,
    caption       text,
    createTime    timestamp not null ,
    mediaUrl      varchar(200),

    primary key (postID),
    foreign key (creatorUserID) references User(userID),
    unique (creatorUserID)
);


create table Comment (
    commentID  varchar(25),
    postID     varchar(25) not null,
    userID     varchar(25) not null,
    context    text not null,
    createTime timestamp not null,

    primary key (commentID),
    foreign key (postID) references Post(postID),
    foreign key (userID) references User(userID)
);

create table `Like`(
    postID   varchar(25) not null ,
    userID   varchar(25) not null ,
    likeTime timestamp not null ,

    primary key (postID, userID),
    foreign key (postID) references Post(postID),
    foreign key (userID) references User(userID)
);

create table `Group` (
    groupID          varchar(25),
    ownerID          varchar(25),
    groupName        varchar(25) not null ,
    groupDescription text,
    groupPictureUrl  varchar(200),

    primary key (groupID),
    foreign key (ownerID) references User(userID)
);

create table Message (
    messageID varchar(25),
    groupID   varchar(25),
    senderID  varchar(25),
    sendTime  timestamp,
    mediaUrl  varchar(200),
    context   Text,

    primary key (messageID),
    foreign key (groupID) references `Group`(groupID),
    foreign key (senderID) references User(userID)
);

create table GroupMembership (
    userID   varchar(25),
    groupID  varchar(25),
    role     varchar(10),
    joinTime timestamp,

    primary key (userID, groupID),
    foreign key (userID) references User(userID),
    foreign key (groupID) references `Group`(groupID)
);

create table Community
(
    communityID          varchar(25),
    ownerID              varchar(25),
    communityName        varchar(25) not null,
    communityDescription text,
    communityPictureUrl  varchar(200),

    primary key (communityID),
    foreign key (ownerID) references User(userID)
);

create table CommunityMembership
(
    userID      varchar(25),
    communityID varchar(25),
    role        varchar(10),
    joinTime    timestamp,

    primary key (userID, communityID),
    foreign key (userID) references User(userID),
    foreign key (communityID) references Community(communityID)
);

create table CommunityPosts
(
    postID      varchar(25),
    communityID varchar(25),
    postTime    timestamp,

    primary key (postID, communityID),
    foreign key (postID) references Post(postID),
    foreign key (communityID) references Community(communityID)
);

create table Hashtag
(
    hashtagID varchar(25),
    context   text,

    primary key (hashtagID)
);

create table PostHashtag
(
    postID    varchar(25),
    hashtagID varchar(25),

    primary key (postID, hashtagID),
    foreign key (postID) references Post(postID),
    foreign key (hashtagID) references Hashtag(hashtagID)
);

create table Follow
(
    followerID varchar(25),
    followedID varchar(25),
    followTime timestamp,

    primary key (followerID, followedID),
    foreign key (followerID) references User(userID),
    foreign key (followedID) references User(userID)
);

create table BlackList
(
    blockerID varchar(25),
    blockedID varchar(25),
    blockTime timestamp,

    primary key (blockerID, blockedID),
    foreign key (blockerID) references User(userID),
    foreign key (blockedID) references User(userID)
);


