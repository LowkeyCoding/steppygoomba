import processing.serial.*;

Serial myPort;

float yspacing = 800/80.00;
String val;
float modY;

void setup() {
  size(600, 800);
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 115200);
  println(yspacing);
}
PImage background=loadImage("https://i.imgur.com/y2fKVWZ.png"), bird=loadImage("https://i.imgur.com/gXph7Ya.png");
PImage wall=loadImage("https://i.imgur.com/l9udhQx.png"), menu=loadImage("https://i.imgur.com/rntxEye.png");
int r, s=0, d=1, x, vy, wx[]={0, 0}, wy[]={0, 0}, e=1800, l=600, hs=0, v=800;
float y = 400;

void draw() {
  
  val = myPort.readStringUntil('\n');
  if (val != null) {
    modY = float(val);
   /* if(modY > 900){
      modY = -2;
    }else{ modY = 2;}
    y = y + yspacing*modY;
    */
    //y = modY-820;
    y = 800 - float(val);
    print(y + "\n");
    //println(py);
  }
  //y = 400;
  vy = 0;
  for (int t=0, q=1; t<=e; t+=e, q=1) {
    for (imageMode(1); q>0; q--, imageMode(3)) {
      image(background, x+t, 0);
    }
  }
  for (int i=0, q=(x=x-6==-1800?0:x-6); i<2; i++, fill(0), textSize(40), image(bird, l/2, y)) {
    for (int j=-1; j<2; j+=2, text(""+s, l/2-15, 700)) {
      image(wall, wx[i], wy[i]+j*(wall.height/2+100));
    }
    if ((wx[i]=wx[i]<0?(wy[i]=(int)random(200, v-200))/wy[i]*l:wx[i]-6)==l/2&&d==0) {
      hs=max(++s, hs);
    }
    d = (abs(width/2-wx[i])<25 && abs(y-wy[i])>100) || y > height || y < 0 ? 1 : d;
  } 
  if (d==(r=1)) {
    for (imageMode(1); r>0; r--, rectMode(3), text("HighScore: "+hs, 50, l))
      image(menu, 0, 0);
  }
} 
void mousePressed() {
  x=s=d=0; 
  wx[1]=900;
  wy[0]=(wy[1]=wx[0]=600)-200;
  
}
