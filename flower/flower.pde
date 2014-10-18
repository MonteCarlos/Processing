final int size_SinTable = 256;
int sinvalues[] = new int[2*size_SinTable];

final int size_Palette = 1024;
color palette[] = new color[2*size_Palette];

final float multiplier1 = 4;
final float multiplier2 = 5;

final float radius = 0.5;

int centerx = -1; 
int centery = -1; 
float angle = 0;
int angle_i1 = 0;
int angle_i2 = 0;

float x,y;
float t=0;
final float speed = 0.8;

int paloffset;

void initSinTable(){
  for (int i=0; i < size_SinTable; i++){
    sinvalues[i] = sinvalues[i+size_SinTable] =  round(63.5*sin(4*PI/size_SinTable*i)+191.5*sin(size_SinTable/4 - 2*PI/size_SinTable*i));
  }
}

void initPalette(){
  for (int i=0; i < size_Palette; i++){
    palette[i] = palette[i+size_Palette] = color(128-round(32+31.5*sin(29*PI/size_Palette*i)), round(64+63.5*sin(6*PI/size_Palette*(i/32.0)*(i/32.0)))+64-i/4, i+round(100+99.5*sin(1024/(float)(i+1))));
    //
  }
}

void setup() {
  
  
  size(512, 512);
  
  background(0);
    //noLoop();
  initSinTable();
  initPalette();
  loadPixels();
  centerx = width / 2;
  centery = height / 2;
}



void draw()  {
 
  background(0);
  
  for (y = -height/2+0.5; y < height/2-0.5; ++y){
    for (x = -width/2+0.5; x < width/2-0.5; ++x){
      angle = atan2(y,x);
      angle_i1 = round(2*((angle+PI)*128/PI+t));
      angle_i2 = round(3*(255-t+(angle+PI)*128/PI));
      paloffset = (int)sqrt(x*x+y*y)+sinvalues[angle_i1&255]+sinvalues[angle_i2&255]/2+384;
      //pixels[(int)x+((int)y+height/2)*width+width/2] = palette[(int)(x+width/2)*width/size_Palette];
      pixels[(int)x+((int)y+height/2)*width+width/2] = palette[paloffset];
    }
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



