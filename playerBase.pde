public class PlayerBase {
  private int x;
  private int y;
  private int bombCnt;
  private int maxBomb;
  private int bombLevel;
  
  public PlayerBase(Map map, int x, int y) {
    this.bombCnt = 0;
    this.maxBomb = 3;
    this.bombLevel = 4;
    this.x = x;
    this.y = y;
  }
  
  private void setPlayer(Map map) {
    map.map[this.x][this.y] = Map.PLAYER;
  }
  
  private void removePlayer(Map map) {
    map.map[this.x][this.y] = Map.EMPTY;
  }
  
  protected boolean isMove(Map map, int i, int j) {
    if (map.map[i][j] != Map.EMPTY)
      return false;
    return true;
  } 
  
  public void moveUp(Map map) {
    if (this.isMove(map, this.x - 1, this.y))  {
      this.x--;
    }
  }
  
  public void moveDown(Map map) {
    if (this.isMove(map, this.x + 1, this.y)) {
      this.x++;
    }
  }
  
  public void moveLeft(Map map) { 
    if (this.isMove(map, this.x, this.y - 1)) {
      this.y--;
    }
  }
  
  public void moveRight(Map map) {
    if (this.isMove(map, this.x, this.y + 1)) {
      this.y++;
    }
  }
 
  public int getX() {
    return this.x;
  } 
  
  public int getY() {
    return this.y;
  }
  
  public int getRealX() {
    return this.y * Map.BLOCK_SIZE + Map.BLOCK_SIZE / 2;
  }
  
  public int getRealY() {
    return this.x * Map.BLOCK_SIZE + Map.BLOCK_SIZE / 2;
  }
  
  public Bomb setBomb(Map map) {
    if (this.bombCnt < this.maxBomb) {
      map.setBomb(this.x, this.y);
      this.bombCnt++;
      return new Bomb(this.x, this.y, this, this.bombLevel);
    }
    return null;
  }
  
  public void removedBomb() {
    this.bombCnt--;
  }
}