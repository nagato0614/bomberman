class Map {
  public static final int WIDTH = 17;
  public static final int HEIGHT = 13;
  public static final int HARD_BROCK = -1;  //no broken blcok
  public static final int BLOCK_SIZE = 30;
  public static final int BOMB = 2;
  private int map[][];
  private int hiddenMap[][];
 
  
  public Map() {
    this.map = new int[HEIGHT][WIDTH];
    this.hiddenMap = new int[HEIGHT][WIDTH];
    this.fillHardBlock(this.map);
    this.fillHardBlock(this.hiddenMap);
  }
  
  private void fillHardBlock(int[][] a) {
    for (int i = 0; i < HEIGHT; i++) {
      for (int j = 0; j < WIDTH; j++) {
        if (i == 0 || j == 0 || (HEIGHT - 1) == i || (WIDTH - 1) == j
            || ((i + 1) % 2 == 1 && (j + 1) % 2 == 1))
          a[i][j] = -1;
      }
    }
  }
  
  public int getMap(int x, int y) {
    return this.map[x][y];
  }
  
  public void showMap() {
    for (int i = 0; i < HEIGHT; i++) {
      for (int j = 0; j < WIDTH; j++) {
        System.out.printf("%3d ", this.map[i][j]);
      }
      System.out.println();
    }
  }
  
  public int getMapPointX(int i) {
    return i * Map.BLOCK_SIZE + Map.BLOCK_SIZE / 2;
  }
  
  public int getMapPointY(int j) {
    return j * Map.BLOCK_SIZE + Map.BLOCK_SIZE / 2;
  }
  
  //row, column
  public void setBomb(int i, int j) {
    this.map[i][j] = 2;
  }
  
  public void deleteBomb(int i, int j) {
    if (this.map[i][j] == 2) {
      this.map[i][j] = 0;
    }
  }
}