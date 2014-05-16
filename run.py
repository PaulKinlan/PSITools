#! /usr/bin/python

import json
import os
import urllib2 
import urllib
import sys
import fileinput

url = "https://www.googleapis.com/pagespeedonline/v1/runPagespeed?key=AIzaSyBfFgrmdXPeTDseNiODoMkrdvCWSsVuGr0&strategy=mobile&screenshot=true&rule=AvoidLandingPageRedirects&rule=ServerResponseTime&rule=MinimizeRenderBlockingResources&rule=PrioritizeVisibleContent&rule=EnableGzipCompression&rule=InlineRenderBlockingCss&rule=PreferAsyncResources&rule=uselegiblefontsizes&rule=sizetaptargetsappropriately&rule=avoidplugins&rule=configureviewport&url="

for line in fileinput.input():
	try:
		res = urllib2.urlopen(url + urllib.quote(line.rstrip()))
		print "%s" % (json.dumps(json.loads(res.read())))
		sys.stdout.flush()
	except:
	  pass
