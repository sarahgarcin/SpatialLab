import random
import string
import wikipedia
import tweepy, time

#Twitter credentials
CONSUMER_KEY = '9DjIENIeHf93ne4QnVOB4pcpm'
CONSUMER_SECRET = 'EJrfG2fAFFDOzdH0b1eGAnqNKSsoFYvQkyZeZgIeF1wmQ72i2c'
ACCESS_KEY = '724263547178487808-nN9zrTr7WFtkGYBSa2OjXT7TzWm0Cpu'
ACCESS_SECRET = '1YFXMvV7LZbZJlcnl04SPgikgWnTjIpHWpinD7lZsyl3L'
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

wikipedia.set_lang('en')

# randw = randomWord(2)
# search = wikipedia.search(randw)
# # randomly choose a result
# title = random.choice(search)
# print("title="+title)
# word = title.lower()
# print("word="+word)

wordInput = raw_input("Write a word: ")
print("wordInput="+wordInput)
search = wikipedia.search(wordInput)
title = random.choice(search)
word = title.lower()
print("word="+word)

# Count the syllables in the word.
syllables = 0
for i in range(len(word)) :

   # If the first letter in the word is a vowel then it is a syllable.
   if i == 0 and word[i] in "aeiouy" :
      syllables = syllables + 1

   # Else if the previous letter is not a vowel.
   elif word[i - 1] not in "aeiouy" :

      # If it is no the last letter in the word and it is a vowel.
      if i < len(word) - 1 and word[i] in "aeiouy" :
         syllables = syllables + 1

      # Else if it is the last letter and it is a vowel that is not e.
      elif i == len(word) - 1 and word[i] in "aiouy" :
         syllables = syllables + 1

# Adjust syllables from 0 to 1.
if len(word) > 0 and syllables == 0 :
   syllables == 0
   syllables = 1


# Display the result.
print("The word contains", syllables, "syllables")

for x in range(0,15):
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
  if syllables == 5 and randomSumChar < 100:
     print syllables
     api.update_status(randomSum)
     time.sleep(30)
  # if randomSumChar < 140:
  #   print randomSum
  #   api.update_status(randomSum)
  #   time.sleep(60) #Sleep for 1 minute
  else:
    x = x-1
