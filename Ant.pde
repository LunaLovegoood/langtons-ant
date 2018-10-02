import java.util.Random;

public class Ant {
  private final Random rnd = new Random();
  private int direction;  // 0 - up, 1 - right, 2 - down, 3 - left
  private color antColor;
  private int i, j;
  
  public Ant() {
    this.i = rnd.nextInt(cols);
    this.j = rnd.nextInt(rows);
    
    this.direction = rnd.nextInt(4); // random starting direction
    this.antColor = color(rnd.nextInt(255), rnd.nextInt(255), rnd.nextInt(255));
  }
  
  public Ant(color antColor) {
    this.i = rnd.nextInt(cols);
    this.j = rnd.nextInt(rows);
    
    this.direction = rnd.nextInt(4); // random starting direction
    this.antColor = antColor;
  }
  
  // Performs ant's step
  public void move() {
    if (anthill[i][j]) { // turn left
      fill(255, 255, 255);
      direction--;
    }
    else { // turn right
      fill(antColor);
      direction++;
    }
    
    updateCell();
    
    changePosition();
  }
  
  // Changes ant's position
  private void changePosition() {
    if (direction < 0) {
      direction = 3;
    }
    else if (direction > 3) {
      direction = 0; 
    }
    
    switch (direction) {
    case 0: // moving left
      if (--i < 0) i = cols - 1;
      break;
      
    case 1: // moving up
      if (--j < 0) j = rows - 1;
      break;
      
    case 2: // moving right
      if (++i >= cols) i = 0;
      break;
      
    case 3: // moving down
      if (++j >= rows) j = 0;
    }
  }
  
  // Updates anthill and relative Cell
  private void updateCell() {
    anthill[i][j] = (!anthill[i][j]);
    
    noStroke();
    rect(i * cellWidth, j * cellHeight, cellWidth, cellHeight);
  }
}
