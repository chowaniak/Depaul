#!/usr/bin/python
import sys

r = []

for line in sys.stdin:
  line = line.strip()
  #split = line.split('|')
  split = line.split('\t')
  s0 = str(split[0].strip())
  s1 = str(split[1].strip())
  s2 = str(split[2].strip())
  s3 = str(split[3].strip())
  s4 = str(split[4].strip())
  s5 = str(split[5].strip())
  s6 = str(split[6].strip())
  s7 = str(split[7].strip())
  s8 = str(split[8].strip())
  r = [s1,s0,s2,s3,s4,s5,s6,s7,s8]
  print '~'.join(r)
  #print '\t'.join(r)
