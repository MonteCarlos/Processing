int sinvalues[] = new int[3*256];
int size_SinTable = sinvalues.length/3;
 

final int sides = 5;
final float angle_inc = size_SinTable/sides/2.0;
final float angle2_inc = size_SinTable/sides/4.0;
int side_current = 0;
final int radius1 = 100;
final int radius2 = 50;
final int amp = (radius1+radius2)/4;

int phase = 0;
int centerx = -1; 
int centery = -1; 
float angle = 0;
int angle2 = 0;
int rad1, rad2;

void initSinTable(){
  for (int i=0; i < size_SinTable; i++){
    sinvalues[i] = sinvalues[i+size_SinTable] = sinvalues[i+2*size_SinTable] = round(255.5*sin(2*PI/size_SinTable*i));
  }
}
 
void setup() {
  
  
  size(512, 512);
  
  background(128);
    //noLoop();
  initSinTable();
  loadPixels();
  centerx = width / 2;
  centery = height / 2;
  
  
}



void draw()  {
  angle = phase;
  angle2 = phase;
  
  background(128);
 
  for (side_current = 0; side_current < sides; side_current++){
    rad1 = radius1+amp*sinvalues[angle2&255]/256;
    rad2 = radius2+amp*sinvalues[(angle2 += angle2_inc)&255]/256;
    line(centerx+rad1*sinvalues[round(angle+size_SinTable/4)]/256, 
      centery+rad1*sinvalues[round(angle)]/256, 
      centerx+rad2*sinvalues[round((angle += angle_inc)+size_SinTable/4)]/256, 
      centery+rad2*sinvalues[round(angle)]/256
    );
    
    rad1 = rad2;
    rad2 = radius1+amp*sinvalues[(angle2 += angle2_inc)&255]/256;
    
    line(centerx+rad1*sinvalues[round(angle+size_SinTable/4)]/256, 
      centery+rad1*sinvalues[round(angle)]/256, 
      centerx+rad2*sinvalues[round((angle += angle_inc)+size_SinTable/4)]/256, 
      centery+rad2*sinvalues[round(angle)]/256
    );
    
    println(frameRate);

  }
  
    
  ++phase;
  if (256 == phase) phase = 0;

  
}



