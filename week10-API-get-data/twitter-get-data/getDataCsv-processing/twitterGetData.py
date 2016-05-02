#!/usr/bin/python

#Import tweepy, import csv, import time
import tweepy, csv, time

CONSUMER_KEY = 'xxx'
CONSUMER_SECRET = 'xxx'
ACCESS_KEY = 'xxx'
ACCESS_SECRET = 'xxx'
auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_KEY, ACCESS_SECRET)
api = tweepy.API(auth)

# Open/Create a file to append data
csvFile = open('result.csv', 'a')

# Use csv Writer to write data into the file you created
csvWriter = csv.writer(csvFile)

today = time.strftime("%Y-%m-%d")

for tweet in tweepy.Cursor(api.search, q="trump", since=today,  lang="en").items():
    #Write a row to the csv file/ I use encode utf-8
    csvWriter.writerow([tweet.created_at, tweet.text.encode('utf-8')])
    print tweet.created_at, tweet.text

# Close csv file
csvFile.close()