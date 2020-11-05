void intro() {
  song.play();
  win.pause();
  //gif
  image(gif[f],-100,0,width+200,height);
  f=f+1;
  if (f==frameNumber) f=0;
  
  //title
  fill(0);
  rectMode(CENTER);
rect(400,400,550,110);
   textFont(optimus);
 textSize(100);
textAlign(CENTER,CENTER); 
fill(green);
text("BREAKOUT",400,380);


}

void introClicks() {
  mode=GAME;
}
