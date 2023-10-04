/*
Collatz Conjecture Visualization by Nikolaus

The Collatz conjecture is one of the most famous Mathematics problems left unsolved. 

It follows a sequence of positive integers. For any integer, say n, the following number in the series is either

                n / 2 (if n is an even integer) or 3n + 1 (if n is odd)   Note: In my program you are able to change each equation
                
For example, if we start with a number such as 3. Where n = 3, the following number would be:

3 (Odd, so the following number is 3n + 1)
10 (Even so, the following number is n / 2)
5 (Odd, so the following number is 3n + 1)                                                                                                                                                                      )
16 (Continuing this, we would get.)


3, 10, 5, 16, 8, 4, 2, 1

The conjecture states that n will always reach 1 no matter what n is equal to. So n .... 1

This sequence will always reach 1 and will repeat in a "cycle" of 1 4 2, so n, ..., 1, 4, 2, 1, 4, 2.

This means when n reaches 1, it is considered the end. 

We can visualize this as reaching a "branch" having the root of 1 and choosing an angle.

If the number is even, rotate counterclockwise by theta and counterclockwise by theta if odd.

This creates an interesting  visualization where the values can be played with. 







*/



float clockwise_angle = 13;
float counterclockwise_angle = 20;
int circle_radius = 10;
int strech = 10;

PVector start;

PVector pos;
PVector pos_prev;
PVector move;
int start_collatz=5;
int value=5;

float startx, starty;

int rectSize = 40;


float[][] buttonLocation = new float[3][4];
int[][] colours = { {52, 78, 65}, {58, 90, 64}, {88, 129, 87}, {88, 129, 87}, {163, 177, 138}};


void setup() {
  size(1500, 900);
  
 
  
  
  startx = width/2;
  starty = height/1.1;
  pos = new PVector(startx, starty);
  pos_prev = pos.copy();
  move = new PVector(0, -2);

  background(218, 215, 205);


  create_GUI();
}

void draw() {

  int[] colour =colours[ int(random(0, colours.length))];


  int red = colour[0];
  int green = colour[1];
  int blue = colour[2];


  fill(red, green, blue);

  noStroke();
  circle(pos.x, pos.y, circle_radius);

  stroke(red, green, blue);
  fill(red, green, blue);


  strokeWeight(2);
  line(pos_prev.x, pos_prev.y, pos.x, pos.y);


  // move to next position
  value = next_colatz(value);

  delay(100);
  println(value);

  if (value == 1) {
    start_collatz +=1;
    value = start_collatz;
    println("-----------------------------");
    println("new collatz");
    println(value);
    pos = new PVector(startx, starty);
    move = new PVector(0, -2);
  }


  if (value%2 == 0) {
    move.rotate(clockwise_angle * PI/180);
    green = 255;
    red = 0;
  } else {
    move.rotate((counterclockwise_angle * PI/180) * -1 );
    red = 255;
    green = 0;
  }

  pos_prev = pos.copy();
  pos.x += (move.x*strech);
  pos.y += (move.y*strech);
}


void keyPressed() {
  if (key == BACKSPACE) {
    setup();

  }
}
