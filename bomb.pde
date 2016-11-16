class Bomb {
  public static final int MAX_BOMB_COUNT = 100;
  private int bombCnt;
  private int x;
  private int y;
  private PlayerBase player;
  public Bomb(int x, int y, PlayerBase player) {
    this.x = x;
    this.y = y;
    this.bombCnt = 0;
    this.player = player;
  }
  
  int update() {
    return ++this.bombCnt;
  }
  
  void delete(Map map) {
    this.player.removedBomb();
    map.deleteBomb(this.x, this.y);
  }
}