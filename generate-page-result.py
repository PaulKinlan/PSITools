#! /usr/bin/python

import json
import os
import urllib2 
import urllib
import sys
import fileinput
from cgi import escape

pagespeed_url = "https://developers.google.com/speed/pagespeed/insights/?url="
output_directory = "results/sites/"

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

  path = os.path.join("results", "sites","%s.markdown" % urllib.quote_plus(id.replace("/","-").replace(":","-")))
  path = path[:150] if len(path) > 150 else path

  with open(path, 'w') as f:
    print >> f, "---"
    print >> f, "layout: result"
    print >> f, "title: %s" % id
    print >> f, "---"

    f.write("## [")
    f.write(title.encode('utf-8'))
    f.write("](%s)\n\n" % (id))

    print >> f, "**Check against [PageSpeed Insights live](%s%s)**\n" % (pagespeed_url, id)

    print >> f, "**Score**: [%s](%s%s)\n\n" % (score, pagespeed_url, id)
    print >> f, "<img src='data:%s;base64,%s'>" % (image_mime, image_url)

    print >> f, "\n### Request information\n"
    
    print >> f, "*  Number of Resources: %s" % (pageStats.get("numberResources", "0"))
    print >> f, "*  Number of Hosts: %s" % (pageStats.get("numberHosts", "0"))
    print >> f, "*  Number of JS Resources: %s" % (pageStats.get("numberJsResources", "0"))
    print >> f, "*  Number of CSS Resources: %s" % (pageStats.get("numberCssResources", "0"))
    print >> f, "*  Nubmer of Static Resources: %s" % (pageStats.get("numberStaticResources", "0"))
    print >> f, "*  Total Request Bytes: %s" % (pageStats.get("totalRequestBytes", "0"))

    print >> f, "\n### Response data\n"

    print >> f, "*  HTML Response Bytes: %s" % (pageStats.get("htmlResponseBytes", "0"))
    print >> f, "*  Text Response Bytes: %s" % (pageStats.get("textResponseBytes", "0"))
    print >> f, "*  CSS Response Bytes: %s" % (pageStats.get("cssResponseBytes", "0"))
    print >> f, "*  Image Response Bytes: %s" % (pageStats.get("imageResponseBytes", "0"))
    print >> f, "*  JS Response Bytes: %s" % (pageStats.get("javascriptResponseBytes", "0"))
    print >> f, "*  Flash Response Bytes: %s" % (pageStats.get("flashResponseBytes", "0"))
    print >> f, "*  Other Response Bytes: %s" % (pageStats.get("otherResponseBytes", "0"))


