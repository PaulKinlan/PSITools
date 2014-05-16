#! /usr/bin/python

import json
import os
import urllib2 
import urllib
import sys
import fileinput

for line in fileinput.input():
  (domain, score) = line.split("\t")
  print "%s\n--------\n\n" % (domain)
  print "*  Score: %s" % (score)
  sys.stdout.flush()
