void mouseClicked() { // calls this function if a mouse button has been pressed

  // calls function checkButtons
  checkButtons();

  // calls function create_GUI
  create_GUI();
}

void keyPressed() { // if key presssed

  // if the key pressed is a backspace, call the setup function to "restart" the program
  if (key == BACKSPACE) {
    setup();
  }
}
