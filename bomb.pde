class Bomb {
  
  public static final int MAX_BOMB_COUNT = 100;
  private int bombCnt;
  private int x;
  private int y;
  private PlayerBase player;
  private int level;
  
  public Bomb(int x, int y, PlayerBase player, int level) {
    this.x = x;
    this.y = y;
    this.bombCnt = 0;
    this.player = player;
    this.level = level;
  }
  
  int update() {
    return ++this.bombCnt;
  }
  
  void explode(Map map, PlayerBase player) {
    int[] explosionSize = new int[4];
    for (int i = 0; i < explosionSize.length; i++) {
      explosionSize[i] = 0;
    }
    
    //up
    for (int i = 0; i < this.level; i++) {
      if (map.getMap(this.x + i, this.y) == Map.HARD_BROCK || map.getMap(this.x + i, this.y) == Map.SOFT_BROCK) {
        if (map.getMap(this.x + i, this.y) == Map.SOFT_BROCK)
          map.brakeSoftBrock(this.x + i, this.y);
        break;
      }
      explosionSize[0]++;
    }
    
    //down
    for (int i = 0; i < this.level; i++) {
      if (map.getMap(this.x - i, this.y) == Map.HARD_BROCK || map.getMap(this.x - i, this.y) == Map.SOFT_BROCK) {
        if (map.getMap(this.x - i, this.y) == Map.SOFT_BROCK)
          map.brakeSoftBrock(this.x - i, this.y);
        break;
      }
      explosionSize[1]++;
    }
    
    //left
    for (int i = 0; i < this.level; i++) {
      if (map.getMap(this.x, this.y + i) == Map.HARD_BROCK || map.getMap(this.x, this.y + i) == Map.SOFT_BROCK) {
        if (map.getMap(this.x, this.y - 1) == Map.SOFT_BROCK)
          map.brakeSoftBrock(this.x, this.y + i);
        break;
      }
      explosionSize[2]++;
    }
    
    //right
    for (int i = 0; i < this.level; i++) { 
      if (map.getMap(this.x, this.y - i) == Map.HARD_BROCK || map.getMap(this.x, this.y - i) == Map.SOFT_BROCK) {
        if (map.getMap(this.x, this.y + 1) == Map.SOFT_BROCK)
          map.brakeSoftBrock(this.x, this.y - i);
        break;
      }
      explosionSize[3]++;
    }
    
    for (int i = 0; i < 4; i++)
      System.out.printf("%d ", explosionSize[i]);
    println();
    
    
  }
  
  void delete(Map map) {
    this.player.removedBomb();
    map.deleteBomb(this.x, this.y);
  }
}