void gameover() {
  background(0);
  fill(green);
  textSize(130);
textAlign(CENTER,CENTER); 

if (lives==0) {
text("You Lose",400,300);
lose.play();
}else{
  if (score==60)
    text("You Win",400,300);
    win.play();
    
}
textSize(50);
text("-Click to Restart-",400,450);
}

void gameoverClicks() {
  mode=INTRO;
  reset();
}
