int num_of_circles = 1;
float[] angle;
PVector[] circles_coords;
int[] current_num;


int xSpeed = 2;
int ySpeed = 3;



void setup() {



  size(1200, 1000);

  circles_coords = new PVector[num_of_circles];

  current_num = new int[num_of_circles];

  angle = new float[num_of_circles];

  for (int i = 0; i < num_of_circles; i++) {

    circles_coords[i] = new PVector();
    circles_coords[i].x = width/2;
    circles_coords[i].y = height/2;

    current_num[i] = i + 1;

    angle[i] = 0;
  }
}

void draw() {
  background(0, 0, 255);
  noStroke();

  for (int j = 0; j < num_of_circles; j++) {
    
        fill(255, 0, 0);

    circle(circles_coords[j].x, circles_coords[j].y, 10);


    // Update coordinates based on random changes and speeds
    circles_coords[j].x += xSpeed;
    circles_coords[j].y += ySpeed;

    

    
  }
      circles_coords.rotate(HALF_PI);

}
