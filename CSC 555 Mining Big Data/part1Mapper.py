#!/usr/bin/python
import sys

reorder = []

for line in sys.stdin:
  line = line.strip()
  #split = line.split('|')
  split = line.split('|')
  reorder =  split[1],split[0],split[2],split[3],split[4],split[5],split[6],split[7],split[8]
  # print '\t'.join(reorder)
  print '~'.join(reorder)


