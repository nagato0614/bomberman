class Map {
  public static final int WIDTH = 17;
  public static final int HEIGHT = 13;
  public static final int BLOCK_SIZE = 30;
  public static final int HARD_BLOCK = -1;  //no broken blcok
  public static final int EMPTY = 0;
  public static final int PLAYER = 1;
  public static final int BOMB = 2;
  public static final int SOFT_BLOCK = 3;
  public static final int MAX_SOFT_BLOCK = 100;
  private int map[][];
  private int hiddenMap[][];


  public Map() {
    this.map = new int[HEIGHT][WIDTH];
    this.hiddenMap = new int[HEIGHT][WIDTH];
    this.fillHardBlock(this.map);
    this.fillHardBlock(this.hiddenMap);
    this.fillSoftBlock(this.map);
  }

  private void fillSoftBlock(int[][] a) {
    int leave = MAX_SOFT_BLOCK;
    int x = 0;
    while (leave >= 0) {
      x++;
      for (int i = 1; i < 3; i++) {
        for (int j = 3; j < WIDTH - 4; j++) {
          if (a[i][j] != -1 && random(100) > 90) {
            a[i][j] = SOFT_BLOCK;
            leave--;
          }
        }
      }
      for (int i = 3; i < HEIGHT - 3; i++) {
        for (int j = 1; j < WIDTH - 1; j++) {
          if (a[i][j] != -1 && random(100) > 90) {
            a[i][j] = SOFT_BLOCK;
            leave--;
          }
        }
      }
      for (int i = HEIGHT - 3; i < HEIGHT - 1; i++) {
        for (int j = 3; j < WIDTH - 4; j++) {
          if (a[i][j] != -1 && random(100) > 90) {
            a[i][j] = SOFT_BLOCK;
            leave--;
          }
        }
      }
    }
    println(x);
  }

  private void fillHardBlock(int[][] a) {
    for (int i = 0; i < HEIGHT; i++) {
      for (int j = 0; j < WIDTH; j++) {
        if (i == 0 || j == 0 || (HEIGHT - 1) == i || (WIDTH - 1) == j
          || ((i + 1) % 2 == 1 && (j + 1) % 2 == 1))
          a[i][j] = -1;
        else
          a[i][j] = 0;
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

  public void brakeSoftBrock(int i, int j) {
    if (0 <= i && i < this.HEIGHT && 0 <= j && j < this.WIDTH)
      this.map[i][j] = 0;
  }
  
  public int[][] copyMap() {
    int[][] buf = new int[HEIGHT][WIDTH];
    for (int i = 0; i < HEIGHT; i++) {
      for (int j = 0; j < WIDTH; j++) {
        buf[i][j] = map[i][j];
      }
    }
    return buf;
  }
}