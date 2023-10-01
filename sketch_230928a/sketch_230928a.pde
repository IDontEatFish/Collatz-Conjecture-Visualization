PVector center;  // Declare a PVector for the center
float circleRadius = 20;  // Radius of the circle
int num_of_circles = 20; // number of circles
PVector[] circles_coords;
int curTrailLength = 0;
ArrayList<PVector> trailXY = new ArrayList<PVector>();
PVector[] prev_values; 

float rotationAngle = 1.0; // Angle in degrees to rotate the direction

s {
  size(1200, 800);

  circles_coords = new PVector[num_of_circles];
  prev_values = new PVector[num_of_circles]; // Initialize prev_values array

  int[] current_num = new int[num_of_circles];

  for (int i = 0; i < num_of_circles; i++) {
    circles_coords[i] = new PVector();
    circles_coords[i].x = width/2;
    circles_coords[i].y = height/2;

    current_num[i] = i + 1;

    prev_values[i] = new PVector(); // Initialize each element of prev_values
  }

  prev_values[1].x = width/2;
  prev_values[1].y = height/2;

  for (int i = 0; i < num_of_circles; i++) {
    ellipse(circles_coords[i].x, circles_coords[i].y, circleRadius * 2, circleRadius * 2);
  }
}


void draw() {
  background(0, 0, 255);
  fill(0, 255, 0);
  noStroke();

  circles_coords[1].x += 1;
  circles_coords[1].y += 1;

  if ( prev_values[1].x != circles_coords[1].x || prev_values[1].y != circles_coords[1].y) {
    trailXY.add(new PVector(circles_coords[1].x, circles_coords[1].y));
  }

  curTrailLength += 1;

  fill(255, 0, 0);
  for (int i = 0; i < trailXY.size(); i++) {
    circle(trailXY.get(i).x, trailXY.get(i).y, 10);
  }
  
  // Rotate the direction of the circle by the specified angle (in degrees)
  circles_coords[1].rotate(radians(rotationAngle));

  ellipse(circles_coords[1].x, circles_coords[1].y, circleRadius * 2, circleRadius * 2); 
  prev_values[1].x = circles_coords[1].x;
  prev_values[1].y = circles_coords[1].y;
}
