public class PlayerBase {
  private int x;    //column
  private int y;    //row
  
  public PlayerBase(int x, int y) {
    if (0 <= x && x < Map.WIDTH) 
      this.x = x;
    if (0 <= y && y < Map.HEIGHT)
      this.x = y;
  }
  
  public void moveUp(Map map) {
    if (map.getMap(this.x + 1, this.y) < Map.HEIGHT && map.getMap(this.x + 1, this.y) != -1)
      this.x++;
  }
  
  public void moveDown(Map map) {
    if (map.getMap(this.x - 1, this.y) >= 0 && map.getMap(this.x, this.y) != -1)
      this.x--;
  }
  
  public void moveLeft(Map map) { 
    if (map.getMap(this.x, this.y - 1) >= 0 && map.getMap(this.x, this.y - 1) != -1)
      this.y--;
  }
  
  public void moveRight(Map map) {
    if (map.getMap(this.x, this.y + 1) >= 0 && map.getMap(this.x, this.y + 1) != -1)
      this.y++;
  }
 
  public int getX() {
    return this.x;
  } 
  
  public int getY() {
    return this.y;
  }
  
  public int getRealX() {
    return this.x * Map.BLOCK_SIZE + (Map.BLOCK_SIZE * 3) / 2;
  }
  
  public int getRealY() {
    return this.y * Map.BLOCK_SIZE + (Map.BLOCK_SIZE * 3) / 2;
  }
}