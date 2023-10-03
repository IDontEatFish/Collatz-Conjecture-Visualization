float clockwise_angle = 20;
float counterclockwise_angle = 60;
int circle_radius = 10;



PVector pos;
PVector pos_prev;
PVector move;
int start_collatz=5;
int value=5;




int[][] colours = { {129,161,193}, {136, 192, 208}, {129, 161, 193}};

static int _STRETCH = 30;

void setup() {
  size(1500, 900);
  
  pos = new PVector(width/2, height/2);
  pos_prev = pos.copy();
  move = new PVector(0,1);  
  
  background(94, 129, 172);
  
  textSize(32);   
  text("Clockwise" + str(clockwise_angle) + "angle clockwise", width/2, height/2);
  
  
}

void draw(){
  
  
  int[] colour =colours[ int(random(0, colours.length))];
  
  
  int red = colour[0];
  int green = colour[1];
  int blue = colour[2];
  
  
    fill(red, green, blue);
  
  noStroke();
   circle(pos.x, pos.y, circle_radius);
   
   stroke(red, green, blue);
    fill(red, green, blue);

   line(pos_prev.x, pos_prev.y, pos.x,  pos.y);
   
   // move to next position
   value = next_colatz(value);
   
   // delay(100);
//   println(value);
   
   if (value == 1) {
     start_collatz +=1;
     value = start_collatz;
//     println("-----------------------------");
//    println("new collatz");
//     println(value);
     pos = new PVector(width/2, height/2);
     move = new PVector(0,1);
   }
   
   
   if(value%2 == 0) {
     move.rotate(clockwise_angle * PI/180);
     green = 255;
     red = 0;
   } else {
     move.rotate(counterclockwise_angle * PI/180 * -1);
     red = 255;
     green = 0;
   }
   
   pos_prev = pos.copy();
   pos.x += (move.x*_STRETCH);
   pos.y += (move.y*_STRETCH);
   
   
   
}
