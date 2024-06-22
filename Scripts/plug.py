import sys
from PyP100 import PyP100

p100 = PyP100.P100("192.168.1.3", "sami.m.pellinen@gmail.com", "myyttappiN1") #Creates a P100 plug object
p100.handshake() #Creates the cookies required for further methods
p100.login() #Sends credentials to the plug and creates AES Key and IV for further methods
action = sys.argv[1].lower() if len(sys.argv) == 2 else ''

if action == "on":
    p100.turnOn()
elif action == 'off':
    p100.turnOff()
else:
    p100.toggleState()
