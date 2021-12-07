#!/usr/bin/python3

import os

while True:

    filename = input('Please enter filename: ')

    if os.path.isfile(filename) == True:
        with open(filename, 'r') as fh:
            for line in fh:
                print(line)
        break