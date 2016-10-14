
class mine {
 
  PVector loc;
  PVector vel;
  PVector acc;
 
  mine(float x, float y){
   loc = new PVector(x,y);
   vel = new PVector(0,1);
   acc = new PVector(0.01,0.01);
  }
 
 void move(){
   loc.add( vel );
   vel.add(acc);   
   vel.limit(5);
   
   PVector mouse = new PVector(mouseX,mouseY);
  mouse.sub(loc);
  mouse.setMag(0.5);
  acc = mouse;
   
 }
 
 void warp(){
   if(loc.x > width+10){
     loc.x = -10;
   } else if(loc.x < -10){
     loc.x = width + 10;
   }
   
   if(loc.y > height+10){
      loc.y = -10; 
   } else if(loc.y < -10){
     loc.y = height+10;
   }   
 }
 
 void display(){
   
   
   fill(244);  
   ellipse(loc.x,loc.y,10,10);
 }
  
}

mine temp;

void setup(){
  size(500,500);
  temp = new mine(width/2,height/2);
}

void draw(){
  temp.move();
  temp.warp();
  temp.display();
  
}