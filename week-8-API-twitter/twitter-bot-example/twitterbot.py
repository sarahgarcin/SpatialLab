
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import tweepy, time

#Twitter credentials
CONSUMER_KEY = 'ptoezC9K59GVf0C1ycNvvnFle'
CONSUMER_SECRET = 'nNfa3WC1aRJOK5RDZu97OVBnFZi1c965YNaX4yQ5QjWok6ikbb'
ACCESS_KEY = '2199230268-y22MYnF1770DueU7nwlk9EAxqsIIGm0sLhOifAj'
ACCESS_SECRET = 'Hb0eRGgiKFoHnElTECZnW3HhomTRFojRzdSEhsfY6xTRG'
auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_KEY, ACCESS_SECRET)
api = tweepy.API(auth)

#File the bot will tweet from
filename=open('text.txt','r')
f=filename.readlines()
filename.close()

#Tweet a line every minute
for line in f:
     api.update_status(line)
     print line
     time.sleep(60) #Sleep for 1 minute

