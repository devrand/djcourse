#!/usr/bin/env python
# -*- coding: utf-8 -*-
 
import tweepy, time, sys
argfile = str(sys.argv[1])



   
#enter the corresponding information from your Twitter application:
CONSUMER_KEY = 'xxx' #keep the quotes, replace this with your consumer key
CONSUMER_SECRET = 'yyy' #keep the quotes, replace this with your consumer secret key
ACCESS_KEY = 'vvv' #keep the quotes, replace this with your access token
ACCESS_SECRET = 'zzz' #keep the quotes, replace this with your access token secret
   
auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_KEY, ACCESS_SECRET)
api = tweepy.API(auth)
    
filename=open(argfile,'r')
f=filename.readlines()
filename.close()
     
for line in f:
    api.update_status(line)
    time.sleep(600) #Tweet every 10 minutes
