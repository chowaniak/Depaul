

#!/usr/bin/python
import sys



currentKey = None
totalCount = 0
uniq=[]
ct = 0


#input from STDIN

for line in sys.stdin:
  split = line.strip().split('\t') #key,value list
  key = int(split[0])
  value = '\t'.join(split[1:])
  uniq.append(key)

ct = len(set(uniq))

#print ct, '\t', 'Count number of distinct odd integers'
print '%s\t' % (ct)

