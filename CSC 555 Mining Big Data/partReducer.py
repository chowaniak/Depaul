#!/usr/bin/python
import sys

curr_id = None
curr_cnt = 0
id = None
lo_table_vals = None
cust_table_vals = None


# The input comes from standard input (line by line)
for line in sys.stdin:
    line = line.strip()
    # parse the line and split it by '\t'
    ln = line.split('\t')
    # grab the key (int)
    id = int(ln[0])

    print 'key: ', id, '>>>', ln

   # if curr_id == id:
   #   if ln[-1].endswith('lo_table') #checks what reducers get and puts to appropiate bucket
   #     lo_revenue = ln[1]
   #     lo_table_vals.append(ln[-1])
   #   if ln[-1].endswith('cust_table')
   #     cust_table_vals.append(ln[-1])
   #     c_nation = ln[1]
   #     curr_cnt += 1
   # else: #new key has arrived
   #   if curr_id: # output the count, single key completed
   #     # NOTE: Change this to '%s\t%d' if your key is a string
   #     length_lo_revenue = len(lo_revenue)
   #     length_c_nation = len(c_nation)
   #     if (length_lo_revenue*length_c_nation> 0): #join
   #       print c_nation, '\t', lo_revenue, '\t', 'mapper3'


    #    curr_id = id
    #    curr_cnt = 0












# output the last key
#if curr_id == id:
#    print '%s\t%d' % (curr_id, curr_cnt)

