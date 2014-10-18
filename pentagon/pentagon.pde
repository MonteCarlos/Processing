void setup() {
  size(256, 256);
  stroke(255);
}

void draw()  {
  float angle = PI/128*phase;
  int sides = 5;
  float angle_inc = 2*PI/sides/2;
  int side_current = 0;
  int radius1 = 100;
  int radius2 = 50;
  int centerx = 128, centery = 128;
  static int phase = 0;
  
  for (side_current = 0; side_current < sides; side_current++){
    line(centerx+radius1*cos(angle), centerx+radius1*sin(angle), centerx+radius2*cos(angle += angle_inc), centerx+radius2*sin(angle));
    line(centerx+radius2*cos(angle), centerx+radius2*sin(angle), centerx+radius1*cos(angle += angle_inc), centerx+radius1*sin(angle));
  }
  
  ++phase;
  if (256 == phase) phase = 0;
  
}



