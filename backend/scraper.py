#pip install git+https://github.com/tweepy/tweepy.git

from http import client
import tweepy

consumer_key = "x" #Your API/Consumer key 
consumer_secret = "x" #Your API/Consumer Secret Key
access_token = "x"    #Your Access token key
access_token_secret = "x" #Your Access token Secret key

#Pass in our twitter API authentication key
client = tweepy.Client(
    consumer_key, consumer_secret,
    access_token, access_token_secret
)

search_query = "mc donalds"
no_of_tweets =100


try:
    query = 'news'
    tweets = client.search_recent_tweets(query=query, max_results=10)
    for tweet in tweets.data:
        print(tweet.text)

except BaseException as e:
    print('Status Failed On,',str(e))