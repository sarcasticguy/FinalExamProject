//This was coppied off of "Coding Challenge #1: Starfield in Processing"
//by The Coding Train.
Star[] stars = new Star[800];

float speed;

//This setup function creates a new star.
void setup(){
 size(800, 800); 
 for (int i = 0; i<stars.length; i++){
   stars[i] = new Star();
 }
}

//This draw function creates the background,
//how to change the speed of the stars by 
//the "X" point of the mouse and updates
//the stars.
void draw(){
  speed = map(mouseX, 0, width, 0, 50);
  background(0);
  translate(width/2, height/2);
   for (int i = 0; i<stars.length; i++){
   stars[i].update();
   stars[i].show();
 }
}