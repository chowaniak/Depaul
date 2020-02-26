#!/usr/bin/python
import sys
curr_id = None
curr_cnt = 0
id = None
lo_table_vals = None
cust_table_vals = None
custkey=[]
lokey =[]
rev_sub_sum = float(0)

for line in sys.stdin:
    line = line.strip()
    ln = line.split('\t')
    id = int(ln[0])
    if curr_id == id: # key is the same
      if ln[2].startswith('lo_table'): #checks what reducers get and puts to appropiate bucket
       lokey.append(id) # to do inner join
       lo_rev = float(ln[1]) # extract revenue value from 2nd mapper output
       rev_sub_sum = float(rev_sub_sum)
       rev_sub_sum = rev_sub_sum + lo_rev #sum revenues when while key is the same 
      if ln[2].startswith('cust_table'):
       c_nation = ln[1]
       custkey.append(id) # to do inner join
    else: #new key has arrived
      if curr_id: # output the count, single key completed
        lolen = len(lokey) #check the lenght of list
        custlen = len(custkey)
        if (lolen * custlen > 0): #  inner join
          rev_sub_sum = str(int(rev_sub_sum))
          print c_nation, '\t', rev_sub_sum, '\t', 'mapper3'
      curr_id = id # update key
      if ln[2].startswith('lo_table'):
         lokey = []
         lokey.append(ln[1])
         custkey = []
      if ln[2].startswith('cust_table'):
         lokey = []
         custkey = []
         custkey.append(ln[1])
lolenlast = len(lokey)
custlenlast = len(custkey)
if (lolenlast * custlenlast > 0): #  inner join
   rev_sub_sum = str(int(rev_sub_sum))
   print c_nation, '\t', rev_sub_sum, '\t', 'mapper3'
