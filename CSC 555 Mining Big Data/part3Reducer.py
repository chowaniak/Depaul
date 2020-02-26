#!/usr/bin/python
import sys
import os

curr_id = None
curr_cnt = 0
id = None
dim1 = []
dim2 = []
dim3 = []

#delete part3centers.txt so par3Mapper can get new centers
#os.remove("/home/ec2-user/part3centers.txt")
#print("File Removed!")

# The input comes from standard input (line by line)
for line in sys.stdin:
    line = line.strip()
    #print 'line:   ', line
    # parse the line and split it by '\t'
    ln = line.split('\t')
    #print 'ln: ', ln
    # grab the key (int)
    id = int(ln[0].strip())
    ln1= float(ln[1].strip())
    ln2= float(ln[2].strip())
    ln3= float(ln[3].strip())
    #print 'id: ', id
    #print 'ln1: ', ln1
    #print 'ln2: ', ln2
    #print 'ln3: ', ln3
    #print 'curr_id: ', curr_id

    if curr_id == id:
        curr_cnt += 1
        dim1.append(ln1) # list of values in  vector first  dimmension
        #print 'dim1: ', dim1
        #print 'length of dim1:' , len(dim1)
        dim2.append(ln2) # second dimmension
        dim3.append(ln3) # third dimmension


    else:
        if curr_id: # output the count, single key completed
            # NOTE: Change this to '%s\t%d' if your key is a string
            #print 'len: ', dim1
            avrdim1 = str(sum(dim1)/len(dim1))
            avrdim2 = str(sum(dim2)/len(dim2))
            avrdim3 = str(sum(dim3)/len(dim3))
            out = avrdim1 + " " + avrdim2 + " " + avrdim3
            print out
            #print '%d\t%d' % (curr_id, curr_cnt)
            file = open("/home/ec2-user/part3centers.txt", "a")
            file.write(out + '\n')
            file.close()

        curr_id = id
        #print 'curr_id after update: ', curr_id
        #dim1.append(float(ln[1])) # list of values in  vector first  dimmension
        #dim2.append(float(ln[2])) # second dimmension
        #dim3.append(float(ln[3])) # third dimmension

        #curr_cnt = 0

# output the last key
if curr_id == id:
  avrdim1 = str(sum(dim1)/len(dim1))
  avrdim2 = str(sum(dim2)/len(dim2))
  avrdim3 = str(sum(dim3)/len(dim3))
  out = avrdim1 + " " + avrdim2 + " " + avrdim3
  print out
  file = open("/home/ec2-user/part3centers.txt", "a")
  file.write(out + '\n')
  file.close()
