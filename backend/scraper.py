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
    query = input('Enter your keyword:\n')
    query = '#' + query + ' lang:en'
    max_results = input('Enter how many tweets:\n')
    max_results = int(max_results)
    tweets = client.search_recent_tweets(query= query, max_results = max_results, sort_order='relevancy')
    for tweet in tweets.data:
        print(tweet.text)
        #if tweet.public_metrics[2] is None:
        #    print('0')
        #else:
        #    print(str(tweet.public_metrics[2]))


except BaseException as e:
    print('Status Failed On,',str(e))