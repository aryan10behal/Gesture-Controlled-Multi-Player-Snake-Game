#include "Wire.h" // This library allows you to communicate with I2C devices.
//const int trigger1 = 2; //Trigger pin of 1st Sesnor
//const int echo1 = 3; //Echo pin of 1st Sesnor

long time_taken;
int dist,distL,distR;
const int ledPin=13;
const int knockSensor=A0;
const int threshold=400;
int sensorReading=0;
int ledState=LOW;

 
const int MPU_ADDR = 0x68; // I2C address of the MPU-6050. If AD0 pin is set to HIGH, the I2C address will be 0x69.
int16_t gyro_x, gyro_y, gyro_z; // variables for gyro raw data
char tmp_str[7]; // temporary variable used in convert function
char* convert_int16_to_str(int16_t i) { // converts int16 to string. Moreover, resulting strings will have the same length in the debug monitor.
  sprintf(tmp_str, "%6d", i);
  return tmp_str;
}
void setup() {
  Serial.begin(19200);
  /*pinMode(ledPin,OUTPUT);
  pinMode(trigger1, OUTPUT); 
  pinMode(echo1, INPUT);*/ 
  Wire.begin();
  Wire.beginTransmission(MPU_ADDR); // Begins a transmission to the I2C slave (GY-521 board)
  Wire.write(0x6B); // PWR_MGMT_1 register
  Wire.write(0); // set to zero (wakes up the MPU-6050)
  Wire.endTransmission(true);
}

/*void calculate_distance(int trigger, int echo)
{pinMode(trigger1, OUTPUT); 
pinMode(echo1, INPUT); 

digitalWrite(trigger, LOW);
delayMicroseconds(2);
digitalWrite(trigger, HIGH);
delayMicroseconds(10);
digitalWrite(trigger, LOW);

time_taken = pulseIn(echo, HIGH);
dist= time_taken*0.034/2;
if (dist>50)
dist = 50;
}*/

void loop() {

  Wire.beginTransmission(MPU_ADDR);
  Wire.write(0x3B); // starting with register 0x3B (ACCEL_XOUT_H) [MPU-6000 and MPU-6050 Register Map and Descriptions Revision 4.2, p.40]
  Wire.endTransmission(false); // the parameter indicates that the Arduino will send a restart. As a result, the connection is kept active.
  Wire.requestFrom(MPU_ADDR, 3*2, true); // request a total of 3*2=14 registers
 
  gyro_x = Wire.read() <<8| Wire.read(); // reading registers: 0x43 (GYRO_XOUT_H) and 0x44 (GYRO_XOUT_L)
  gyro_y = Wire.read()<<8 | Wire.read(); // reading registers: 0x45 (GYRO_YOUT_H) and 0x46 (GYRO_YOUT_L)
  gyro_z = Wire.read() <<8| Wire.read(); // reading registers: 0x47 (GYRO_ZOUT_H) and 0x48 (GYRO_ZOUT_L)  

  Serial.print(gyro_x/10);
  Serial.print(",");
  Serial.print(gyro_y/10); 

  /*calculate_distance(trigger1,echo1);
  distL =dist;
  if (50>distL>0) 
  {Serial.print(",start");
  Serial.print("");
  }
  else{
    Serial.print(",x");
    Serial.print("");
  }*/
  sensorReading=analogRead(knockSensor);
  if(sensorReading>=threshold)
  {
    ledState=!ledState;
    digitalWrite(ledPin,ledState);
    Serial.println(",Knock");
    delay(90);
   
  }
  else{
    Serial.println(",NO");
    delay(90);
  }

  //calculate_distance(trigger1,echo1);
  //distL =dist;
  // delay
  delay(110);
}
