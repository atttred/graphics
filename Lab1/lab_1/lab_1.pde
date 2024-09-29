int gridSize = 4; // 4x4 великі квадрати
float angle = 0;  // кут обертання
boolean susid = false;

void setup() {
  size(400, 400);
  noFill();
  frameRate(60);
}

void draw() {
  background(255);
  int squareSize = width / gridSize;
  translate(squareSize / 2, squareSize / 2); // Початкова точка для першого квадрата
  
  for (int i = 0; i < gridSize; i++) {
    for (int j = 0; j < gridSize; j++) {
      pushMatrix();
      translate(i * squareSize, j * squareSize); 
      
      stroke(0); 
      rectMode(CENTER);
      rect(0, 0, squareSize, squareSize); // Великий квадрат
      
      float rotationAngle = ((i + j) % 2 == 0 ? angle : -angle);
      
      drawRotatingSquare(squareSize, rotationAngle);  
      
      popMatrix();
    }
  }
  
  angle += 0.005;
}

void drawRotatingSquare(int size, float rotationAngle) {
  float maxInnerSize = size; // * 0.95; 
  float minInnerSize = size / sqrt(2); 
  
  float currentSize = map(abs(sin(2 * rotationAngle)), 0, 1, maxInnerSize, minInnerSize);
  
  pushMatrix();
  rotate(rotationAngle);
  
  stroke(0);
  rectMode(CENTER);
  rect(0, 0, currentSize, currentSize); 
  
  popMatrix();
}
