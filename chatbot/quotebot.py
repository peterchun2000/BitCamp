import requests
import json
import time
from time import sleep

while True:
    data = requests.get('http://positive-quotes.herokuapp.com/v1//quotes').json()


    for quote in data:
        print (quote['content'])
        post_params = {'bot_id': '03ac6c028db88c876e2dcbee8c', 'text' : quote['content']}
        requests.post('https://api.groupme.com/v3/bots/post', params=post_params)
        sleep(4000)

