#! /usr/bin/python

import json
import os
import urllib2 
import urllib
import sys
import fileinput


pagespeed_url = "https://developers.google.com/speed/pagespeed/insights/?url="

for line in fileinput.input():
  try:
    obj = json.loads(line)
    id = obj["id"]
    title = obj["title"]
    score = obj["score"]
    pageStats = obj["pageStats"]
    #image_url = obj[""]


    print "## [%s](%a)\n" % (title, id)
    print "*  Score: [%s](%s%s)\n" % (score, pagespeed_url, domain)

    sys.stdout.write("\n|Number of Resources|")
    sys.stdout.write( "|Number of Hosts|")
    sys.stdout.write( "|Total Resources Bytes|")
    sys.stdout.write( "|Nubmer of Static Resources|")
    sys.stdout.write( "|HTML Response Bytes|")
    sys.stdout.write( "|Text Response Bytes|")
    sys.stdout.write( "|CSS Response Bytes|")
    sys.stdout.write( "|Image Response Bytes|")
    sys.stdout.write( "|JS Response Bytes|")
    sys.stdout.write( "|Flash Response Bytes|")
    sys.stdout.write( "|Other Response Bytes|")
    sys.stdout.write( "|Number of JS Resources|")
    sys.stdout.write( "|Number of CSS Resources|")

    sys.stdout.write("\n|-------------------|")
    sys.stdout.write("|-------------------|")
    sys.stdout.write("|-------------------|")
    sys.stdout.write("|-------------------|")
    sys.stdout.write("|-------------------|")
    sys.stdout.write("|-------------------|")
    sys.stdout.write("|-------------------|")
    sys.stdout.write("|-------------------|")
    sys.stdout.write("|-------------------|")
    sys.stdout.write("|-------------------|")
    sys.stdout.write("|-------------------|")
    sys.stdout.write("|-------------------|")
    sys.stdout.write("|-------------------|")

  
    sys.stdout.write("\n|%s|" % (pageStats["numberResources"]))
    sys.stdout.write("|%s|" % (pageStats["numberHosts"]))
    sys.stdout.write("|%s|" % (pageStats["totalRequestBytes"]))
    sys.stdout.write("|%s|" % (pageStats["numberStaticResources"]))
    sys.stdout.write("|%s|" % (pageStats["htmlResponseBytes"]))
    sys.stdout.write("|%s|" % (pageStats["textResponseBytes"]))
    sys.stdout.write("|%s|" % (pageStats["cssResponseBytes"]))
    sys.stdout.write("|%s|" % (pageStats["imageResponseBytes"]))
    sys.stdout.write("|%s|" % (pageStats["javascriptResponseBytes"]))
    sys.stdout.write("|%s|" % (pageStats["flashResponseBytes"]))
    sys.stdout.write("|%s|" % (pageStats["otherResponseBytes"]))
    sys.stdout.write("|%s|" % (pageStats["numberJsResources"]))
    sys.stdout.write("|%s|" % (pageStats["numberCssResources"]))

    print ""

    #print "<img src='%s'>" % (image_url)
    
    sys.stdout.flush()
  except:
    pass
