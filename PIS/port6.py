import serial #Serial imported for Serial communication
import time #Required to use delay functions
import pyautogui

ArduinoSerial2 = serial.Serial('com6',19200)
time.sleep(2) #wait for 2 seconds for the communication to get established

while 1:
    incoming1 = str(ArduinoSerial2.readline()) #read the serial data and print it as line
    y=incoming1
    y=y.split(',')
    
    y[0]=int(y[0].strip("b'"))
    y[1]=int(y[1])
    y[2]=y[2].strip("\\r\\n' ")

    if 400<y[0]<2000:
        pyautogui.hotkey('a')
    if -2000<y[0]<-400:
        pyautogui.hotkey('d')
    if -2000<y[1]<-400:
        pyautogui.hotkey('w')
    if 400<y[1]<2000:
        pyautogui.hotkey('s')
    if 'Knock' in y[2]:
        pyautogui.hotkey('c')
        if 400<y[0]<2000:
            pyautogui.hotkey('a')
        if -2000<y[0]<-400:
            pyautogui.hotkey('d')
        if -2000<y[1]<-400:
            pyautogui.hotkey('w')
        if 400<y[1]<2000:
            pyautogui.hotkey('s')
    incoming = "";  
