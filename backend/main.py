# pip install git+https://github.com/tweepy/tweepy.git
# pip install transformers
# pip install torch
# pip install flask
# pip install flask-sqlalchemy
# pip install flask-restful
# pip install nltk
# python -m nltk.downloader stopwords
# pip install collection

#import libaries for use
import torch
import torch.nn as nn
from transformers import BertTokenizer,BertModel
from http import client
import tweepy
import keys
import json
from flask import Flask
from flask_restful import Resource, Api, reqparse
from collections import Counter
from nltk.corpus import stopwords
import pandas as pd
import re

#constants for defining the model
MAX_LENGTH=64
BERT_NAME='bert-base-uncased'

#use gpu over cpu
device=torch.device("cuda") if torch.cuda.is_available() else torch.device("cpu")

#defines the classifier class before calling it
class SentimentClassifier(nn.Module):
  def __init__(self, n_classes,max_length, device):
    super(SentimentClassifier, self).__init__()
    self.device=device
    self.bert = BertModel.from_pretrained(BERT_NAME).to(self.device)
    self.tokenizer = BertTokenizer.from_pretrained(BERT_NAME)
    self.drop = nn.Dropout(p=0.3).to(self.device)
    self.out = nn.Linear(self.bert.config.hidden_size, n_classes).to(self.device)
    ### Optional: Freeze the BERT model
    # for param in self.bert.parameters():
    #   param.requires_grad = False
    self.max_length=max_length
  def pre_process_data(self,text):
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
    if attention_mask==None:
      input_ids, attention_mask=self.pre_process_data(input_ids)
    o = self.bert(
      input_ids=input_ids,
      attention_mask=attention_mask
    )
    pooled_output=o['pooler_output']
    output = self.drop(pooled_output)
    return self.out(output)

#loading model we have saved
model = SentimentClassifier(2,max_length=MAX_LENGTH,device=device)
model.load_state_dict(torch.load('testmodel.pt'))

#Passing auth key that has from key.py that has been exculuded from github
client = tweepy.Client(bearer_token=keys.BEARER,
     consumer_key=keys.CONSUMER_KEY, 
     consumer_secret=keys.CONSUMER_SECRET, 
     access_token=keys.ACCESS_KEY, 
     access_token_secret=keys.ACCESS_SECRET)

#main function
def sentimentAnalysis(query):
  count = 0
  try:
      #get query
      #query = input('Enter your keyword:\n')
      queryjson = query + '.json'
      query = '#' + query + ' lang:en'
      queryList = []
      # max_results = input('Enter how many tweets:\n')
      # max_results = int(max_results)
      max_results = 100
      tweets = client.search_recent_tweets(query= query, max_results = max_results, sort_order='relevancy')
      query = query + '.json'
      stop = stopwords.words('english')
      for tweet in tweets.data:
          #print(tweet.text)
          class_names=['negative',"positive"]
          sentiment=model(tweet.text)
          _, sentiment = torch.max(sentiment, dim=1)
          #print(class_names[sentiment])
          tweet.data['sentiment'] = class_names[sentiment]
          if sentiment == 1 :
            count = count + 1
          queryList.append(tweet.data)
          currentTweet = tweet.text.encode('ascii', errors='ignore').decode()
          with open("Output.txt","a", encoding='utf8') as text_file:
            text_file.write(currentTweet + '\n')
  except BaseException as e:
      print('Status Failed On,',str(e))

  with open(queryjson,'a',encoding='utf8') as outfile:
            json.dump(queryList, outfile, indent = 4)

  words = re.findall(r'\w+', open('Output.txt').read().lower())
  with open('wordcloud.json','a',encoding='utf8') as outfile:
          json.dump(Counter(words).most_common(10), outfile)

  return count


#print outs for testing
# print(str(count) + ' tweets are positve out of ' + str(max_results))
# sentimentStat = (count/ max_results) * 100
# print(str(round(sentimentStat, 2)) + '% postive sentiment')