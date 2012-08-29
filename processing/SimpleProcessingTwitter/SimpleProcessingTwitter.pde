//int totalTwits;
//int currentTwits;
//int nuevosTwits;
//String [] tesTwit = new String[nuevosTwits];

import processing.serial.*;

Serial port;

int sval;
boolean tuiteo = false;

TwC twitter;
ArrayList searchResult;

void setup() {
  
  size(100,100);
  background(0);
  port = new Serial(this, "COM5", 9600);
  twitter = new TwC("B9CmcpSUj1jdV1ziQ4x2Q",//OAuthConsumerKey 
                    "YjksaMYKPlDBh3QFHAKD3xkSNGowErW67wQUnPX6gc", //OAuthConsumerKeySecret
                     "788030407-P1mOfnyKuICh4UmEhD6Yc35nuxkyrju52fHHdAuP", //AccessToken
                     "xLbB4iPR47n6gUcoYA8dPut49DGbrBsD7qQzZoJGV4" //AccessTokenSecret
                    );
  twitter.connect();
 //twitter.send("hello world! from #processing");
  
  //busqueda 
  //diferentes maneras:
  searchResult = twitter.search("#testing");
  for (int i=0; i<searchResult.size(); i++) {	
        Tweet t = (Tweet)searchResult.get(i);	
        String user = t.getFromUser();
        String msg = t.getText();
        Date d = t.getCreatedAt();
        long id = t.getId();	
        println(id);
  }
}


void draw() {
  background(0);
  


    
    
  twitter.getTimeline();
  
  
}





