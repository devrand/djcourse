#!/usr/bin/python
# -*- coding: utf8 -*-py

import urllib2  # 2 read webpages
from bs4 import BeautifulSoup  # 2 find elements on web page
import re # regexes, 2 search for keywords

url = 'http://w1.c1.rada.gov.ua/pls/zweb2/webproc555'
response = urllib2.urlopen(url)
html = response.read()


soup = BeautifulSoup(html.decode('cp1251'), "html.parser")

laws = soup.select('table.striped tr td[align="left"]')
#[l for l in laws if l.match(r'суд|прокуратура') ]

for l in laws:
	if re.match(ur'.*тварин', l.text): print(l.text)
































