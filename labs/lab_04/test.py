#!/usr/bin/python3

from ctypes import *

class Vehicle:
    def __init__(self, model, make, max_speed_km, spare, owner):
        self.model = model
        self.make = make
        self.max_speed_km = max_speed_km
        self.spare = spare
        self.owner = owner

model = (c_char*30)("Toyota")
make = (c_char*30)("Supra")
max_speed_km = (c_int)(263)
spare = (c_int)(0)
owner = (c_char*30)("Rhean")

myCar = Vehicle(model, make, max_speed_km, spare, owner)