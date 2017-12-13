import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;

class Tweter{
Twitter twitter;

Tweter(){
   ConfigurationBuilder cb = new ConfigurationBuilder();
    cb.setOAuthConsumerKey("fYlLXyJhczJ6EUrgmrxf7cf3i");
    cb.setOAuthConsumerSecret("L5CKEAt0Ew8qAfFQ8py32dNEgG1ICSFO6otmbmcUv8sgXJRFqJ");
    cb.setOAuthAccessToken("933360447432032258-eoRThDIKqNBDzPFARkdAGsqtligj3cK");
    cb.setOAuthAccessTokenSecret("dSrvTEYvbtNxHhSL7RGamC4h6P4KMp05MB8HPUekPzRsi");

    TwitterFactory tf = new TwitterFactory(cb.build());

    twitter = tf.getInstance();
}

String getEstado(){
  String estadoActual="";
 try{
  List<Status> statusList = twitter.getUserTimeline();
  estadoActual = String.valueOf(statusList.get(0).getText());
 }catch(TwitterException ex){
   System.out.println("Error"+ex.getMessage());
 }
 return estadoActual;
  
}

boolean videoAcabado(){
  try{
  Thread.sleep(3000);
  }catch(InterruptedException e){
    System.err.println("Fallo a la hora de hacer un sleep");
  }
  String texto = getEstado();
  return (texto.contains("MENSAJE_ACABADO"))?true:false;
}


void tweet(String texto)
{
    try
    {
        Status status = twitter.updateStatus(texto + System.currentTimeMillis());
        System.out.println("Status updated to [" + status.getText() + "].");
    }
    catch (TwitterException te)
    {
        System.out.println("Error: "+ te.getMessage());
    }
}



}