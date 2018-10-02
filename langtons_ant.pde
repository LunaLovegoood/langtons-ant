// Constant values
final int quantity = 100;
final int rows = 800;
final int cols = rows;
final int step = 100;

// Population of ants
Ant ants[] = new Ant[quantity];

// Properties of cells
int cellWidth;
int cellHeight;

// Anthill of the population of ants
boolean anthill[][] = new boolean[rows][cols];

void setup() {
  size(800, 800);
  background(255, 255, 255);
  
  frameRate(100000);
  
  cellWidth = (int)(width / cols);
  cellHeight = (int)(height / rows);
  
  initGrid();
  initPopulation();
}

void draw() {
  for(int k = 0; k < step; k++) {
    for (int i = 0; i < quantity; i++) {
      ants[i].move();
    }
  }
}

void initGrid() {
  for (int i = 0; i < rows; i++)
    for (int j = 0; j < cols; j++)
      anthill[i][j] = false;
}

void initPopulation() {
  for (int i = 0; i < quantity; i++) {
    ants[i] = new Ant();
  }
}

void mousePressed() {
  saveFrame("snapshots/snapshot-######.png");
}
