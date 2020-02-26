#!/usr/bin/python


import sys
import math

#read initiual centers from file
fd = open('centers.txt', 'r')
centers = []

for line in fd:
  l = line.strip()
  v = line.split(' ')
  centers.extend([v])
fd.close()

# read numericfile.txt
for line in sys.stdin:
  line = line.strip()
  vals = line.split(' ')
  v0 = float(vals[0])
  v1 = float(vals[1])
  v2 = float(vals[2])


  cennum = None
  calcdist = None
  i = 0
  for center in centers:
    c0 = float(center[0])
    c1 = float(center[1])
    c2 = float(center[2])
    dist = (v0-c0)**2 + (v1-c1)**2 + (v2-c2)**2 # distance 
    #print str(dist)
    ed = dist**(0.5) # calculate square root, euclidian distance
    #print str(ed) # works ok
    if cennum:
      if ed < calcdist:
        #print 'jeden'
        cennum = i + 1
        #print 'dwa'
        calcdist = ed
    else:
      cennum = i + 1
      #print 'trzy', str(clusterNum) 
      calcdist = ed
    i+= 1
    #print 'cztery: ', str(i)

  print cennum, '\t', vals[0], '\t', vals[1], '\t', vals[2]
