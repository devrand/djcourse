#!/usr/bin/env python
# -*- coding: utf-8 -*-
import tweepy, time, sys  # pip install tweepy

import sys
sys.path.append("..")
from course_config import * 
  
argfile = str(sys.argv[1])


# need CONSUMER_KEY, CONSUMER_SECRET, ACCESS_KEY, ACCESS_SECRET    
   
auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_KEY, ACCESS_SECRET)
api = tweepy.API(auth)
    
filename=open(argfile,'r')
f=filename.readlines()
filename.close()
     
for line in f:
    api.update_status(line)
    time.sleep(30) #Tweet every 15 minutes
