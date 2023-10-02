PVector center;  // Declare a PVector for the center
float circleRadius = 10;  // Radius of the circle
int num_of_circles = 1000; // number of circles
PVector[] circles_coords;
int curTrailLength = 0;
ArrayList<PVector> trailXY = new ArrayList<PVector>();
PVector[] prev_values;
float rotationAngle = 30.0;
float angle = 0;
int[] current_num ;
boolean[] status;
int rotation;
float seconds = 0.1;
int frames_passed;
float last_frames = seconds * 60;

void setup() {
  size(2000, 1200);


  circles_coords = new PVector[num_of_circles];
  prev_values = new PVector[num_of_circles];

  current_num = new int[num_of_circles];

  status = new boolean[num_of_circles];

  for (int i = 0; i < num_of_circles; i++) {
    circles_coords[i] = new PVector();
    circles_coords[i].x = width/8;
    circles_coords[i].y = height/2;

    current_num[i] = i + 1;

    prev_values[i] = new PVector();

    status[i] = true;
  }

  prev_values[22].x = width/8;
  prev_values[22].y = height/2;

  for (int i = 0; i < num_of_circles; i++) {
    ellipse(circles_coords[i].x, circles_coords[i].y, circleRadius * 2, circleRadius * 2);
  }
}

void draw() {


  background(0, 0, 255);
  fill(0, 255, 0);
  noStroke();
  circles_coords[22].x += cos(radians(angle));
  circles_coords[22].y += sin(radians(angle));

  if (prev_values[22].x != circles_coords[22].x || prev_values[22].y != circles_coords[22].y) {
    trailXY.add(new PVector(circles_coords[22].x, circles_coords[22].y));
  }

  curTrailLength += 1;

  fill(255, 0, 0);
  for (int i = 0; i < trailXY.size(); i++) {
    circle(trailXY.get(i).x, trailXY.get(i).y, circleRadius / 2);
  }

  circle(circles_coords[22].x, circles_coords[22].y, circleRadius);
  prev_values[22].x = circles_coords[22].x;
  prev_values[22].y = circles_coords[22].y;





  if (frames_passed == last_frames ) {

    last_frames = last_frames + (seconds * 60);
    if (end(current_num[22])) {
      println("EnDDDDDDDDDDDDDDDDDDDDDDDdd");
      status[22] = false;
      // continue;
    }


    if (status[22] == true) {

      print(oddsEven(current_num[22]));
      if (oddsEven(current_num[22])) {

        println(true);
        print(current_num[22]);

        current_num[22] /= 2;
        rotation = 30;
      } else {
        println("odd");
        current_num[22] = (current_num[22] * 3) + 1;


        rotation = -30;
      }
    }


    angle += rotation;
  }
  frames_passed += 1;
}
