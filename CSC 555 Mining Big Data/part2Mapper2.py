#!/usr/bin/python

import sys

for line in sys.stdin:
  line = line.strip()
  vals = line.split('\t')

#if vals[2].startswith('mapper3'): #mapper 3
  c_nation2 = vals[0]
  lo_revenue2 = vals[1]
  print c_nation2, '\t', lo_revenue2
