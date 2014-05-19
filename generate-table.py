#! /usr/bin/python

import json
import os
import urllib2 
import urllib
import sys
import fileinput


pagespeed_url = "https://developers.google.com/speed/pagespeed/insights/?url="

for line in fileinput.input():
  (domain, score) = line.split("\t")
  print "## %s\n" % (domain)
  print "*  Score: [%s](%s%s)\n" % (score, pagespeed_url, domain)
  sys.stdout.flush()