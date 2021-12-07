#!/usr/bin/python3

from random import randint

set1 = set()
for count in range(2, 12):
      set1.add(randint(1, count))
      print(count)