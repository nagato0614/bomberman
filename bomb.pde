class Bomb {
  
  public static final int MAX_BOMB_COUNT = 120;
  public static final int MAX_EXPLOSION_TIME = 60;
  private boolean isExplode;
  private int bombCnt;
  private int x;
  private int y;
  private PlayerBase player;
  private int level;
  private int[] explosionSize;
  
  public Bomb(int x, int y,  PlayerBase player, int level) {
    this.x = x;
    this.y = y;
    this.bombCnt = 0;
    this.player = player;
    this.level = level;
    this.explosionSize = new int[4];
    for (int i = 0; i < explosionSize.length; i++) {
      explosionSize[i] = 0;
    this.isExplode = false;
    }
  }
  
  public int getExpSize(int i) {
    return this.explosionSize[i];
  }
  
  public int getX() {
    return this.x;
  }
  
  public int getY() {
    return this.y;
  }
  
  int update() {
    return ++this.bombCnt;
  }
  
  public boolean getIsExplode() {
    return this.isExplode;
  }
  
  void explode(Map map, PlayerBase player) {
    this.isExplode = true;
    
    //down
    for (int i = 0; i < this.level; i++) {
      if (map.getMap(this.x + i, this.y) == Map.HARD_BLOCK || map.getMap(this.x + i, this.y) == Map.SOFT_BLOCK) {
        if (map.getMap(this.x + i, this.y) == Map.SOFT_BLOCK) {
          map.brakeSoftBrock(this.x + i, this.y);
        }
        break;
      }
      this.explosionSize[0]++;
    }
    
    //up
    for (int i = 0; i < this.level; i++) {
      if (map.getMap(this.x - i, this.y) == Map.HARD_BLOCK || map.getMap(this.x - i, this.y) == Map.SOFT_BLOCK) {
        if (map.getMap(this.x - i, this.y) == Map.SOFT_BLOCK) {
          map.brakeSoftBrock(this.x - i, this.y);
        }
        break;
      }
      this.explosionSize[1]++;
    }
    
    //right
    for (int i = 0; i < this.level; i++) {
      if (map.getMap(this.x, this.y + i) == Map.HARD_BLOCK || map.getMap(this.x, this.y + i) == Map.SOFT_BLOCK) {
        if (map.getMap(this.x, this.y + i) == Map.SOFT_BLOCK) {
          map.brakeSoftBrock(this.x, this.y + i);
        }
        break;
      }
      this.explosionSize[2]++;
    }
    
    //left
    for (int i = 0; i < this.level; i++) { 
      if (map.getMap(this.x, this.y - i) == Map.HARD_BLOCK || map.getMap(this.x, this.y - i) == Map.SOFT_BLOCK) {
        if (map.getMap(this.x, this.y - i) == Map.SOFT_BLOCK) {
          map.brakeSoftBrock(this.x, this.y - i);
        }
        break;
      }
      this.explosionSize[3]++;
    }
    
    fill(#FFCE52);
    //down
    int Point = Math.abs(map.getMapPointY(this.x) - map.getMapPointY(this.x + this.explosionSize[0] - 1)) / 2 + map.getMapPointY(this.x);
    ellipse(map.getMapPointX(this.y), Point, 20, Map.BLOCK_SIZE * this.explosionSize[0]);
    
    //up
    Point = map.getMapPointY(this.x) - Math.abs(map.getMapPointY(this.x) - map.getMapPointY(this.x + this.explosionSize[1] - 1)) / 2;
    ellipse(map.getMapPointX(this.y), Point, 20, Map.BLOCK_SIZE * this.explosionSize[1]);
    
    //rightn
    Point = Math.abs(map.getMapPointX(this.y) - map.getMapPointX(this.y + this.explosionSize[2] - 1)) / 2 + map.getMapPointX(this.y);
    ellipse(Point, map.getMapPointY(this.x), Map.BLOCK_SIZE * this.explosionSize[2], 20);
    
    //left
    Point = map.getMapPointX(this.y) - Math.abs(map.getMapPointX(this.y) - map.getMapPointX(this.y + this.explosionSize[3] - 1)) / 2;
    ellipse(Point, map.getMapPointY(this.x), Map.BLOCK_SIZE * this.explosionSize[3], 20);
    
    //System.out.printf("%d, %d\n", map.getMapPointX(this.y), Point);
  }
  
  public void drawExplosion() {
    fill(#FFCE52);
    //down
    int Point = Math.abs(map.getMapPointY(this.x) - map.getMapPointY(this.x + this.explosionSize[0] - 1)) / 2 + map.getMapPointY(this.x);
    ellipse(map.getMapPointX(this.y), Point, 20, Map.BLOCK_SIZE * this.explosionSize[0]);
    
    //up
    Point = map.getMapPointY(this.x) - Math.abs(map.getMapPointY(this.x) - map.getMapPointY(this.x + this.explosionSize[1] - 1)) / 2;
    ellipse(map.getMapPointX(this.y), Point, 20, Map.BLOCK_SIZE * this.explosionSize[1]);
    
    //rightn
    Point = Math.abs(map.getMapPointX(this.y) - map.getMapPointX(this.y + this.explosionSize[2] - 1)) / 2 + map.getMapPointX(this.y);
    ellipse(Point, map.getMapPointY(this.x), Map.BLOCK_SIZE * this.explosionSize[2], 20);
    
    //left
    Point = map.getMapPointX(this.y) - Math.abs(map.getMapPointX(this.y) - map.getMapPointX(this.y + this.explosionSize[3] - 1)) / 2;
    ellipse(Point, map.getMapPointY(this.x), Map.BLOCK_SIZE * this.explosionSize[3], 20);
  }
  
  void delete(Map map) {
    this.player.removedBomb();
    map.deleteBomb(this.x, this.y);
  }
}