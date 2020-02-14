'''
# Some good resources:
https://towardsdatascience.com/how-to-access-twitters-api-using-tweepy-5a13a206683b
# I likee this method, esentially the author gets various follower and then uses those follower
# ids to get the timelines of speicif people
'''
import tweepy
import os

twitter_api_key = os.environ['twitter_api_key']
twitter_api_secret_key = os.environ['twitter_api_secret_key']
twitter_token = os.environ['twitter_token']
twitter_secret_token = os.environ['twitter_secret_token']

auth = tweepy.OAuthHandler(twitter_api_key, twitter_api_secret_key)
auth.set_access_token(twitter_token, twitter_secret_token)
api = tweepy.API(auth)

# Create a cursor object of Donald trump's tweets and loop through them printing to console
for status in tweepy.Cursor(api.user_timeline, id="@realDonaldTrump").items():
    # Print the text of the tweet
    print(status.text)

