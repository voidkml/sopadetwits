#include <Servo.h>
 
Servo servo1;  // Crea un Objeto servo
int posicion;    // Variable de la posicion del servo
int valor;
char val;


void setup()
{
  servo1.attach(3);  // Selecionamos el pin 3 como el pin de control para els ervo
  Serial.begin(9600);
}
 
void loop() {

  if(Serial.available()>0) {
    
    val = Serial.read();

    if ( val == 'A') {
      
      //posicion =179;  
  
      for (int i = 0; i<179; i++) {
        servo1.write (i);
        //servo1.write (179);
        //servo1.write (1);
        delay (10);
      }
      servo1.write (0);
      delay (2000);
      Serial.write(100);
      Serial.flush();
      
    }
  Serial.flush();
  
                            // Y le damos un tiempo para que sea capaz de moverse
}
}
