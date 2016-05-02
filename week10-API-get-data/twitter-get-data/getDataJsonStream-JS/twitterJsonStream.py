import tweepy, json
from tweepy import Stream
from tweepy.streaming import StreamListener

CONSUMER_KEY = 'xxx'
CONSUMER_SECRET = 'xxx'
ACCESS_KEY = 'xxx'
ACCESS_SECRET = 'xxx'
auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_KEY, ACCESS_SECRET)
api = tweepy.API(auth)

# Create a json Object
jsonObj = { "tweets":[ ] }
 
# Create a Stream Listener
class MyListener(StreamListener):
 
    # When data are received
    def on_data(self, data):

        try:
            # Append data to json Object
            jsonObj['tweets'].append(data)
            with open('hey.json', 'w') as f:
                # Write Data into a json file
                json.dump(jsonObj, f, indent=4, separators=(',', ': '))
                print jsonObj
                return True
        
        except BaseException as e:
            print("Error on_data: %s" % str(e))
        return True
 
    def on_error(self, status):
        print(status)
        return True
 
twitter_stream = Stream(auth, MyListener())
# Use filter to stream tweet with specific keyword or hastag
twitter_stream.filter(track=['#trump'])





