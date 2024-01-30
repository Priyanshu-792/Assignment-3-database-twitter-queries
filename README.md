# Twitter Queries explanation!

1. **Fetch all users name from database**
   - This query retrieves the names of all users stored in the database.

2. **Fetch all tweets by user id, most recent tweets first**
   - This query retrieves all tweets posted by a specific user, sorted by the timestamp in descending order to display the most recent tweets first.

3. **Fetch like count of particular tweet by tweet id**
   - This query calculates and returns the number of likes for a particular tweet specified by its tweet_id.

4. **Fetch retweet count of particular tweet by tweet id**
   - This query calculates and returns the number of times a particular tweet has been retweeted, identified by its original_tweet_id.

5. **Fetch comment count of particular tweet by tweet id**
   - This query retrieves the count of comments on a particular tweet specified by its tweet_id.

6. **Fetch all user's name who have retweeted particular tweet by tweet id**
   - This query retrieves the names of all users who have retweeted a particular tweet specified by its original_tweet_id.

7. **Fetch all commented tweet's content for particular tweet by tweet id**
   - This query retrieves the content of all tweets/comments associated with a particular tweet specified by its tweet_id.

8. **Fetch user's timeline (All tweets from users whom I am following with tweet content and user name who has tweeted it)**
   - This query retrieves the timeline of tweets for a specific user, including tweets and comments posted by users they are following, along with the tweet content, commenter's name, and creation timestamp, sorted by timestamp in descending order to display the most recent tweets first.

