#!/usr/bin/env python
# -*- coding: utf-8 -*-
from twilio.rest import TwilioRestClient # pip install twilio

import sys
sys.path.append("..")
from course_config import * 

 

# need TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN, twilio from_ telephone number
 
client = TwilioRestClient(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN) 
 
client.messages.create(
	to="+380501112222", 
	from_="+1212121212", 
	body="python sender",  
)
