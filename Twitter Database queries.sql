create database Twitter_Database;
use Twitter_Database;
-- creating user table 
CREATE TABLE Users(
    user_id INT PRIMARY KEY,
    user_name VARCHAR(255),
    pass VARCHAR(255),
    email VARCHAR(255),
   mobile_number VARCHAR(15),
	bio VARCHAR(255),
    generated_time DATETIME
);
-- creating twitter table 
CREATE TABLE Tweets (
    tweet_id INT PRIMARY KEY,
    comment_id INT,
     user_id INT,
    tweet_content TEXT,
    parent_tweet_id INT,
	commented_content TEXT,
    generated_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
	 FOREIGN KEY (parent_tweet_id) REFERENCES Tweets(tweet_id)
);
-- Creating retweet table
CREATE TABLE Retweets (
    retweet_id INT PRIMARY KEY,
    original_tweet_id INT,
    user_id INT,
	generated_time DATETIME,
    FOREIGN KEY (original_tweet_id) REFERENCES Tweets(tweet_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- A like table containing data for liking tweets, comments( which are treated as tweet ) and also retweets
CREATE TABLE Likes (
    like_id INT PRIMARY KEY,
    tweet_id INT,
    retweet_id INT,
    user_id INT,
    FOREIGN KEY (tweet_id) REFERENCES Tweets(tweet_id),
    FOREIGN KEY (retweet_id) REFERENCES Retweets(retweet_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
-- Follow table for storing who followed whom
CREATE TABLE Follows_datas (
    follow_id INT PRIMARY KEY,
    follower_user_id INT,
    following_user_id INT,
    FOREIGN KEY (follower_user_id ) REFERENCES Users(user_id),
    FOREIGN KEY (following_user_id) REFERENCES Users(user_id)
);

-- Inserting records into user table
-- Users table
INSERT INTO Users (user_id, pass, user_name, email, mobile_number, bio, generated_time)
VALUES
    (1,'******', 'Priyanshu Sharma', 'priyanshusharma72002@gmail.com', '123-456-7890','Developer, likes coding', '2024-01-28 12:00:00'),
    (2,'*******', 'Mihir Sharma', 'mihir@example.com', '987-654-3210','Singer', '2024-01-28 12:15:00'),
    (3,'*******', 'Aryan', 'aryan@example.com', '555-123-4567','Likes sports very much', '2024-01-28 12:30:00'),
    (4,'*******', 'Neha Yadav', 'nehayadav@example.com', '888-999-0000','Dance is love', '2024-01-28 12:45:00'),
    (5,'*******', 'Rahul', 'rahul@example.com', '111-222-3333','Coder', '2024-01-28 13:00:00'),
    (6,'*******', 'Rohan Gupta','rohangupta@example.com', '444-555-6666','Plays chess', '2024-01-28 13:15:00'),
    (7,'*******', 'Vijay', 'vijay@example.com', '777-888-9999','Exploring the world', '2024-01-28 13:30:00'),
    (8,'*******', 'Ritik Kumar', 'ritikkumar@example.com', '123-456-7890','eat, sleep, repeat', '2024-01-28 13:45:00');

-- Tweets table
INSERT INTO Tweets (tweet_id, comment_id, user_id, tweet_content, parent_tweet_id, commented_content, generated_time)
VALUES
    (1, NULL, 1, 'This is the first tweet by User 1', NULL, NULL, '2024-01-28 12:00:00'),
    (2, NULL, 2, 'Hello Twitter! User 2 here.', NULL, NULL, '2024-01-28 12:15:00'),
    (3, NULL, 3, 'Tweet from User 3. Exciting times!', NULL, NULL, '2024-01-28 12:30:00'),
    (4, NULL, 4, 'Another original tweet by User 4', NULL, NULL, '2024-01-28 12:45:00'),
    (5, 1, 2, NULL, 1, 'Replying to User 1\'s tweet. Cool!', '2024-01-28 13:00:00'),
    (6, 2, 3, NULL, 2, 'Replying to User 2\'s tweet. Hey there!', '2024-01-28 13:15:00'),
    (7, 5, 4, NULL, 1, 'Replying to User 1\'s tweet. Interesting!', '2024-01-28 13:30:00'),
    (8, 6, 1, NULL, 2, 'Replying to User 2\'s tweet. Nice!', '2024-01-28 13:45:00'),
    (9, NULL, 5, 'Just joined Twitter! Excited to connect with everyone.', NULL, NULL, '2024-01-28 14:00:00'),
    (10, NULL, 6, 'Tweeting from my new account. Follow for tech updates!', NULL, NULL, '2024-01-28 14:15:00'),
    (11, NULL, 7, 'Tweeting about my latest travel adventures. #wanderlust', NULL, NULL, '2024-01-28 14:30:00'),
    (12, NULL, 8, 'Just shared a new blog post. Check it out!', NULL, NULL, '2024-01-28 14:45:00');

-- Retweets table
INSERT INTO Retweets (retweet_id, original_tweet_id, user_id, generated_time)
VALUES
    (1, 1, 3, '2024-01-28 15:00:00'),    -- User 3 retweets Tweet 1
    (2, 2, 4, '2024-01-28 15:30:00'),    -- User 4 retweets Tweet 2
    (3, 3, 5, '2024-01-28 16:00:00'),    -- User 5 retweets Tweet 3
    (4, 4, 6, '2024-01-28 16:30:00');    -- User 6 retweets Tweet 4

-- Likes table
INSERT INTO Likes (like_id, tweet_id, retweet_id, user_id)
VALUES
    (1, 1, NULL, 2),    -- User 2 likes Tweet 1
    (2, NULL, 1, 3),    -- User 3 likes Retweet 1
    (3, 2, NULL, 4),    -- User 4 likes Tweet 2
    (4, 5, NULL, 1),    -- User 1 likes Tweet 5
    (5, 3, NULL, 1),    -- User 1 likes Tweet 3
    (6, NULL, 2, 5),    -- User 5 likes Retweet 2
    (7, 4, NULL, 6),    -- User 6 likes Tweet 4
    (8, 9, NULL, 2);    -- User 2 likes Tweet 9

-- Follow table
INSERT INTO Follows_datas (follow_id, follower_user_id, following_user_id)
VALUES
    (1, 1, 2),    -- User 1 follows User 2
    (2, 2, 3),    -- User 2 follows User 3
    (3, 3, 4),    -- User 3 follows User 4
    (4, 4, 5),    -- User 4 follows User 5
    (5, 5, 6),    -- User 5 follows User 6
    (6, 6, 7),    -- User 6 follows User 7
    (7, 7, 8);    -- User 7 follows User 8
  

-- code for 1st query which says Fetch all users name from database
SELECT user_name FROM Users;


-- code for 2nd query fetch all tweets by user id , most recent tweets first
-- SELECT * FROM Tweets WHERE user_id = Tweets.user_id ORDER BY timestamp DESC;  // this query gives all the tweets for every user as per the timeline
SELECT tweet_content, commented_content, generated_time AS recently
FROM Tweets
WHERE user_id =2  -- by changing user id here we can see different users tweets recently
ORDER BY generated_time DESC;


-- code for 3rd query which says Fetch like count of particular tweet by tweet id
SELECT  COUNT(*) AS like_count
FROM Likes
WHERE tweet_id = 5; -- by changing the tweet_id we can get the like count on that particular tweet exactly



-- code for 4th query  which says Fetch retweet count of particular tweet by tweet id
SELECT COUNT(*) AS retweet_count
FROM Retweets
WHERE original_tweet_id =2; -- by changing original tweet id we can know how many times that particular tweet is retweeted


-- code for 5th query which says Fetch comment count of particular tweet by tweet id
SELECT 
    parent_tweet_id,
    COUNT(*) AS comment_count
FROM 
    Tweets
WHERE 
    parent_tweet_id = 2;  -- by changing the parent tweet id we can  fetch comment count of particular tweet
    

-- code for 6th query which asks Fetch all user's name who have retweeted particular tweet by tweet id.
SELECT U.user_name
FROM Users U
JOIN Retweets R ON U.user_id = R.user_id
WHERE R.original_tweet_id = 4;  -- by changing the original tweet id we can  fetch all user's name who have retweeted particular tweet


-- code for 7th query which asks Fetch all commented tweet's content for particular tweet by tweet id.
SELECT T.tweet_content   -- it will display tweet's content as many times as the content has comments on it
FROM Tweets T
JOIN Tweets C ON T.tweet_id = C.parent_tweet_id
WHERE T.tweet_id = 2;

-- code for 8th query is Fetch user's timeline (All tweets from users whom i am following with tweet content and user name who has tweeted it
SELECT 
    T.tweet_content,
    T.commented_content,
    U.user_name AS name_of_user,
    T.generated_time AS created_at
FROM 
    Tweets AS T
INNER JOIN 
    Users AS U ON T.user_id = U.user_id
INNER JOIN 
    Follows_datas AS F ON U.user_id = F.following_user_id
WHERE 
    F.follower_user_id =3 -- by changing the value of follower user id we can get all the tweets let it either be normal tweet or comment since in twitter both are treated as tweets so both the datas are displayed along with user name
ORDER BY 
    T.generated_time DESC;



