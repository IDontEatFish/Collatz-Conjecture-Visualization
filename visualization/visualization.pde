PVector center;  // Declare a PVector for the center
float circleRadius = 10;  // Radius of the circle
int num_of_circles = 500; // number of circles
PVector[] circles_coords;
int curTrailLength = 0;
ArrayList<PVector> trailXY = new ArrayList<PVector>();
PVector[] prev_values;
float rotationAngle = 90.0;
float angle = 0;
int[] current_num ;
boolean[] status;
int rotation;
float seconds = 0.05;
int frames_passed;
float last_frames = seconds * 60;

void setup() {
  size(2000, 1200);

  background(0, 0, 0);


  circles_coords = new PVector[num_of_circles];
  prev_values = new PVector[num_of_circles];

  current_num = new int[num_of_circles];

  status = new boolean[num_of_circles];

  for (int i = 0; i < num_of_circles; i++) {
    circles_coords[i] = new PVector();
    circles_coords[i].x = width/8;
    circles_coords[i].y = height/10;

    current_num[i] = i + 1;

    prev_values[i] = new PVector();

    prev_values[i].x = width/8;
    prev_values[i].y = height/10;

    status[i] = true;
  }
}

void draw() {


  background(0, 0, 255);
  noStroke();



  circles_coords[499].x += cos(radians(angle)) + 1.5;
  circles_coords[499].y += sin(radians(angle)) + 1.5;

  circle(circles_coords[499].x, circles_coords[499].y, circleRadius);



  if (prev_values[499].x != circles_coords[499].x || prev_values[499].y != circles_coords[499].y) {
    trailXY.add(new PVector(circles_coords[499].x, circles_coords[499].y));
  }

  curTrailLength += 1;

  fill(255, 0, 0);
  for (int i = 0; i < trailXY.size(); i++) {
    circle(trailXY.get(i).x, trailXY.get(i).y, circleRadius / 2);
  }

  prev_values[499].x = circles_coords[499].x;
  prev_values[499].y = circles_coords[499].y;





  if (frames_passed == last_frames ) {

    last_frames = last_frames + (seconds * 60);
    if (end(current_num[499])) {
      status[499] = false;
      //continue;
    }


    if (status[499] == true) {

      if (oddsEven(current_num[499])) {


        current_num[499] /= 2;
        rotation = 52;
      } else {
        current_num[499] = (current_num[499] * 3) + 1;


        rotation = -52 ;
      }
    }
    println(current_num[499]);


    angle += rotation;
  }
  frames_passed += 1;
}
