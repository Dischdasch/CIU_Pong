import processing.sound.*;
//Class definitions used later
class Balon{
  void drawB(int PosX, int PosY, int eWidth, int eHeight){
  ellipse(PosX,PosY,eWidth,eHeight);
  }
}

class Jugador{
  int posX;
  int posY;
  int jHeight;
  int jWidth;
  int count;
  
  Jugador(){
    count=0;
  }
  void drawJ(int posX, int posY, int jWidth, int jHeight){
    rect(posX-jWidth/2,posY-jHeight/2,jWidth,jHeight);
  }
}

//Global Variables
Jugador jugador1;
Jugador jugador2;
Balon balon;
int balonX;
int balonY;
int movX;
int movY;
int posY_1;
int posY_2;
int goles=0;
boolean w = false;
boolean s = false;
boolean up = false;
boolean down = false;
SoundFile  sound;

void setup(){
  size(400,400); 
  fill(100);
  posY_1 = height/2;
  posY_2 = height/2;
  balonY = int(random(15,height-15));
  balonX = width/2;
  int[] movVal = { -5, -4, -3, -2, -1, 1, 2, 3, 4, 5 };
  int movXIndex = int(random(10));
  movX = movVal[movXIndex];
  int movYIndex = int(random(10));
  movY = movVal[movYIndex];
  jugador1 = new Jugador();
  jugador2 = new Jugador();
  balon = new Balon();
  sound = new SoundFile(this,"Dry-Kick.wav");
}

void draw(){  
  background(128);
  if(jugador1.count < 5 && jugador2.count <5) //check if the game is finished
  {
    //Check if rackets should move
    if (up ==true && posY_2 > 27)
    {
      posY_2 -= Math.abs(movY);
    }
    if (down==true && posY_2 < 372)
    {
      posY_2 += Math.abs(movY);
    }
    if (w==true && posY_1 > 27)
    {
      posY_1 -= Math.abs(movY);
    }
    if (s==true && posY_1 < 372)
    {
      posY_1 += Math.abs(movY);
    }
    rectMode(CORNER);
   
   //give green color to leader, red to loser
  if(jugador1.count > jugador2.count)
  {
    fill(50,205,50);
    jugador1.drawJ(10, posY_1, 20, 50);
    fill(178,34,34);
    jugador2.drawJ(width-10, posY_2, 20, 50);
  }
  else if(jugador2.count > jugador1.count)
  {
    fill(178,34,34);
    jugador1.drawJ(10, posY_1, 20, 50);
    fill(50,205,50);
    jugador2.drawJ(width-10, posY_2, 20, 50);
  }
  else{
    fill(0);
    jugador1.drawJ(10, posY_1, 20, 50);
    jugador2.drawJ(width-10, posY_2, 20, 50);
  }
  
  //draw ball
  fill(255);
  balon.drawB(balonX, balonY, 30, 30);
  balonX += movX;
  balonY += movY;
  
  //bounce
  if (balonX>=400 || balonX<=0)
  {
    movX=-movX;
  }
  if (balonY>=400 || balonY<=0)
  {
    movY=-movY;
  }
  //verificando si hay choque con j1
  if ((movX<0 && posY_1+25>=balonY-15 && balonY+15>=posY_1-25 && 20>=balonX-15 /*&& balonX-15>=20*/))
  {
    movX=-movX;
    thread ("Suena");  
  }
  //verificando si hay choque con j2
  if ((movX>0 && posY_2+25>=balonY-15 && balonY+15>=posY_2-25 && width-20<=balonX+15/* && balonX+15<=width-20*/))
  {
    movX=-movX;
    thread ("Suena");  
  }
  
  //increment count of players
  if  (balonX>=400)
    {
      jugador1.count+=1;
    }
    if  (balonX<=0)
    {
      jugador2.count+=1;
    }
    
    //display player counts
    textSize(20);
    text(jugador1.count, 30, 380);
    text(jugador2.count, width-35, 380);
  }
  else{
    //Display winner and count
    if (jugador1.count >=5){
      textSize(45);
      text("JUGADOR 1 GANA!", 20, 170);
      textSize(30);
      text(jugador1.count + ":" + jugador2.count, 190, 200);
    }
    else{
      textSize(45);
      text("JUGADOR 2 GANA!", 20, 170);
      textSize(30);
      text(jugador1.count + ":" + jugador2.count, 190, 200);
    }
  }
}
//helper function memorizing which keys were pressed
void keyPressed(){
    if(key == CODED)
    {
      if (keyCode == UP)
      {
        up = true;
      }
      if (keyCode == DOWN)
      {
        down = true;
      }
    }
      if (key == 'W' || key == 'w')
      {
        w = true;
      }
      if (key == 'S' || key == 's')
      {
        s = true;
      }
}

//helper function memorizing which keys were released
void keyReleased(){
    if(key == CODED)
    {
      if (keyCode == UP)
      {
        up = false;
      }
      if (keyCode == DOWN)
      {
        down = false;
      }
    }
      if (key == 'W' || key == 'w')
      {
        w = false;
      }
      if (key == 'S' || key == 's')
      {
        s = false;
      }
}

//helper function sound
void Suena( ) {  
  sound.play();
}
