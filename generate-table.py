#! /usr/bin/python

import json
import os
import urllib2 
import urllib
import sys
import fileinput

pagespeed_url = "https://developers.google.com/speed/pagespeed/insights/?url="

sites = []

for line in fileinput.input():
  obj = json.loads(line)
 
  sites.append({
      "id": obj["id"],
      "title": obj["title"],
      "score": obj["score"],
      "pageStats": obj["pageStats"],
      "image_mime": obj["screenshot"]["mime_type"],
      "image_url": obj["screenshot"]["data"].replace("_", "/").replace("-", "+")
    }) 

sorted_sites = sorted(sites, key=lambda k: k['score'])

sorted_sites.reverse()

for site in sorted_sites:

  id = site["id"]
  title = site["title"]
  score = site["score"]
  pageStats = site["pageStats"]
  image_mime = site["image_mime"]
  image_url = site["image_url"]

  print "\n"

  sys.stdout.write("## [")
  sys.stdout.write(title.encode('utf-8'))
  sys.stdout.write("](%s)\n\n" % (id))


  print "**Score**: [%s](%s%s)\n\n" % (score, pagespeed_url, id)
  print "<img src='data:%s;base64,%s'>" % (image_mime, image_url)

  print "\n### Request information\n"
  
  print "*  Number of Resources: %s" % (pageStats["numberResources"])
  print "*  Number of Hosts: %s" % (pageStats["numberHosts"])
  print "*  Number of JS Resources: %s" % (pageStats.get("numberJsResources", "0"))
  print "*  Number of CSS Resources: %s" % (pageStats.get("numberCssResources", "0"))
  print "*  Nubmer of Static Resources: %s" % (pageStats["numberStaticResources"])
  print "*  Total Request Bytes: %s" % (pageStats["totalRequestBytes"])

  print "\n### Response data\n"

  print "*  HTML Response Bytes: %s" % (pageStats["htmlResponseBytes"])
  print "*  Text Response Bytes: %s" % (pageStats.get("textResponseBytes", "0"))
  print "*  CSS Response Bytes: %s" % (pageStats.get("cssResponseBytes", "0"))
  print "*  Image Response Bytes: %s" % (pageStats.get("imageResponseBytes", "0"))
  print "*  JS Response Bytes: %s" % (pageStats.get("javascriptResponseBytes", "0"))
  print "*  Flash Response Bytes: %s" % (pageStats.get("flashResponseBytes", "0"))
  print "*  Other Response Bytes: %s" % (pageStats.get("otherResponseBytes", "0"))

  print "<hr>"
  

  sys.stdout.flush()

