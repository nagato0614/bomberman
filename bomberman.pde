//homework_20161114
//nagai toru

import java.util.ArrayList;

//static variable
final int TURN = 15;
final int ENEMY_NUM = 10;
boolean GAME_END = false;
boolean GAME_CLEAR = true;
Map map;
MyPlayer me;
Enemy enemy;
ArrayList<Bomb> bomb;
ArrayList<Enemy> e;
boolean isKeyPush;
boolean isMoveKey;
int turnCount;

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
  e = new ArrayList<Enemy>();
  isKeyPush = true;
  isMoveKey = true;
  turnCount = 0;
  spownEnemy();
}

void draw() {
  background(255);
  //draw map
  for (int i = 0; i < Map.HEIGHT; i++) {
    for (int j = 0; j < Map.WIDTH; j++) {
      stroke(0);
      fill(255);
      if (map.getMap(i, j) == Map.HARD_BLOCK) {
        fill(100);
      } else if (map.getMap(i, j) == Map.SOFT_BLOCK) {
        fill(#AA862B);
      }
      rect(j * Map.BLOCK_SIZE + (Map.BLOCK_SIZE / 2), i * Map.BLOCK_SIZE + (Map.BLOCK_SIZE / 2)
        , Map.BLOCK_SIZE, Map.BLOCK_SIZE);
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


  drawEnemy();

  update();
  if ((++turnCount % TURN) == 0 && !GAME_END) {
    isKeyPush = true;
    isMoveKey = true;
  }
  if ((turnCount % (TURN + 20) == 0)) {
    enemyMoveAll();
  }

  allHitCheck();
}

void enemyMoveAll() {
  if (e.size() <= 0)
    return;
  for (int i = 0; i < e.size(); i++) {
    Enemy a = e.get(i);
    if (a != null) {
      a.move(map);
    }
  }
}

void drawEnemy() {
  if (e.size() <= 0)
    return;
  for (int i = 0; i < e.size(); i++) {
    Enemy a = e.get(i);
    if (a != null) {
      fill(#C61A1A);
      ellipse(a.getRealX(), a.getRealY(), 20, 20);
    }
  }
}

void spownEnemy() {
  int num = ENEMY_NUM;
  while (num >0) {
    for (int i = 0; i < 3; i ++) {
      for (int j = 3; j < Map.WIDTH; j++) {
        if (map.map[i][j] == Map.EMPTY && random(100) > 90) {
          e.add(new Enemy(map, i, j, (int)random(2) + 1));
          num--;
        }
      }
    }
    for (int i = 3; i < Map.HEIGHT; i++) {
      for (int j = 0; j< Map.WIDTH; j++) {
        if (map.map[i][j] == Map.EMPTY && random(100) > 90) {
          e.add(new Enemy(map, i, j, (int)random(2) + 1));
          num--;
        }
      }
    }
  }
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
    if (cnt >= Bomb.MAX_BOMB_COUNT) {
      if (!b.getIsExplode())
        b.explode(map, me);
      else
        b.drawExplosion();
      if (cnt >= Bomb.MAX_BOMB_COUNT + Bomb.MAX_EXPLOSION_TIME) {
        b.delete(map);
        bomb.remove(i);
      }
    }
  }
}

//for player
void allHitCheck() {
  if (bomb.size() > 0) {
    for (int i = 0; i < bomb.size(); i++) {
      if (hitCheck(me, map, bomb.get(i))) {
        GAME_END = true; 
        println("finish");
      }
      if (e.size() > 0) {
        for (int j = 0; j < e.size(); j++) {
          Enemy a = e.get(j);
          if (a != null) {
            if (hitCheck(a, map, bomb.get(i))) {
              e.remove(j);
            }
          }
        }
      }
    }
  }
}

boolean hitCheck(PlayerBase p, Map m, Bomb b) {
  if (b.getIsExplode()) {
    if (p.getY() == b.getY()) {
      if (p.getX() == b.getX())
        return true;

      int diff = p.getX() - b.getX();
      System.out.printf("%d, %d, %d, %d\n", p.getX(), b.getX(), diff, b.getExpSize(1));
      //check down
      if (diff < 0) {
        if (abs(diff) < b.getExpSize(1))
          return true;
      } else if (diff > 0) {    //check down
        if (abs(diff) < b.getExpSize(0))
          return true;
      }
    }

    if (p.getX() == b.getX()) {
      int diff = p.getY() - b.getY();
      //check light
      if (diff< 0) {
        if (diff < b.getExpSize(3))
          return true;
      } else if (diff> 0) {
        if (diff < b.getExpSize(2))
          return true;
      }
    }
  }
  return false;
}


//------------event handler-----------------

void keyTyped() {
  if (!isKeyPush)
    return;
  isKeyPush = false;
  if (keyPressed) {
    switch (int(key)) {
    case 'z' :
      Bomb b = me.setBomb(map);
      if (b != null)
        bomb.add(b);
      break;
    case 'q' :
      map.showMap();
      break;
    }
  }
}

void keyPressed() {
  if (!isMoveKey) 
    return;
  isMoveKey = false;
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