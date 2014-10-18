int sinvalues[] = new int[2*256];
int size_SinTable = sinvalues.length/2;
 

final float multiplier1 = 4;
final float multiplier2 = 5;

final float radius = 0.5;
final int noDots = 4096;

float phase;
int centerx = -1; 
int centery = -1; 
float angle = 0;
final float angle_inc = size_SinTable/(float)noDots;

int x,y;
float t=0;
final float speed = 0.3;

color col;

void initSinTable(){
  for (int i=0; i < size_SinTable; i++){
    sinvalues[i] = sinvalues[i+size_SinTable] =  round(255*sin(2*PI/size_SinTable*i));
  }
}
 
void setup() {
  
  
  size(512, 512);
  
  background(0);
    //noLoop();
  initSinTable();
  loadPixels();
  centerx = width / 2;
  centery = height / 2;
  
  col = get(0,0);
}



void draw()  {
 
  background(0);
  
  for (angle = 0; angle < 256; angle+=angle_inc){
    phase = (2*sinvalues[round(multiplier1*(angle+t+size_SinTable/4))&255]+3*sinvalues[round(multiplier2*(angle+2*t))&255])/256.0/5.0;
    x = centerx+round(phase*sinvalues[round(angle)+size_SinTable/4]); //cos(angle)*sin(angle*multiplier)
    y = centery+round(phase*sinvalues[round(angle)]);//sin(angle)*sin(angle*multiplier)
    pixels[x+y*width] = color(col,col,col);
    
    phase = (2*sinvalues[round(multiplier1*(angle+t+speed+size_SinTable/4))&255]+3*sinvalues[round(multiplier2*(angle+2*(t+speed)))&255])/256.0/5.0;
    x = centerx+round(phase*sinvalues[round(angle)+size_SinTable/4]); //cos(angle)*sin(angle*multiplier)
    y = centery+round(phase*sinvalues[round(angle)]);//sin(angle)*sin(angle*multiplier)
    pixels[x+y*width] = color((phase*256+angle)/2, (phase*256+angle)/2, 220);

  }
  
  t += speed;
  if (t>=256) t-=256;
  
  /*for (angle = 0; angle < 256; angle+=angle_inc){
    phase = (2*sinvalues[round(multiplier1*(angle+t+size_SinTable/4))&255]+3*sinvalues[round(multiplier2*(angle+2*t))&255])/256.0/5.0;
    x = centerx+round(phase*sinvalues[round(angle)+size_SinTable/4]); //cos(angle)*sin(angle*multiplier)
    y = centery+round(phase*sinvalues[round(angle)]);//sin(angle)*sin(angle*multiplier)
    pixels[x+y*width] = color((phase*256+angle)/2, (phase*256+angle)/2, 128);
    

  }*/
  updatePixels();
}



