PVector center;  // Declare a PVector for the center
float circleRadius = 20;  // Radius of the circle
int num_of_circles = 20; // number of circles
PVector[] circles_coords;
PVector[] trailXY;
int curTrailLength = 0;

void setup() {
  size(1200, 800);

  circles_coords = new PVector[num_of_circles]; // Initialize the global array
  trailXY = new PVector[100000000];

  int[] current_num = new int[num_of_circles];

  for (int i = 0; i < num_of_circles; i++) {
    circles_coords[i] = new PVector(); // Initialize each PVector
    circles_coords[i].x = width/2;
    circles_coords[i].y = height/2;

    current_num[i] = i + 1;
  }

  for (int i = 0; i < 1000; i++) {
    trailXY[i] = new PVector();
    trailXY[i].x = width / 2;
    trailXY[i].y = height / 2;
  }

  for (int i = 0; i < num_of_circles; i++) {
    ellipse(circles_coords[i].x, circles_coords[i].y, circleRadius * 2, circleRadius * 2);
  }
}

  
 
void draw() {
  background(0, 0, 255);
  fill(0, 255, 0);
  noStroke();

  // Update the position of circles_coords[1] to follow the mouse
  circles_coords[1].x = mouseX;
  circles_coords[1].y = mouseY;

  // Shift the values in the trailXY array to make room for the new position
  for (int i = 100000; i > 0; i--) {
    trailXY[i] = trailXY[i - 1];
  }

  // Add the current position of circles_coords[1] to the beginning of the trailXY array
  trailXY[0] = new PVector(circles_coords[1].x, circles_coords[1].y);

  // Update curTrailLength based on the number of valid points in trailXY
  if (curTrailLength < 1000) {
    curTrailLength += 1;
  }

  fill(255, 0, 0);
  for (int i = 0; i < curTrailLength; i++) {
    circle(trailXY[i].x, trailXY[i].y, 10);
  }

  ellipse(circles_coords[1].x, circles_coords[1].y, circleRadius * 2, circleRadius * 2);
}
