# pip install git+https://github.com/tweepy/tweepy.git
# pip install transformers
# pip install torch
# pip install flask
# pip install flask-sqlalchemy
# pip install flask-restful
# pip install nltk
# python -m nltk.downloader stopwords
# pip install collection
# pip install requests

# import libaries for use
import torch
import torch.nn as nn
from transformers import BertTokenizer, BertModel
from http import client
import tweepy
import keys
import json
from collections import Counter
from nltk.corpus import stopwords
import re
import datetime
import requests

# constants for defining the model
MAX_LENGTH = 64
BERT_NAME = 'bert-base-uncased'

# use gpu over cpu
device = torch.device(
    "cuda") if torch.cuda.is_available() else torch.device("cpu")

# defines the classifier class before calling it


class SentimentClassifier(nn.Module):
    def __init__(self, n_classes, max_length, device):
        super(SentimentClassifier, self).__init__()
        self.device = device
        self.bert = BertModel.from_pretrained(BERT_NAME).to(self.device)
        self.tokenizer = BertTokenizer.from_pretrained(BERT_NAME)
        self.drop = nn.Dropout(p=0.3).to(self.device)
        self.out = nn.Linear(self.bert.config.hidden_size,
                             n_classes).to(self.device)
        self.max_length = max_length

    def pre_process_data(self, text):
        encoded_review = self.tokenizer.encode_plus(
            text,
            max_length=self.max_length,
            add_special_tokens=True,
            return_token_type_ids=False,
            pad_to_max_length=True,
            return_attention_mask=True,
            return_tensors='pt',
        )
        input_ids = encoded_review['input_ids'].to(self.device)
        attention_mask = encoded_review['attention_mask'].to(self.device)
        return input_ids, attention_mask

    def forward(self, input_ids, attention_mask=None):
        if attention_mask == None:
            input_ids, attention_mask = self.pre_process_data(input_ids)
        o = self.bert(
            input_ids=input_ids,
            attention_mask=attention_mask
        )
        pooled_output = o['pooler_output']
        output = self.drop(pooled_output)
        return self.out(output)


# loading model we have saved
model = SentimentClassifier(2, max_length=MAX_LENGTH, device=device)
model.load_state_dict(torch.load('testmodel.pt'))

# Passing auth key from key.py that has been exculuded from github
client = tweepy.Client(bearer_token=keys.BEARER,
                       consumer_key=keys.CONSUMER_KEY,
                       consumer_secret=keys.CONSUMER_SECRET,
                       access_token=keys.ACCESS_KEY,
                       access_token_secret=keys.ACCESS_SECRET)

# main function


def sentimentAnalysis(query):
    count = 0
    total = 0
    customStopWords = [query.lower(), 'https', 'n',
                       'nhttps', 'the', 'rt', 'for', 't', 'a', 'co']
    try:
        # get query
        #query = input('Enter your keyword:\n')
        query = '#' + query + ' lang:en'
        queryList = []
        # max_results = input('Enter how many tweets:\n')
        # max_results = int(max_results)
        max_results = 100
        tweets = client.search_recent_tweets(
            query=query, max_results=max_results, sort_order='relevancy')
        query = query + '.json'
        stop = stopwords.words('english')
        output = []
        for tweet in tweets.data:
            # print(tweet.text)
            class_names = ['negative', "positive"]
            sentiment = model(tweet.text)
            _, sentiment = torch.max(sentiment, dim=1)
            # print(class_names[sentiment])
            tweet.data['sentiment'] = class_names[sentiment]
            if sentiment == 1:
                count = count + 1
            total = total + 1
            queryList.append(tweet.data)
            currentTweet = tweet.text.encode('ascii', errors='ignore').decode()
            output.append(currentTweet + '\n')
        with open("Output.txt", "w", encoding='utf8') as text_file:
            text_file.write(str(output) + '\n')
        positiveSentiment = count / total * 100
    except BaseException as e:
        print('Status Failed On,', str(e))

    stopWords = stopwords.words('english')

    for stop in customStopWords:
        stopWords.append(stop)
    words = re.findall(r'\w+', open('Output.txt').read().lower())
    for word in list(words):
        if word in stopWords:
            words.remove(word)

    with open('sentiment.json', 'w', encoding='utf8') as outfile:
        json.dump(
            {'sentimentStat': positiveSentiment,
             'tweets': queryList,
             'word_cloud': Counter(words).most_common(50),
             }, outfile, indent=4)

    return {'sentimentStat': positiveSentiment,
            'tweets': queryList,
            'word_cloud': Counter(words).most_common(50),
            }


def sentimentAnalysisAtDate(query, daysToSubstract):
    count = 0
    total = 0
    customStopWords = [query.lower(), 'https', 'n',
                       'nhttps', 'the', 'rt', 'for', 't', 'a', 'co']
    try:
        query = '#' + query + ' lang:en'
        queryList = []
        max_results = 100
        if (int(daysToSubstract) == 1):
            today = datetime.datetime.now(datetime.timezone.utc)
            daysToMinus = datetime.timedelta(days=int(daysToSubstract))
            start_day = today - daysToMinus
            tweets = client.search_recent_tweets(
                query=query, max_results=max_results, sort_order='relevancy', start_time=start_day)
        else:
            daysToMinus = datetime.timedelta(days=int(daysToSubstract))
            today = datetime.datetime.now(datetime.timezone.utc)
            start_day = today - daysToMinus
            end_day = start_day + datetime.timedelta(days=1)
            tweets = client.search_recent_tweets(
                query=query, max_results=max_results, sort_order='relevancy', start_time=start_day, end_time=end_day)

        query = query + '.json'
        stop = stopwords.words('english')
        output = []
        for tweet in tweets.data:
            # print(tweet.text)
            class_names = ['negative', "positive"]
            sentiment = model(tweet.text)
            _, sentiment = torch.max(sentiment, dim=1)
            tweet.data['sentiment'] = class_names[sentiment]
            if sentiment == 1:
                count = count + 1
            total = total + 1
            queryList.append(tweet.data)
            currentTweet = tweet.text.encode('ascii', errors='ignore').decode()
            output.append(currentTweet + '\n')
        with open("Output.txt", "w", encoding='utf8') as text_file:
            text_file.write(str(output) + '\n')
        positiveSentiment = count / total * 100
    except BaseException as e:
        print('Status Failed On,', str(e))

    stopWords = stopwords.words('english')

    for stop in customStopWords:
        stopWords.append(stop)
    words = re.findall(r'\w+', open('Output.txt').read().lower())
    for word in list(words):
        if word in stopWords:
            words.remove(word)

    with open('sentiment_at_date.json', 'w', encoding='utf8') as outfile:
        json.dump(
            {'sentimentStat': positiveSentiment,
             'tweets': queryList,
             'word_cloud': Counter(words).most_common(50),
             'date': start_day.strftime('%Y-%m-%dT%H:%M:%S.%f')
             }, outfile, indent=4)

    return {'sentimentStat': positiveSentiment,
            'tweets': queryList,
            'word_cloud': Counter(words).most_common(50),
            'date': start_day.strftime('%Y-%m-%dT%H:%M:%S.%f')
            }

#will take in the query as well json should already be created
def sentimentAnalysisReddit(query):
    count = 0
    total = 0
    customStopWords = [query.lower(), 'https', 'n',
        'nhttps', 'the', 'rt', 'for', 't', 'a', 'co']
    try:
        #set the link we are requesting from
        headers = {
            'user-agent': 'Mozilla/5.0 (Macintosh; PPC Mac OS X 10_8_7 rv:5.0; en-US) AppleWebKit/533.31.5 (KHTML, like Gecko) Version/4.0 Safari/533.31.5',
        }
        query = 'https://www.reddit.com/r/' + query + '/comments.json?limit=100'
        queryList = []
        output = []
        #json format of all comments
        redditComments = requests.get(query, headers=headers).json()
        i = 0
        #count loop to go through all 100 comments and pull data and get sentiment
        while i < 100:
            class_names = ['negative', "positive"]
            currentComment = json.dumps(redditComments['data']['children'][i]['data']['body'])
            currentAuthor = json.dumps(redditComments['data']['children'][i]['data']['author'])
            sentiment = model(currentComment)
            _, sentiment = torch.max(sentiment, dim=1)
            #append sentiment to dictonary
            redditCommentInfo = {
                "comment": currentComment,
                "author": currentAuthor,
                "sentiment": class_names[sentiment]
            }
            queryList.append(redditCommentInfo)

            currentComment = currentComment.encode('ascii', errors='ignore').decode()
            output.append(currentComment + '\n')

            if sentiment == 1:
                count = count + 1
            total = total + 1
            i += 1

        with open("RedditOutput.txt", "w", encoding='utf8') as text_file:
            text_file.write(str(output) + '\n')
        positiveSentiment = count / total * 100

    except BaseException as e:
        print('Status Failed On,', str(e))
    
    stopWords = stopwords.words('english')
    for stop in customStopWords:
        stopWords.append(stop)

    words = re.findall(r'\w+', open('RedditOutput.txt').read().lower())
    for word in list(words):
        if word in stopWords:
            words.remove(word)

    with open('redditSentiment.json', 'w', encoding='utf8') as outfile:
        json.dump(
            {'sentimentStat': positiveSentiment,
             'comments': queryList,
             'word_cloud': Counter(words).most_common(50),
             }, outfile, indent=4)
    
    return {'sentimentStat': positiveSentiment,
            'comments': queryList,
            'word_cloud': Counter(words).most_common(50),
            }


# print outs for testing
# print(str(count) + ' tweets are positve out of ' + str(max_results))
# sentimentStat = (count/ max_results) * 100
# print(str(round(sentimentStat, 2)) + '% postive sentiment')
