
float a = 0.0;
float aVel = 0.0;
float aAcc = 0.01;

void setup(){
  size(600,600);
}

void draw(){
  background(255);
  aAcc = map(mouseX,0,width,-0.001,0.001);
  
  a+= aVel;
  aVel += aAcc;
  
  rectMode(CENTER);
  stroke(0);
  fill(127);
  translate(width/2,height/2);
  rotate(a);
  rect(0,0,64,32);
}