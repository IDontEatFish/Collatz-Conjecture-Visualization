float clockwise_angle = 13;
float counterclockwise_angle = 20;
int circle_radius = 10;
int strech = 10;



PVector pos;
PVector pos_prev;
PVector move;
int start_collatz=5;
int value=5;


int rectSize = 40;


float[][] buttonLocation = new float[3][4];
int[][] colours = { {52, 78, 65}, {58, 90, 64}, {88, 129, 87}, {88, 129, 87}, {163, 177, 138}};


void setup() {
  size(1500, 900);

  pos = new PVector(width/2, height);
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
  pos = new PVector(width/2, height);
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
