//homework_20161114
//nagai toru

import java.util.ArrayList;

//static variable
boolean GAME_END = false;
Map map;
MyPlayer me;
ArrayList<Bomb> bomb;


void setup() {
  size(520, 400);
  smooth();
  background(255);
  frameRate(60);
  rectMode(CENTER);
  ellipseMode(CENTER);  
  map = new Map();
  me = new MyPlayer(map);
  bomb = new ArrayList<Bomb>();
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

  
  //draw bomb
  for (int i = 0; i < Map.HEIGHT; i++) {
    for (int j = 0; j < Map.WIDTH; j++) {
      if (map.getMap(i, j) == Map.BOMB) {
        fill(0);
        ellipse(map.getMapPointX(j), map.getMapPointY(i), 15, 15);
      }
    }
  }
  
  //player
  fill(255);
  ellipse(me.getRealX(), me.getRealY(), 20, 20);
  
  update();
}


//not yet finish
void explode() {
  for (int i = 0; i < bomb.size(); i++) {
    Bomb b;
    if ((b = bomb.get(i)) != null) {
      
    }
  }
}

void update() {
  for (int i = 0; i < bomb.size(); i++) {
    int cnt = 0;
    Bomb b;
    if ((b = bomb.get(i)) != null) {
      cnt = b.update();
    }
    if (cnt >= Bomb.MAX_BOMB_COUNT){
      b.explode(map, me);
      b.delete(map);
      bomb.remove(i);
    }
  }
}

void keyTyped() {
  if (keyPressed) {
    switch (int(key)) {
      case 'z' :
        Bomb b = me.setBomb(map);
        if (b != null)
          bomb.add(b);
        break;
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