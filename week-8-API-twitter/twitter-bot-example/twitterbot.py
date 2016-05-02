
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import tweepy, time

#Twitter credentials
CONSUMER_KEY = 'CONSUMER_KEY'
CONSUMER_SECRET = 'CONSUMER_SECRET'
ACCESS_KEY = 'ACCESS_KEY'
ACCESS_SECRET = 'ACCESS_SECRET'
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

