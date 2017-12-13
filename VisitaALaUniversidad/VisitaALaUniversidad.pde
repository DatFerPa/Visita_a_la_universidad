import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;

Long inicio;
Long finalizado;

static final String DERECHA = "DERECHA";
static final String IZQUIERDA = "IZQUIERDA";

String texto = "";

boolean tweetAcabado;

Tweter tweter;


void setup() {
  size(640, 520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  tweetAcabado = false;
  tweter = new Tweter();
  tweter.tweet("Aplicacion processing acaba de empezar");
}

void draw() {
  background(255);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();

  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  stroke(2);
  line(width*0.1,0,width*0.1,height);
  line(width*0.9,0,width*0.9,height);
  noStroke();
  textSize(50);
  ellipse(v1.x, v1.y, 20, 20);
  if(v1.x < width*0.1){
    text("izquierda",50,50);
    texto = IZQUIERDA;
    
  }else if(v1.x > width*0.9){
    text("derecha",50,50);
    texto = DERECHA;
  }
  // Let's draw the "lerped" location
  //PVector v2 = tracker.getLerpedPos();
  //fill(100, 250, 50, 200);
  //noStroke();
  //ellipse(v2.x, v2.y, 20, 20);

  // Display some info
  int t = tracker.getThreshold();
  fill(0);
  textSize(32);
  text("deteccion: " + t + "    " +  "frames " + int(frameRate) , 20, 500);
  
  if(!tweetAcabado){
   tweetAcabado = tweter.videoAcabado();
    inicio = System.currentTimeMillis();
  }else{
    finalizado = System.currentTimeMillis();
    if(finalizado - inicio >= 3000 && !texto.equals("")){
      tweetAcabado = false;    
      tweter.tweet(texto);
    }
       
  }
  
  
    
}

// Adjust the threshold with key presses
void keyPressed() {
  int t = tracker.getThreshold();
  if (key == CODED) {  
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}