

TwC twitter;

import processing.serial.*;

Serial port;

long past;
long interval = 30000;

int totalTwits;
int currentTwits;
String palabraClave = "sopa";
boolean tuitClave = false;

int pwmOut;


void setup() {

  size(100, 100);
  background(0);

  port = new Serial(this, "COM5", 9600);

  twitter = new TwC("B9CmcpSUj1jdV1ziQ4x2Q", //OAuthConsumerKey 
  "YjksaMYKPlDBh3QFHAKD3xkSNGowErW67wQUnPX6gc", //OAuthConsumerKeySecret
  "788030407-P1mOfnyKuICh4UmEhD6Yc35nuxkyrju52fHHdAuP", //AccessToken
  "xLbB4iPR47n6gUcoYA8dPut49DGbrBsD7qQzZoJGV4" //AccessTokenSecret
  );
  twitter.connect();
  twitter.send("hello world! from #processing");
}


void draw() {
  background(0);

  if (tuitClave == false) {
    if (millis() - past > interval) {

      println ("checking");
      twitter.getTimeline();
      past = millis();
    }
  }

  if (tuitClave == true) {
    println ("palabra clave encontrada, enviando mensaje...");
    port.write("A"); 
    delay (100);
    int conf = port.read();
    println (conf);
    if (conf == 100 ) {
      port.write(pwmOut);
      delay (100);
      //int conf2 = port.read();
      //println (conf2);
      //if (conf2 == 200){
       tuitClave = false; 
      //}else if (conf2 != 200){
        //port.write ("B");
      //}
    }else if (conf != 100){
     port.write ("B");
    }
    
  }
}




