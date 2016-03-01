#!/usr/bin/env python
# -*- coding: utf-8 -*-

import smtplib

import sys
sys.path.append("..")
from course_config import *

fromaddr = 'dnavred1h2@gmail.com'
toaddrs  = 'devrand@gmail.com'
msg = 'There was a terrible error that occured and I wanted you to know! Nevermind, rejoice!'


# need gusername annd gpassword from gmail account

# The actual mail send
server = smtplib.SMTP('smtp.gmail.com:587')
server.starttls()
server.login(gusername,gpassword)
server.sendmail(fromaddr, toaddrs, msg)
server.quit()
