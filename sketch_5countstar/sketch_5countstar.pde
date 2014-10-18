static class SinTableClass{
  int sinvalues[];
  int size_SinTable = 256;
  
  SinTableClass(){
    sinvalues = new int[256];
    for (int i=0; i<size_SinTable; i++){
      sinvalues[i] = round(128+127.5*sin(2*PI/size_SinTable*i));
    }
  }
}

 
void setup() {
  SinTableClass SinT;
  
  size(256, 256);
  
  background(128);
  //noLoop();

}

int phase = 0;

void draw()  {
  float angle = 0;
  int sides = 5;
  float angle_inc = SinTableClass::size_SinTable/sides;
  int side_current = 0;
  int radius1 = 100;
  int radius2 = 50;
  int centerx = 128, centery = 128;
  
  background(128);
  /*stroke(128);*/
  for (side_current = 0; side_current < sides; side_current++){
    line(centerx+radius1*cos(angle), centerx+radius1*sin(angle), centerx+radius2*cos(angle += angle_inc), centerx+radius2*sin(angle));
    line(centerx+radius2*cos(angle), centerx+radius2*sin(angle), centerx+radius1*cos(angle += angle_inc), centerx+radius1*sin(angle));
  }
  
    
  ++phase;
  if (256 == phase) phase = 0;

  
}



