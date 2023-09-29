PVector center;  // Declare a PVector for the center
float circleRadius = 10;  // Radius of the circle
int num_of_circles = 20; // number of circles

PVector[] line;

PVector[] circles_coords;






void setup() {
  size(1200, 800);



  PVector[] circles_coords = new PVector[num_of_circles];

  println(circles_coords);


  int[] current_num = new int[num_of_circles ];

  for (int i = 0; i < num_of_circles; i++) {

    circles_coords[i].x = random(1200);
    circles_coords[i].y = random(800);

    current_num[i] = i + 1;
  }

  println(current_num);
}

void draw() {
  background(255);



  for (int i = 0; i < num_of_circles; i++) {

    ellipse(circles_coords[i].x, center.y, circleRadius * 2, circleRadius * 2);
  }
  if (mousePressed) {
    // Change the position of the PVector to the mouse cursor
    center.x = mouseX;  // Change "position" to "center" here
    center.y = mouseY;  // Change "position" to "center" here
  }
}
