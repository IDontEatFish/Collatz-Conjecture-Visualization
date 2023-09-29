PVector center;  // Declare a PVector for the center
float circleRadius = 10;  // Radius of the circle

void setup() {
  size(1200, 800);
  center = new PVector(width / 2, height / 2);  // Set the PVector to the center
}

void draw() {
  background(255);
  
  // Draw a circle at the center using the PVector
  ellipse(center.x, center.y, circleRadius * 2, circleRadius * 2);
  
  
   if (mousePressed) {
    // Change the position of the PVector to the mouse cursor
    center.x = mouseX;  // Change "position" to "center" here
    center.y = mouseY;  // Change "position" to "center" here
  }
}
