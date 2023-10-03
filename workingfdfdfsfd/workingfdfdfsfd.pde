PVector pos;
PVector pos_prev;
PVector move;

int start_collatz=3;
int value=3;

int green = 0;
int red = 0;
int blue = 0;

static int _STRETCH = 30;

void setup() {
  size(1000, 1000);
  
  pos = new PVector(width/2, height);
  pos_prev = pos.copy();
  move = new PVector(0,-1);  
  
  background(0,0,255);
  fill(255,0,0);
  stroke(255,0,0);
}

void draw(){
    fill(red,green,0);

   circle(pos.x, pos.y, 3);
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
     pos = new PVector(width/2, height);
     move = new PVector(0,-1);
   }
   
   
   if(value%2 == 0) {
     move.rotate( PI/10 );
     green = 255;
     red = 0;
   } else {
     move.rotate( -PI/10 );
     red = 255;
     green = 0;
   }
   
   pos_prev = pos.copy();
   pos.x += (move.x*_STRETCH);
   pos.y += (move.y*_STRETCH);
}

int next_colatz(int x) {
  if (x%2 == 0) {
    return x/2;
  } else {
    return 3*x+1;
  }
}
