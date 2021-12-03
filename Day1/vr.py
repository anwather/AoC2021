import sys
import os

l = []
cnt = 0
with open('Day1\\r.txt') as f:
    for line in f.readlines():
        l.append(line.rstrip('\n'))
    f.close()

for x,y in zip(l,l[1:]):
    if int(y) > int(x):
        cnt += 1
    
print(cnt)