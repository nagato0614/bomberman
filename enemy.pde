class Enemy extends  PlayerBase {
  public static final int UP_DOWN = 1;
  public static final int RIGHT_LEFT = 2;
  private int mode;
  private int x;
  private int y;
  private int[][] valueMap;
  public Enemy(Map map, int x, int y, int mode) {
    super(map, x, y);
    valueMap = new int[Map.HEIGHT][Map.WIDTH];
    this.mode = mode;
  }
  
  
}