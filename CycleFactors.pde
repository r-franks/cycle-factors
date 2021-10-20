//define width, height and background color
int w = 1000;
int h = 800;
int bg = 102;

float ii = 0;
float zoom = 30;
String num = "10";
//set up the screen size
void settings() {
  //use given width and height
  size(w, h);
  //fullScreen();
}

void setup(){
  textSize(32);
  fill(0);
}
void draw() {
  //fill(102, 10);
  //rect(0,0,width,height);
  background(255);
  text(num, 10, 30); 
  if(int(num)>0){
    drawCircle(int(num), width/2, height/2, zoom, ii);
  }else{
    ellipse(width/2, height/2, zoom, zoom);
  }
  ii+=0.01;
}

void keyPressed(){
  if(keyCode == UP){
    zoom*=(1/0.9);
  }else if(keyCode == DOWN){
    zoom*=0.9;
  }else if(keyCode == BACKSPACE && num.length()>0){
    num = num.substring(0, num.length()-1);
  }else if(key == '0' | key == '1' | key == '2' | key == '3' | key == '4' | key == '5' | key == '6' | key == '7' | key == '8' | key == '9'){
    num+=key;
  }
}

void drawCircle(int i, float x, float y, float r, float orientation) {
  stroke(0);
  strokeWeight(2);
  noFill();
  ellipse(x, y, r, r);

  //calculate lowest prime factor
  int lpf = getLPF(i);

  //calculate i/lpf
  int f = i/lpf;

  //calculate lpf of i/lpf
  int flpf = getLPF(f);

  float angle = orientation;
  float rotate = 2*PI/float(lpf);
  /*
  float newr = r*sin(rotate/2)/(1-sin(rotate/2));
  if(lpf==2){
    newr = r;
  }
  */
  float newr = r/sqrt(lpf);
  ellipse(x, y, r+newr, r+newr);

  for (int circle = 1; circle <= lpf; circle++) {
    if (f==flpf) {
      float x1 = x+0.5*(r+newr)*cos(angle);
      float y1 = y+0.5*(r+newr)*sin(angle);
      ellipse(x1, y1, newr, newr);

      float angle2 = -2.3*orientation;
      float rotate2 = 2*PI/float(f);
      /*
      float newr2 = newr*sin(rotate2/2)/(1-sin(rotate2/2));
      if(f==2){
        newr2 = newr;
      }
      */
      float newr2 = newr/sqrt(f);
      ellipse(x1, y1, newr+newr2, newr+newr2);
      if (flpf!=1) {
        for (int circle2 = 1; circle2 <= f; circle2++) {
          float x2 = x1+0.5*(newr+newr2)*cos(angle2);
          float y2 = y1+0.5*(newr+newr2)*sin(angle2);
          ellipse(x2, y2, newr2, newr2);

          angle2 += rotate2;
        }
      }
      angle += rotate;
    } else {
      drawCircle(f, x+0.5*(r+newr)*cos(angle), y+0.5*(r+newr)*sin(angle), newr, -1.5*orientation);
      angle += rotate;
    }
  }
}

//calculate least prime factor
int getLPF(int i) {
  if (i <= 1) {
    return 1;
  } else {
    for (int lpf = 2; lpf <= i; lpf++) {
      if (i%lpf == 0) {
        return lpf;
      }
    }
    return i;
  }
}
