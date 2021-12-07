#!/usr/bin/python3

def myFunction(arg1, arg2):
      mangle1 = arg1[0] + arg2
      mangle2 = arg1 + arg2[0]
      mangle3 = arg1.title() + arg2.upper()
      mangle4 = arg1.lower()[-1] + arg2[-1][0]
      return mangle1, mangle2, mangle3, mangle4

first, second, *third = myFunction("Luke", "Cage")

print(first)