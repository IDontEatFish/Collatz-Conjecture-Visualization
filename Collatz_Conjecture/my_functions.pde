int next_colatz(int x) {


  // if the number is even return x / 2
  if (x%2 == 0) {
    return x / 2;
  }
  // if the number is odd return 3*x + 1
  else {

    return (3 * x + 1);
  }
}


void create_text(float clockwise_angle, float counterclockwise_angle, int strech) { // this function creates the text for the gui

  // set text size
  textSize(16);

  // creates gui text
  String angle_text_clock = ("Even number angle: " + str(clockwise_angle) + "°");
  text(angle_text_clock, width/40, height/15);
  String angle_text_counter = ("Odd number angle: " + str(counterclockwise_angle) + "°");
  text(angle_text_counter, width/40, height/8);
  String strech_text = ("Strech: " + str(strech));
  text(strech_text, width/40, height/5.6);
  text("Press backspace to reset", width/40, height/4.4);
}


void create_button(float rectX, float rectY, int rectSize, String string, float offsetX, float offsetY ) { // creates a button



  // creates a buttona and stores it in a 2d array for coordinates.
  fill(59, 66, 82, 0);
  noStroke();
  rect(rectX, rectY, rectSize, rectSize);
  textSize(30);
  fill(88, 129, 87);

  // creates button x and y
  float textX = rectX + rectSize / 2 + offsetX;
  float textY = rectY + rectSize / 2 + offsetY;

  // displays the text
  text(string, textX, textY);
}


void create_GUI() { // function that calls all the other GUI functions together
  // callls function
  drawOverText(10, 15, 300, 150);


  // creates text
  fill(255, 255, 255);
  create_text(clockwise_angle, counterclockwise_angle, strech);


  // creates buttons in respective position
  create_button(buttonLocation[0][0] = width/3, buttonLocation[0][1] = height / 60, rectSize, "+", -16, 20.5);

  create_button(buttonLocation[0][2] = width/3.5, buttonLocation[0][3] = height / 60, rectSize, "-", -11, 20);

  create_button(buttonLocation[1][0] = width/3, buttonLocation[1][1] = height / 13, rectSize, "+", -16, 20.5);

  create_button(buttonLocation[1][2] = width/3.5, buttonLocation[1][3] = height / 13, rectSize, "-", -11, 20.5);


  create_button(buttonLocation[2][0] = width/5.5, buttonLocation[2][1] = height / 7.8, rectSize, "+", -16, 20.5);

  create_button(buttonLocation[2][2] = width/7.4, buttonLocation[2][3] = height / 7.8, rectSize, "-", -11, 20.5);
}




void drawOverText(int x1, int y1, int x2, int y2) {

  // creates a rectangle over the older text because background(a, b, c) would delete all of the circles and lines
  noStroke();
  fill(52, 78, 65);
  rect(x1, y1, x2, y2);
}



void checkButtons() { // function that checks if a button was pressed



  // loops through the set of coordinates for each group (+, -) of buttons
  for (int j = 0; j < buttonLocation.length; j++) {


    // if the current position of the mouse is in either of the coordinates of the counter or clock wise "+" button then increase whatever buttons was pressed angle by 1
    if (mouseX >= buttonLocation[j][0] && mouseX <= buttonLocation[j][0] + rectSize && mouseY >=  buttonLocation[j][1] && mouseY <= buttonLocation[j][1] + rectSize) {

      // increase angle wether it was clockwise's + button that was pressed or counterclockwise's
      if (j == 0) {
        clockwise_angle += 1;
      } else if (j == 1) {
        counterclockwise_angle += 1;
      }
    }

    // if the current position of the mouse is in either of the coorinates of the counter or clock wise "-" button then decrease whatever buttons was pressed angle by 1
    if (mouseX >= buttonLocation[j][2 ] && mouseX <= buttonLocation[j][2] + rectSize && mouseY >=  buttonLocation[j][3] && mouseY <= buttonLocation[j][3] + rectSize) {

      // increase angle wether it was clockwise's + button that was pressed or counterclockwise's
      if (j == 0) {
        clockwise_angle -= 1;
      } else if (j == 1) {
        counterclockwise_angle -= 1;
      }
    }


    // if the current position of the mouse is in hte coordinates of the buttons the "+" or "-" then add or subtract 1
    if (j == 2) {

      if (mouseX >= buttonLocation[j][0 ] && mouseX <= buttonLocation[j][0] + rectSize && mouseY >=  buttonLocation[j][1] && mouseY <= buttonLocation[j][1] + rectSize) {

        strech += 1;
      } else if (mouseX >= buttonLocation[j][2] && mouseX <= buttonLocation[j][2] + rectSize && mouseY >=  buttonLocation[j][3] && mouseY <= buttonLocation[j][3] + rectSize)
        strech -= 1;
    }
  }
}
