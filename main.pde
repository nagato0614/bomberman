public class Main {
  private Map map;
  private MyPlayer me;
  
  public Main() {
    map = new Map();
    me = new MyPlayer(0, 0);
  }
  
  public void play() {
    //draw map
    for (int i = 0; i < Map.HEIGHT; i++) {
      for (int j = 0; j < Map.WIDTH; j++) {
        stroke(0);
        fill(100);
        if (map.getMap(i, j) == Map.HARD_BROCK) {
          rect(j * Map.BLOCK_SIZE + (Map.BLOCK_SIZE / 2), i * Map.BLOCK_SIZE + (Map.BLOCK_SIZE / 2)
                , Map.BLOCK_SIZE, Map.BLOCK_SIZE);
        }
      }
    }
    
    int init = (int)((double)Map.BLOCK_SIZE * (3.0 / 2.0));
    //ellipse(0, 0, 10, 10);
    ellipse(me.getRealX(), me.getRealY(), 10, 10);
  }
}