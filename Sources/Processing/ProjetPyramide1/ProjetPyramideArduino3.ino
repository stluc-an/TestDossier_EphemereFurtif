
#include <CapacitiveSensor.h>
 
#define  Pin 12                                         // LED port  
CapacitiveSensor   cs_4_2 = CapacitiveSensor(4, 2);
CapacitiveSensor   cs_4_3 = CapacitiveSensor(4, 3);
CapacitiveSensor   cs_4_5 = CapacitiveSensor(4, 5);
CapacitiveSensor   cs_4_6 = CapacitiveSensor(4, 6);



void setup() {
  
   Serial.begin(115200);
  //pinMode(ledPin, OUTPUT);
  //digitalWrite(ledPin, LOW);
  
}

void loop() {
 
 long total1 =  cs_4_2.capacitiveSensor(30);  //sensor numero 1

 long total2 =  cs_4_3.capacitiveSensor(30);  //sensor numero 2

 long total3 =  cs_4_5.capacitiveSensor(30);  //sensor numero 3

 long total4 =  cs_4_6.capacitiveSensor(30);   //sensor numero 4
 



 if (total1 > 500)                            // Donc on touche le sensor numero 1
  {
    Serial.write(1);            // le sons numero 1 ce declenche
  } 
  else
  {
   Serial.write(0);               // Autrement, pas de sons
  }

  

  if (total2 > 500)                            // Donc on touche le sensor numero 2
  {
    Serial.write(1);                           // le sons numero 2 ce declenche
  } 
  else
  {
   Serial.write(0);              
  }
  


  if (total3 > 500)                            // Donc on touche le sensor numero 3
  {
    Serial.write(1);                          // le sons numero 3 ce declenche
  } 
  else
  {
   Serial.write(0);               
  }



  if (total4 > 500)                            // Donc on touche le sensor numero 4
  {
    Serial.write(1);                          // le sons numero 4 ce declenche
  } 
  else
  {
   Serial.write(0);              
  }


 
 
  delay(33);

}



/*

#define PIR_MOTION_SENSOR 2//Use pin 2 to receive the signal from the module
#include <Adafruit_NeoPixel.h>



void setup() {


  pinMode(PIR_MOTION_SENSOR, INPUT);
  Serial.begin(9600);



}

void loop() {

  if (digitalRead(PIR_MOTION_SENSOR)) { //if it detects the moving people

    Serial.write(1);

  } else {

    Serial.write(0);
  }
  delay(33);

}

*/
