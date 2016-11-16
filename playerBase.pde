public class PlayerBase {
  private int x;
  private int y;
  
  public PlayerBase() {
    this.x = 1;
    this.y = 1;
  }
  
  public void moveUp(Map map) {
    if (map.getMap(this.x - 1, this.y) != -1)
      this.x--;
  }
  
  public void moveDown(Map map) {
    if (map.getMap(this.x + 1, this.y) != -1)
      this.x++;
  }
  
  public void moveLeft(Map map) { 
    if (map.getMap(this.x, this.y - 1) != -1)
      this.y--;
  }
  
  public void moveRight(Map map) {
    if (map.getMap(this.x, this.y + 1) != -1)
      this.y++;
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
  
  public void setBomb(Map map) {
    map.setBomb(this.x, this.y);
  }
}