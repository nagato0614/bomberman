//homework_20161114
//nagai toru

import java.util.ArrayList;

//static variable
private Map map;
private MyPlayer me;

void setup() {
  size(520, 400);
  smooth();
  background(255);
  frameRate(60);
  rectMode(CENTER);
  ellipseMode(CENTER);  
  map = new Map();
  me = new MyPlayer();
}

void draw() {
  background(255);
  //draw map
  for (int i = 0; i < Map.HEIGHT; i++) {
    for (int j = 0; j < Map.WIDTH; j++) {
      stroke(0);
      fill(100);
      if (map.getMap(i, j) == Map.HARD_BROCK) {
        rect(j * Map.BLOCK_SIZE + (Map.BLOCK_SIZE / 2), i * Map.BLOCK_SIZE + (Map.BLOCK_SIZE / 2)
          , Map.BLOCK_SIZE, Map.BLOCK_SIZE);
      }
    }
  }
  //player
  fill(255);
  ellipse(me.getRealX(), me.getRealY(), 20, 20);
  
  //draw bomb
  for (int i = 0; i < Map.HEIGHT; i++) {
    for (int j = 0; j < Map.WIDTH; j++) {
      if (map.getMap(j, i) == Map.BOMB) {
        fill(0);
        ellipse(map.getMapPointX(j), map.getMapPointY(i), 15, 15);
      }
    }
  }
}

void keyTyped() {
  if (keyPressed) {
    switch (int(key)) {
      case 'z' :
        me.setBomb(map);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      me.moveUp(map);
    } else if (keyCode == DOWN) {
      me.moveDown(map);
    } else if (keyCode == LEFT) {
      me.moveLeft(map);
    } else if (keyCode == RIGHT) {
      me.moveRight(map);
    }
  }
}