int next_colatz(int x) {
  if (x%2 == 0) {
    return x/2;
  } else {
    return (3*x+1);
  }
}


void create_text(float clockwise_angle, float counterclockwise_angle, int strech) {


  textSize(16);


  String angle_text_clock = ("Even number angle: " + str(clockwise_angle) + "°");

  text(angle_text_clock, width/40, height/15);

  String angle_text_counter = ("Odd number angle: " + str(counterclockwise_angle) + "°");
  text(angle_text_counter, width/40, height/8);

  String strech_text = ("Strech: " + str(strech));

  text(strech_text, width/40, height/5.6);
  
  
  text("Press backspace to reset", width/40, height/4.4);
}


void create_button(float rectX, float rectY, int rectSize, color rectColor, String string, float offsetX, float offsetY ) {
  fill(59, 66, 82, 0);
  noStroke();

  rect(rectX, rectY, rectSize, rectSize);
  textSize(30);
  fill(88, 129, 87);
  float textX = rectX + rectSize / 2 + offsetX;
  float textY = rectY + rectSize / 2 + offsetY;

  text(string, textX, textY);
}


void create_GUI() {

  drawOverText(10, 15, 300, 150);

  fill(255, 255, 255);
  create_text(clockwise_angle, counterclockwise_angle, strech);

  create_button(buttonLocation[0][0] = width/3, buttonLocation[0][1] = height / 60, rectSize, color(255, 0, 0), "+", -16, 20.5);

  create_button(buttonLocation[0][2] = width/3.5, buttonLocation[0][3] = height / 60, rectSize, color(255, 0, 0), "-", -11, 20);

  create_button(buttonLocation[1][0] = width/3, buttonLocation[1][1] = height / 13, rectSize, color(255, 0, 0), "+", -16, 20.5);

  create_button(buttonLocation[1][2] = width/3.5, buttonLocation[1][3] = height / 13, rectSize, color(255, 0, 0), "-", -11, 20.5);


  create_button(buttonLocation[2][0] = width/5.5, buttonLocation[2][1] = height / 7.8, rectSize, color(255, 0, 0), "+", -16, 20.5);

  create_button(buttonLocation[2][2] = width/7.4, buttonLocation[2][3] = height / 7.8, rectSize, color(255, 0, 0), "-", -11, 20.5);
}


void drawOverText(int x1, int y1, int x2, int y2) {

  noStroke();
  fill(52, 78, 65);  // Set the fill color to match the background
  rect(x1, y1, x2, y2);
}



void checkButtons() {

  for (int j = 0; j < buttonLocation.length; j++) {



    if (mouseX >= buttonLocation[j][0] && mouseX <= buttonLocation[j][0] + rectSize && mouseY >=  buttonLocation[j][1] && mouseY <= buttonLocation[j][1] + rectSize) {


      if (j == 0) {
        clockwise_angle += 1;
      } else if (j == 1) {
        counterclockwise_angle += 1;
      }
    }


    if (mouseX >= buttonLocation[j][2 ] && mouseX <= buttonLocation[j][2] + rectSize && mouseY >=  buttonLocation[j][3] && mouseY <= buttonLocation[j][3] + rectSize) {
      if (j == 0) {
        clockwise_angle -= 1;
      } else if (j == 1) {
        counterclockwise_angle -= 1;
      }
    }



    if (j == 2) {

      if (mouseX >= buttonLocation[j][0 ] && mouseX <= buttonLocation[j][0] + rectSize && mouseY >=  buttonLocation[j][1] && mouseY <= buttonLocation[j][1] + rectSize) {

        strech += 1;
      } else if (mouseX >= buttonLocation[j][2] && mouseX <= buttonLocation[j][2] + rectSize && mouseY >=  buttonLocation[j][3] && mouseY <= buttonLocation[j][3] + rectSize)
        strech -= 1;
    }
  }
}
