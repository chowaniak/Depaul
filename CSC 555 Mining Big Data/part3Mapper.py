#!/usr/bin/python

import os
import sys

#read initiual centers from file
fd = open('part3centers.txt', 'r')
centers = []

for line in fd:
  l = line.strip()
  v = line.split(' ')
  centers.extend([v])
fd.close()

#print 'centers list" ', centers
#centers list"  [['1', '2', '93\n'], ['54', '31', '5\n'], ['14', '9', '60\n'], ['39', '30', '6\n'], ['5', '49', '63\n'], ['88', '5', '68\n'], ['4', '61', '95\n']]



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

  print cennum, '\t', v0, '\t', v1, '\t', v2


#delete part3centers.txt so par3Mapper can get new centers
#os.remove("/home/ec2-user/part3centers.txt")
#print("File Removed!")
