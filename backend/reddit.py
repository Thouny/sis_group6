# pip install requests

import json
import requests

headers = {
    'user-agent': 'Mozilla/5.0 (Macintosh; PPC Mac OS X 10_8_7 rv:5.0; en-US) AppleWebKit/533.31.5 (KHTML, like Gecko) Version/4.0 Safari/533.31.5',
}
redditdata = requests.get('https://www.reddit.com/r/cocacola/comments.json?limit=100', headers=headers)
reddit = redditdata.json()
with open('reddit.json', 'w') as f:
    json.dump(reddit, f)
#print(reddit['data']['children']['data'][0])
#testing = json.loads()
i = 0 
while i < 100:
    print(reddit['data']['children'][i]['data']['body'])
    i += 1
