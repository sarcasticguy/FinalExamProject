//This is coppied off of, "Coding Challenge #12:
//The Lorenz Attractor in Processing" by
//The Coding Train.
import peasy.*;

float x = 0.01;
float y = 0;
//The "z" varable gives it the 3D look.
float z = 0;

float a = 10;
float b = 28;
float c = 8.0/3.0;

ArrayList<PVector> points = new ArrayList<PVector>();
//To download PeasyCam, go to
//Tools>Library>PeasyCam.
PeasyCam cam;

void setup() {
  size(800, 600, P3D);
  colorMode(HSB);
  //The PeasyCam is how to change the point of view
  //of the Lorenz Attractor.
  cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);
  float dt = 0.01;
  float dx = (a * (y - x))*dt;
  float dy = (x * (b - z) - y)*dt;
  float dz = (x * y - c * z)*dt;
  x = x + dx;
  y = y + dy;
  z = z + dz;

//The Lorenz Attractor is many points connected
//by a line.
  points.add(new PVector(x, y, z));

  translate(0, 0, -80);
  scale(5);
  stroke(255);
  noFill();

//This is how the points are connected.
  float hu = 0;
  beginShape();
  for (PVector v : points) {
    stroke(hu, 255, 255);
    vertex(v.x, v.y,v.z);

    hu += 0.1;
    if (hu > 255) {
      hu = 0;
    }
  }
  endShape();
}