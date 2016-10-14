
class Mover{
  
  PVector loc;
  PVector vel;
  PVector acc;
  float mass; 
  
  Mover(){
    loc = new PVector(width/2,height/2);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    mass = random(1,2);
  }
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  
  void display(){
    stroke(0);
    fill(100);
    ellipse(loc.x,loc.y,mass*10,mass*10);
  }
  
  void edges(){
    if (loc.x > width){
      loc.x = width;
      vel.x*=-1;
    } else if (loc.x < 0){
      loc.x = 0;
      vel.x*=-1;
    }
    
    if(loc.y > height){
      loc.y = height;
      vel.y*=-1;      
    } else if (loc.y < 0){
      loc.y = 0;
      vel.y*=-1;
    }
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acc.add(f);
  }
  
  PVector friction(){
     PVector friction = vel.get();
     friction.normalize();
     friction.mult(-1);
     
     float c = 0.1;
     friction.mult(c);    
     return friction;
  }
  
  PVector drag(){
     PVector drag = vel.get();     
     drag.normalize();
     drag.mult(-1);
     
     float speed = vel.mag();
     float c = 0.01;
     
     drag.mult(c*(speed*speed));
     
     return drag; 
  }
  
  
}

Mover[] movers;

void setup(){
 size(600,500);
 movers = new Mover[5]; 
 for (int i = 0; i < 5; i++){
   movers[i] = new Mover(); 
  }
 //m = new Mover();
}

void draw(){
  background(0);
  //fill(255);
  for(Mover m : movers){ 
    m.update();
    m.edges();
    m.display();   
    
    if(mousePressed){
      PVector f = m.drag();
      m.applyForce(f);
    }
  }
}