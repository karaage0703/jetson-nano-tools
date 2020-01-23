# -*- coding: utf-8 -*-
import serial
import time

ser = serial.Serial('/dev/ttyTHS1', 115200, timeout=1)

while True:
    ser.write("test".encode())
    time.sleep(1)
