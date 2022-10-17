from flask import Flask
from flask_restful import Resource, Api, reqparse
import json
import main

app = Flask(__name__)
api = Api(app)


class Sentiment(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('query', required=True,
                            type=str, location='values')
        args = parser.parse_args()
        with open('query.json', 'w', encoding='utf8') as outfile:
            json.dump(args['query'], outfile)

        return {
            'query': args['query']
        }, 200
        
    def get(self):
        with open('query.json', 'r', encoding='utf8') as outfile:
            query = json.load(outfile)
        return main.sentimentAnalysis(query), 200


class SentimentAtDate(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('query', required=True,
                            type=str, location='values')
        parser.add_argument('days_to_substract', required=True,
                            type=str, location='values')
        args = parser.parse_args()
        with open('query_at_date.json', 'w', encoding='utf8') as outfile:
            json.dump({'query': args['query'],
                       'days_to_substract': args['days_to_substract']
                       }, outfile, indent=4)

        return {
            'query': args['query'],
            'days_to_substract': args['days_to_substract']
        }, 200

    def get(self):
        with open('query_at_date.json', 'r', encoding='utf8') as outfile:
            dict = json.load(outfile)
            query = dict['query']
            daysToSubstract = dict['days_to_substract']
        return main.sentimentAnalysisAtDate(query, daysToSubstract), 200


class testMode(Resource):
    pass

class SentimentReddit(Resource):        
    def get(self):
        with open('query.json', 'r', encoding='utf8') as outfile:
            query = json.load(outfile)
        return main.sentimentAnalysis(query), 200



api.add_resource(testMode, '/testmode')
api.add_resource(Sentiment, '/sentiment')
api.add_resource(SentimentAtDate, '/sentimentAtDate')
api.add_resource(SentimentReddit, '/sentimentReddit')


if __name__ == "__main__":
    app.run(debug=True)
