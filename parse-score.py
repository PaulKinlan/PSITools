#! /usr/bin/python

import json
import os
import urllib2 
import urllib
import sys
import fileinput

for line in fileinput.input():
  try:
    obj = json.loads(line)
    print "%s\t%s" % (obj["id"], obj["score"])
    sys.stdout.flush()
  except:
    pass
