#! /usr/bin/python

import json
import os
import urllib2 
import urllib
import sys
import fileinput
import pprint
from cgi import escape

pagespeed_url = "https://developers.google.com/speed/pagespeed/insights/?url="

sites = []

linecount = 0
for line in fileinput.input():
  try:  
    obj = json.loads(line)

    linecount = linecount + 1
 
    sites.append({
      "id": obj["id"],
      "title": obj["title"],
      "score": obj["score"],
      "pageStats": obj["pageStats"],
      "image_mime": obj["screenshot"]["mime_type"],
      "image_url": obj["screenshot"]["data"].replace("_", "/").replace("-", "+"),
      "formattedResults": obj["formattedResults"]
    }) 
  except:
    print "Error parsing line: %s" % linecount

sorted_sites = sorted(sites, key=lambda k: k['score'])

sorted_sites.reverse()

print "|Site|Score|"
print "|----|-----|"

for site in sorted_sites:
  id = site["id"]
  title = site["title"]
  score = site["score"]
  url = id[:150] if len(id) > 150 else id

  sys.stdout.write("[")
  sys.stdout.write(title.encode('utf-8').replace("|","&#124;"))
  sys.stdout.write("]({{site.baseurl}}results/page/%s.html)|[%s](%s%s)|\n" % (urllib.quote_plus(url.replace("/","-").replace(":","-")), score, pagespeed_url, id))

for site in sorted_sites:

  id = site["id"]
  url = id[:150] if len(id) > 150 else id
  title = site["title"]
  score = site["score"]
  formatted_results = site["formattedResults"] if "formattedResults" in site else {}
  rule_results = formatted_results["ruleResults"] if "ruleResults" in formatted_results else {ruleImpact: 0}
  pageStats = site["pageStats"]
  image_mime = site["image_mime"]
  image_url = site["image_url"]

  speed_rules = [u"AvoidLandingPageRedirects", u"MinimizeRenderBlockingResources", u"InlineRenderBlockingCss", u"PreferAsyncResources", u"PrioritizeVisibleContent", u"EnableGzipCompression", u"ServerResponseTime"]
  ux_rules = [u"AvoidPlugins", u"ConfigureViewport", u"SizeContentToViewport", u"SizeTapTargetsAppropriately", u"UseLegibleFontSizes"]


  print "\n"

  sys.stdout.write("## [")
  sys.stdout.write(title.encode('utf-8'))
  sys.stdout.write("](%s)\n\n" % (url))

  print "**Score**: [%s](%s%s)\n\n" % (score, pagespeed_url, id)
  print "<img src='data:%s;base64,%s'>" % (image_mime, image_url)

  print "\n### Request information\n"
  
  print "*  Number of Resources: %s" % (pageStats.get("numberResources", "0"))
  print "*  Number of Hosts: %s" % (pageStats.get("numberHosts", "0"))
  print "*  Number of JS Resources: %s" % (pageStats.get("numberJsResources", "0"))
  print "*  Number of CSS Resources: %s" % (pageStats.get("numberCssResources", "0"))
  print "*  Nubmer of Static Resources: %s" % (pageStats.get("numberStaticResources", "0"))
  print "*  Total Request Bytes: %s" % (pageStats.get("totalRequestBytes", "0"))

  print "\n### Response data\n"

  print "*  HTML Response Bytes: %s" % (pageStats.get("htmlResponseBytes", "0"))
  print "*  Text Response Bytes: %s" % (pageStats.get("textResponseBytes", "0"))
  print "*  CSS Response Bytes: %s" % (pageStats.get("cssResponseBytes", "0"))
  print "*  Image Response Bytes: %s" % (pageStats.get("imageResponseBytes", "0"))
  print "*  JS Response Bytes: %s" % (pageStats.get("javascriptResponseBytes", "0"))
  print "*  Flash Response Bytes: %s" % (pageStats.get("flashResponseBytes", "0"))
  print "*  Other Response Bytes: %s" % (pageStats.get("otherResponseBytes", "0"))

  print "\n### Performance issues\n"
  for rule in speed_rules:
    if rule in rule_results and rule_results[rule]["ruleImpact"] > 0:
      print "*  %s" % (rule_results[rule]["localizedRuleName"])

  print "\n### Mobile UX issues\n"
  for rule in ux_rules:
    if rule in rule_results and rule_results[rule]["ruleImpact"] > 0:
      print "*  %s" % (rule_results[rule]["localizedRuleName"])

  print "<hr>"
  
  sys.stdout.flush()