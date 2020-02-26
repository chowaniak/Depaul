#!/usr/bin/python

import sys

for line in sys.stdin:
  line = line.strip()
  vals = line.split('|')
  c_custkey = vals[0]
  c_nation = vals[4]
  c_region = vals[5]


  if vals[1].startswith('Customer'): #customer table mapper 1
    c_custkey = str(vals[0])
    c_nation = vals[4]
    c_region = vals[5]
    ct = 'cust_table'
    if c_region == 'AMERICA': #c_region = 'AMERICA'
     print c_custkey, '\t', c_nation, '\t', ct
  if len(str(vals[1])) == 1:  # line order table mapper 2
    lo_discount = int(vals[11])
    lo_custkey = vals[2]
    lo_revenue = vals[12]
    lot = 'lo_table'
    if 4<= lo_discount <=6: #lo_discount BETWEEN 4 and 6
      print lo_custkey, '\t', lo_revenue, '\t', lot

