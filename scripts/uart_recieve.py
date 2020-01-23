# -*- coding: utf-8 -*-
import serial
import time

ser = serial.Serial('/dev/serial0', 115200, timeout = 1)

while True:
    msg = ser.readline()
    print(msg)
