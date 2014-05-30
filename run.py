#! /usr/bin/python

import json
import os
import urllib2 
import urllib
import sys
import fileinput
import Queue
import threading

url = "https://www.googleapis.com/pagespeedonline/v1/runPagespeed?key=AIzaSyBfFgrmdXPeTDseNiODoMkrdvCWSsVuGr0&strategy=mobile&screenshot=true&rule=AvoidLandingPageRedirects&rule=ServerResponseTime&rule=MinimizeRenderBlockingResources&rule=PrioritizeVisibleContent&rule=EnableGzipCompression&rule=InlineRenderBlockingCss&rule=PreferAsyncResources&rule=uselegiblefontsizes&rule=sizetaptargetsappropriately&rule=avoidplugins&rule=configureviewport&url="

request_queue = Queue.Queue()
max_threads = 10

class UrlFetchThread(threading.Thread):
  def __init__(self, queue):
    threading.Thread.__init__(self)
    self.queue = queue

  def run(self):
    while True:
      #grabs host from queue
      host = self.queue.get()

      #grabs urls of hosts and then grabs chunk of webpage
      try:
        res = urllib2.urlopen(url + urllib.quote(host.rstrip()))
        result = json.loads(res.read())
        result["original_url"] = host.rstrip()
        print json.dumps(result)
      except:
        #signals to queue job is done even if it errors
        sys.stderr.write("ERROR: %s" % (host) )
      finally:
        self.queue.task_done()


def main():

  # Create some threads and add our queue
  for i in range(max_threads):
    t = UrlFetchThread(request_queue)
    t.setDaemon(True)
    t.start()

  #populate queue with data
  for host in fileinput.input():
    request_queue.put(host)

  #wait on the requests to complete until everything has been processed
  request_queue.join()

main()
