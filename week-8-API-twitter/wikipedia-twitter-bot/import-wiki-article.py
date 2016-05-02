import random
import string
import wikipedia
import tweepy, time

#Twitter credentials
CONSUMER_KEY = 'ptoezC9K59GVf0C1ycNvvnFle'
CONSUMER_SECRET = 'nNfa3WC1aRJOK5RDZu97OVBnFZi1c965YNaX4yQ5QjWok6ikbb'
ACCESS_KEY = '2199230268-y22MYnF1770DueU7nwlk9EAxqsIIGm0sLhOifAj'
ACCESS_SECRET = 'Hb0eRGgiKFoHnElTECZnW3HhomTRFojRzdSEhsfY6xTRG'
auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_KEY, ACCESS_SECRET)
api = tweepy.API(auth)

# function to get a wikipedia page (handling ambigious query)
def getWikiPage(title):
  try:
    page = wikipedia.page(title)
  except wikipedia.exceptions.DisambiguationError as e:
    print(e.options)
    title = random.choice(e.options)
    page = wikipedia.page(title)
  return page

# random string
def randomWord(length):
  return ''.join(random.sample(string.ascii_lowercase,length))


# set wikipedia to the good language and run a search for the string
wikipedia.set_lang('fr')

for x in range(0,5):
  # get a random string
  randw = randomWord(3)
  # search
  search = wikipedia.search(randw)
  # randomly choose a result
  title = random.choice(search)
  # get the page for this result
  randomSum = wikipedia.summary(title, sentences=1)
  randomSumChar = len(randomSum)
  print randomSumChar
  if randomSumChar < 140:
    print randomSum
    api.update_status(randomSum)
    time.sleep(60) #Sleep for 1 minute
  else:
    x = x-1

