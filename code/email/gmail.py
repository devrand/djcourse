#!/usr/bin/env python
# -*- coding: utf-8 -*-

import smtplib

import sys
sys.path.append("..")
from course_config import *

fromaddr = 'from@gmail.com'
toaddrs  = 'to@gmail.com'
msg = 'There was a terrible error that occured and I wanted you to know! Nevermind, rejoice!'


# of course, you need gusername and gpassword from gmail account - Anatoly
# but use your own account with care - it's better to register new google account for this

# The actual mail send
server = smtplib.SMTP('smtp.gmail.com:587')
server.starttls()
server.login(gusername,gpassword)
server.sendmail(fromaddr, toaddrs, msg)
server.quit()
