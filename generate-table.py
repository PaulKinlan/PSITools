#! /usr/bin/python

import json
import os
import urllib2 
import urllib
import sys
import fileinput

pagespeed_url = "https://developers.google.com/speed/pagespeed/insights/?url="

for line in fileinput.input():
  #try:
    obj = json.loads(line)
    id = obj["id"]
    title = obj["title"]
    score = obj["score"]
    pageStats = obj["pageStats"]
    image_url = obj["screenshot"]["data"]

    sys.stdout.write("## [")
    sys.stdout.write(title.encode('utf-8'))
    sys.stdout.write("](%s)\n" % (id))


    print "*  Score: [%s](%s%s)\n\n" % (score, pagespeed_url, id)

    sys.stdout.write("\n|Number of Resources")
    sys.stdout.write( "|Number of Hosts")
    sys.stdout.write( "|Total Resources Bytes")
    sys.stdout.write( "|Nubmer of Static Resources")
    sys.stdout.write( "|HTML Response Bytes")
    sys.stdout.write( "|Text Response Bytes")
    sys.stdout.write( "|CSS Response Bytes")
    sys.stdout.write( "|Image Response Bytes")
    sys.stdout.write( "|JS Response Bytes")
    sys.stdout.write( "|Flash Response Bytes")
    sys.stdout.write( "|Other Response Bytes")
    sys.stdout.write( "|Number of JS Resources")
    sys.stdout.write( "|Number of CSS Resources")

    sys.stdout.write("\n|-------------------")
    sys.stdout.write("|-------------------")
    sys.stdout.write("|-------------------")
    sys.stdout.write("|-------------------")
    sys.stdout.write("|-------------------")
    sys.stdout.write("|-------------------")
    sys.stdout.write("|-------------------")
    sys.stdout.write("|-------------------")
    sys.stdout.write("|-------------------")
    sys.stdout.write("|-------------------")
    sys.stdout.write("|-------------------")
    sys.stdout.write("|-------------------")
    sys.stdout.write("|-------------------")

  
    sys.stdout.write("\n|%s" % (pageStats["numberResources"]))
    sys.stdout.write("|%s" % (pageStats["numberHosts"]))
    sys.stdout.write("|%s" % (pageStats["totalRequestBytes"]))
    sys.stdout.write("|%s" % (pageStats["numberStaticResources"]))
    sys.stdout.write("|%s" % (pageStats["htmlResponseBytes"]))

    if "textResponseBytes" in pageStats:
      sys.stdout.write("|%s" % (pageStats["textResponseBytes"]))
    else:
      sys.stdout.write("|0")


    if "cssResponseBytes" in pageStats:
      sys.stdout.write("|%s" % (pageStats["cssResponseBytes"]))
    else:
      sys.stdout.write("|0")

    if "imageResponseBytes" in pageStats:
      sys.stdout.write("|%s" % (pageStats["imageResponseBytes"]))
    else:
      sys.stdout.write("|0")

    if "javascriptResponseBytes" in pageStats:
      sys.stdout.write("|%s" % (pageStats["javascriptResponseBytes"]))
    else:
      sys.stdout.write("|0")

    if "flashResponseBytes" in pageStats:
      sys.stdout.write("|%s" % (pageStats["flashResponseBytes"]))
    else:
      sys.stdout.write("|0")

    if "otherResponseBytes" in pageStats:
      sys.stdout.write("|%s" % (pageStats["otherResponseBytes"]))
    else:
      sys.stdout.write("|0")

    if "numberJsResources" in pageStats:
      sys.stdout.write("|%s" % (pageStats["numberJsResources"]))
    else:
      sys.stdout.write("|0")

    if "numberCssResources" in pageStats:
      sys.stdout.write("|%s" % (pageStats["numberCssResources"]))
    else:
      sys.stdout.write("|0")

    print "\n\n"

    print "<img src='data:%s'>" % (image_url)

    sys.stdout.flush()
  #except:
  #  print "error"
