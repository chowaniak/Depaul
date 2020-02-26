#!/usr/bin/python
import sys

curr_id = None
id = None
curr_sum = 0


# The input comes from standard input (line by line)
for line in sys.stdin:
    line = line.strip()
    # parse the line and split it by '\t'
    ln = line.split('\t')
    # grab the key (int)
    id = ln[0] # extract nation from print line
    revenue = int(ln[1]) # extract revenue from print line 
    if curr_id == id: # key is the same 
       curr_sum += revenue
    else: #new key has arrived
      if curr_id: # output the count, single key completed
        print curr_id, '\t', curr_sum
      curr_id = id # update key
      curr_sum = 0

if curr_id == id:
  curr_sum += revenue
  print curr_id, '\t', curr_sum
