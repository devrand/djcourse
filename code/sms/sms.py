#!/usr/bin/env python
# -*- coding: utf-8 -*-
from twilio.rest import TwilioRestClient # pip install twilio

import sys
sys.path.append("..")
from course_config import * 

 

# u need TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN, twilio from_ telephone number
# u could obtain it on twilio site
 
client = TwilioRestClient(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN) 
 
client.messages.create(
	to="+380501112222", # change it
	from_="+1212121212", # change it 
	body="python sender",  # this is a body of your sms message
)
