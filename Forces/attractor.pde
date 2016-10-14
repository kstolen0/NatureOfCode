
class Attractor{
  
  PVector loc;
  PVector vel;
  
  float g; 
  float mass; 
  
  Attractor(){
    loc = new PVector(width/2,height/2);
    mass = 20;
    g = 1; 
  }
  
  PVector attract(Mover m){
    //  direction  
    PVector force = PVector.sub(loc,m.loc);
    float d = force.mag();
    d = constrain(d,5,25);
    force.normalize();
     
     //  magnitude      
     force.mult((g*mass*m.mass)/(d*d));
      
      return force; 
  }
  
}