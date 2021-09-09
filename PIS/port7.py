import serial #Serial imported for Serial communication
import time #Required to use delay functions
import pyautogui

ArduinoSerial = serial.Serial('com3',9600) #Create Serial port object fcalled arduinoSerialData

time.sleep(2) #wait for 2 seconds for the communication to get established


while 1:
    incoming = str(ArduinoSerial.readline()) #read the serial data and print it as line
    

    x=incoming
    x=x.split(',')
    
    x[0]=int(x[0].strip("b'"))
    x[1]=int(x[1])
    x[3]=x[3].strip("\\r\\n' ")

    if 400<x[0]<2000:
        pyautogui.hotkey('left')
    if -2000<x[0]<-400:
        pyautogui.hotkey('right')
    if -2000<x[1]<-300:
        pyautogui.hotkey('up')
    if 400<x[1]<2000:
        pyautogui.hotkey('down')
    """if 'start' in x[2]:
        pyautogui.hotkey('k')"""   
    if 'Knock' in x[3]:
        pyautogui.hotkey('l')
        if 400<x[0]<2000:
            pyautogui.hotkey('left')
        if -2000<x[0]<-400:
            pyautogui.hotkey('right')
        if -2000<x[1]<-300:
            pyautogui.hotkey('up')
        if 400<x[1]<2000:
            pyautogui.hotkey('down')
    incoming = ""; 
        
