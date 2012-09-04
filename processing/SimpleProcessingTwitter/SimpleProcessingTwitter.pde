

TwC twitter;

long past;
long interval = 30000;

int totalTwits;
int currentTwits;


void setup() {
  
  size(100,100);
  background(0);
  
  twitter = new TwC("B9CmcpSUj1jdV1ziQ4x2Q",//OAuthConsumerKey 
                    "YjksaMYKPlDBh3QFHAKD3xkSNGowErW67wQUnPX6gc", //OAuthConsumerKeySecret
                     "788030407-P1mOfnyKuICh4UmEhD6Yc35nuxkyrju52fHHdAuP", //AccessToken
                     "xLbB4iPR47n6gUcoYA8dPut49DGbrBsD7qQzZoJGV4" //AccessTokenSecret
                    );
  twitter.connect();
  twitter.send("hello world! from #processing");
}


void draw() {
  background(0);
  
  if (millis() - past > interval){
    
   println ("checking");
   twitter.getTimeline();
   past = millis();
    
  }
}





