class Bomb {
  public static final int MAX_BOMB_COUNT = 100;
  private int bombCnt;
  private int x;
  private int y;
  public Bomb(int x, int y) {
    this.x = x;
    this.y = y;
    this.bombCnt = 0;
  }
  
  void update() {
    this.bombCnt++;
  }
}