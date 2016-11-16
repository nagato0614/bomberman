//homework_20161114
//nagai toru

//static variable
Main main;

void setup() {
  size(800, 800);
  smooth();
  background(255);
  frameRate(60);
  rectMode(CENTER);
  ellipseMode(CENTER);  
  main = new Main();
}

void draw() {
  main.play();
}