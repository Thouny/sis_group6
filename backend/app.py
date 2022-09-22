from flask import Flask
from flask_restful import Resource, Api, reqparse

import main

app = Flask(__name__)
api = Api(app)

currentQuery = ""

class Sentiment(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('query', required=True, type=str, location='values')
        args = parser.parse_args()
        currentQuery = args['query']
        return{
            'query': args['query']
        }, 200

        
    #dont need to get data for now as local json file is already created
    #def get(self):
        #for tweet in main.tweets.data:
            #data = tweet.data
            #return {'data': data}, 200
    
    def get(self):
        return {'sentimentStat': main.sentimentAnalysis(currentQuery)}, 200

class testMode(Resource):
    pass

api.add_resource(testMode, '/testmode')
api.add_resource(Sentiment, '/sentiment')

if __name__ == "__main__":
    app.run(debug=True)