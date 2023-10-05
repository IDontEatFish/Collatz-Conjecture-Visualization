/*
 Collatz Conjecture Visualization by Nikolaus
 
 The Collatz conjecture is one of the most famous math problems left unsolved.
 
 It follows a sequence of positive integers. For any integer, say n, the following number in the series is either
 
 n / 2 (if n is an even integer) or 3n + 1 (if n is odd)
 
 For example, if we start with a number such as 3. Where n = 3, the following number would be:
 
 3 (Odd, so the following number is 3n + 1)
 10 (Even so, the following number is n / 2)
 5 (Odd, so the following number is 3n + 1)                                                                                                                                                                      
 16
 
 
 Continuing this, we would get a sequence of:
 
 
 3, 10, 5, 16, 8, 4, 2, 1
 
 The conjecture states that n will always reach 1 no matter what n is equal to. So n .... 1
 
 This sequence will always reach 1 and will repeat in a "cycle" of 1 4 2, so n, ..., 1, 4, 2, 1, 4, 2.
 
 This means when n reaches 1, it is considered the end.
 
 We can visualize this as reaching a "branch" having the root of 1 and choosing an angle.
 
 If the number is even, rotate counterclockwise by theta and counterclockwise by theta if odd.
 
 This creates an interesting  visualization where the values can be played with.
 
 */


// set angles, radius and strech
float clockwise_angle = 13;
float counterclockwise_angle = 20;
int circle_radius = 10;
int strech = 10;




// variables for movement of circles
PVector start;
PVector pos;
PVector pos_prev;
PVector move;
int start_collatz;
int value;



// variables for buttons
float startx, starty;
int rectSize = 30;
float[][] buttonLocation = new float[3][4];
int[][] colours = { {52, 78, 65}, {58, 90, 64}, {88, 129, 87}, {88, 129, 87}, {163, 177, 138}};


void setup() {
  size(800, 600);

  // set which number to start at
  value = 5;
  start_collatz = 5;

  // starting location
  startx = width/2;
  starty = height/1.1;

  // create PVector for circle and for its trails
  pos = new PVector(startx, starty);
  pos_prev = pos.copy();
  // direction of movement of the circles
  move = new PVector(0, -2);


  // set background colour
  background(218, 215, 205);

  // function in my_functions that creates gui
  create_GUI();
}

void draw() {


  // choose a random colour from the array of colours
  int[] colour =colours[ int(random(0, colours.length))];

  int red = colour[0];
  int green = colour[1];
  int blue = colour[2];



  // create circle
  fill(red, green, blue);
  noStroke();
  circle(pos.x, pos.y, circle_radius);


  // create a line from the previous position of the circle to the current
  stroke(red, green, blue);
  fill(red, green, blue);
  strokeWeight(2);
  line(pos_prev.x, pos_prev.y, pos.x, pos.y);


  // calculate the next value, if the number is even / 2 and if it is odd * by 3 and add 1
  value = next_colatz(value);

  // pause the programm for 0.075 seconds
  delay(75);



  // if the current value is 1 it means that the branch is at its end meaning go back to the starting location and start a new branch
  if (value == 1) {

    // increase the starting number
    start_collatz += 1;
    value = start_collatz;


    // move the position back to the starting one
    pos = new PVector(startx, starty);
    move = new PVector(0, -2);
  }

  // decide if the position of the circle should move clockwise or counter clockwise
  if (value%2 == 0) { // if the number is even rotate clockwise

    // NEW COMMAND LEARNED :::: rotate the vector clockwise if the number is even
    move.rotate(clockwise_angle * PI/180);
  } else {

    // rotate the vector counterclockwise if the number is odd
    move.rotate((counterclockwise_angle * PI/180) * -1 );
  }


  // copy and store current position of the circle for the trail
  pos_prev = pos.copy();

  // change the x and y values of the circle
  pos.x += (move.x*strech);
  pos.y += (move.y*strech);
}
