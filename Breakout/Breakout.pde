import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Sarah Nelson
//block 1-1a
//Oct 6, 2020

//colour
color dark=#253586;
color indigo=#334DA7;
color blue=#3CA3E5;
color green=#57F5D4;
color yellow=#FDFFAD;

PFont optimus; //font



PImage[] gif; //gif
int frameNumber;
int f;

int [] x;
int [] y;
boolean[] alive; //for bricks
int brickd; 
int n;
int tempx,tempy;

//sound effects
Minim minim;
AudioPlayer paddle,brick,wall,life,lose,win,song;

boolean leftkey,rightkey; //true or false
float ballx,bally,balld,ballr; //ball variables
float paddlex,paddley,paddled,paddler; //paddle variables
float d;
float vx,vy; //velocity
int score,lives,timer;

int mode;
final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int GAMEOVER=3;


void setup() { //==============================================================
 size(800,800);
 
 optimus=createFont("Optimus.otf",50);
 //bricks
 brickd=40;
  n=60;
 x=new int [n];
 y=new int [n];
 alive= new boolean[n];
 tempx=90;
 tempy=100;
 int i=0;
 while (i<n) {
   x[i]=tempx;
   y[i]=tempy;
   alive[i]=true;
   tempx=tempx+70;
   if (tempx>750) {
     tempx=90;
     tempy=tempy+70;
   }
   i=i+1;
 }
 //gif
 frameNumber=24;
 gif=new PImage[frameNumber];
 
  int ii=0;
  while (ii<frameNumber) {
   gif[ii]=loadImage("frame_"+ii+"_delay-0.04s.gif");
    ii=ii+1;
  }
 
 //initialize paddles
  paddlex=400;
 paddley=height;
  paddled=150;
  
  //score
  score=0;
  lives=3;
  
  timer=100;
  
  mode=INTRO;
  
   //bouncing collision
  d=dist(paddlex,paddley,ballx,bally);
  paddler=paddled/2;
  ballr=balld/2;
 
  //velocity
vx=0;
vy=3;
   //initialize ball
  ballx=width/2;
  bally=550;
  balld=20;
  
  
    //minim
minim= new Minim(this);
paddle=minim.loadFile("paddle.wav"); //paddle hit
brick=minim.loadFile("brick.wav"); //target hit
wall=minim.loadFile("wallHit.wav"); //wall hit
win=minim.loadFile("win.wav"); //win sound
lose=minim.loadFile("wallHit.wav"); //wall hit
life=minim.loadFile("lostLife.wav"); //lost life sound
song=minim.loadFile("music.mp3"); //song
lose=minim.loadFile("failure.wav"); //life lost
}

void draw()  {
  if (mode==INTRO) {
    intro();
  }else if (mode==GAME) {  
   game(); 
  }else if (mode==PAUSE) {
    pause();
  }else if (mode==GAMEOVER) {
    gameover();
  }else{
    println("Error: Mode= " + mode);
  }
}
