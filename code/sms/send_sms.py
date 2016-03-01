#!/usr/bin/env python
# -*- coding: utf-8 -*-
from twilio.rest import TwilioRestClient # pip install twilio

import sys
sys.path.append("..")
from course_config import * 

 

# need TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN
 
client = TwilioRestClient(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN) 
 
client.messages.create(
	to="+380506196939", 
	from_="+12018028050", 
	body="python sender",  
)
