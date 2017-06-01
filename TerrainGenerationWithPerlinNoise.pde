//Copied off 0f, "Coing Challenge #11:
//3D Terrain Generation with Perlin
//Noise in Processing" by The Coding Train
//Ended video at 12:00
int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;

float flying = 0;

float[][] terrain;

void setup(){
  size(600, 600, P3D);
  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows];
}

void draw(){
  //This nested loop gives the impression that you
  //are flying over the grid.
  flying -= 0.1;
  float yoff = flying;
  for(int y = 0; y < rows; y++){
      float xoff = 0;
    for(int x = 0; x < cols; x++){
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);  
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2, height/2+50);
  //The "rotate" function flips the grid on it's side
  //so that it looks like the ground is coming up.
  rotateX(PI/3);
  translate(-w/2, -h/2);
  //This is where the grid of triangles is coded.
  for(int y = 0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++){
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
  
}