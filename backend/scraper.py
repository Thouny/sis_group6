#pip install git+https://github.com/tweepy/tweepy.git

from http import client
import tweepy

BEARER = "x"
CONSUMER_KEY = "x"
CONSUMER_SECRET = "x" 
ACCESS_KEY = "x"    
ACCESS_SECRET = "x" 

#Pass in our twitter API authentication key
client = tweepy.Client(bearer_token=BEARER,
     consumer_key=CONSUMER_KEY, 
     consumer_secret=CONSUMER_SECRET, 
     access_token=ACCESS_KEY, 
     access_token_secret=ACCESS_SECRET)

try:
    query = 'mc donalds lang:en'
    tweets = client.search_recent_tweets(query=query, max_results=10)
    for tweet in tweets.data:
        print(tweet.text)

except BaseException as e:
    print('Status Failed On,',str(e))