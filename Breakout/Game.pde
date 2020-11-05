void game() {
  song.pause();
  background(0);
  //ball
  fill(255);
  stroke(255);
  circle(ballx,bally,balld);
  //ball setup
   d=dist(paddlex,paddley,ballx,bally);
  paddler=paddled/2;
  ballr=balld/2;
  
 //score and lives counter
 textAlign(CENTER,CENTER);
textSize(40);
text("Score: " +score,500,20);
text("Lives: "+lives,300,20);
 timer=timer-1;

//ball off screen
if (bally>850) {
  resetBall();
  lives=lives-1; //
   ballx=width/2;
   bally=550;
   timer=100;
   lose.rewind();
   lose.play();
 }

  //ball movement
 if(timer<0) {
ballx=ballx+vx; 
  bally=bally+vy;
  }
  //paddle bounce
   if (d<=paddler+ballr) {
      vx=(ballx-paddlex)/10;
      vy=(bally-paddley)/10;
      paddle.rewind();
      paddle.play();
      
   }
   //ball bouncing
  if (ballx>=height-balld/2 || ballx<=balld/2) {    
    vx=vx*-1;
    wall.rewind();
      wall.play();
 }
  if (bally<=balld/2) {
    vy=vy*-1;
    wall.rewind();
      wall.play();
 }
 
  //draw paddles
   fill(255);
  stroke(255);
  circle(paddlex,paddley,paddled);
//move paddles 
  if (leftkey==true) paddlex=paddlex-5;
  if (rightkey==true) paddlex=paddlex+5; 
  if (paddlex<75) {
  paddlex=75; 
 }
 if (paddlex>725) {
  paddlex=725; 
 }
 
 if (lives==0) {
   mode=GAMEOVER;
   lose.play();
 }
 
 //bricks ================================================================= 
 int i=0;
 while (i<n) { 
   if (alive[i]==true) {
   manageBrick(i);
   }
    i=i+1;
 }
  if (score==60) {
   mode=GAMEOVER;
   win.play();
  }
}


void gameClicks() {
  mode=PAUSE;
 }
 


void manageBrick(int i) {//================================================
 
   if (y[i]==100) fill(dark);
   if (y[i]>150) fill(indigo);
   if (y[i]>200) fill(blue);
   if (y[i]>300) fill(green);
    if (y[i]>350) fill(yellow);
     if (y[i]>400) fill(255);
    noStroke();
 circle(x[i],y[i],brickd);
 if(dist(ballx,bally,x[i],y[i])<=balld/2+brickd/2) {
      vx=(ballx-x[i])/5;
      vy=(bally-y[i])/5;
      alive[i]=false;
      score=score+1;
      brick.rewind();
   brick.play();
 }
 
}
