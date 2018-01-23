final int n = 4;
final int Tilesnum = 16;
int[] tiles = new int[Tilesnum];
int tileW, tileH;
PImage photo;
PImage photo0, photo1, photo2, photo3, photo4, photo5, photo6, photo7;
//PImage[] image=new PImage[8];
int correct= 0;
boolean match = false;

void setup()
{
 
  size (600, 600);
  tileW= width/n;
  tileH= height/n;
  initializeBoard(n);
  //frameRate(1);

  photo0=loadImage("0.jpg");
  photo1=loadImage("1.jpg");
  photo2=loadImage("2.jpg");
  photo3=loadImage("3.jpg");
  photo4=loadImage("4.jpg");
  photo5=loadImage("5.jpg");
  photo6=loadImage("6.jpg");
  photo7=loadImage("7.jpg");
  
  reset();
}

void draw()
{
  //image(photo0, 200, 200, tileW, tileH);
  if (detect==true) {
    if (match==false) {
      closeTiles();
      detect=false;
    }
    detect=false;
  }
}
void myDelay(int delay) {
  int time = millis();
  while (millis () < time +delay);
}
void initializeBoard(int n)
{
  fill(255, 0, 0);

  for (int row = 0; row <= n; row++)
    for (int col = 0; col <= n; col++)
      rect(row*tileW, col*tileH, width/n, height/n);


  for (int i=0; i< Tilesnum; i++)
    tiles[i]= -1; //no pairs 

  int rNum;
  for (int pairNum = 0; pairNum < Tilesnum/2; pairNum++)
  {
    findRandomPair(pairNum);
    findRandomPair(pairNum);
  }
  println(tiles);
}

void findRandomPair (int j)
{
  int rNum = (int)random(Tilesnum);
  while (tiles[rNum] != -1)//!= means not equal to 
  {
    rNum = (int)random(Tilesnum);
  }
  tiles[rNum] = j;
}

int turn =0;
void mousePressed()
{
  //we need mouseX and mouseY
  if (turn %2== 0)
  {
    openTile1(); 
    turn++;
  }
  else {
    openTile2();
    turn++;
  }
  println(turn);
}
//this info noeeded for closing and matchin
int row1, col1, tileNum1;
int row2, col2, tileNum2;

void openTile1()
{
  row1 = (int) (mouseX/ tileW);
  col1 = (int) (mouseY/ tileH);
  tileNum1 = col1*n + row1;
  println("tiles[tileNum1]tiles[tileNum1]   "+ tiles[tileNum1]);
  //photo = loadImage(tiles[tileNum1]+".jpg");

  //photo=image[(tiles[tileNum1])];

  switch(tiles[tileNum1]) {
  case 0: 
    photo=photo0;break;
  case 1: 
    photo=photo1;break;
  case 2: 
    photo=photo2;break;
  case 3: 
    photo=photo3;break;
  case 4: 
    photo=photo4;break;
  case 5: 
    photo=photo5;break;
  case 6: 
    photo=photo6;break;
  case 7: 
    photo=photo7;break;
  }

  image(photo, row1*tileW, col1*tileH, tileW, tileH);
}

void openTile2()
{
  row2 = (int)(mouseX/ tileW);
  col2 = (int)(mouseY/ tileH);
  tileNum2 = col2*n + row2;
  switch(tiles[tileNum2]) {
  case 0: 
    photo=photo0;break;
  case 1: 
    photo=photo1;break;
  case 2: 
    photo=photo2;break;
  case 3: 
    photo=photo3;break;
  case 4: 
    photo=photo4;break;
  case 5: 
    photo=photo5;break;
  case 6: 
    photo=photo6;break;
  case 7: 
    photo=photo7;break;
  }

  image(photo, row2*tileW, col2*tileH, tileW, tileH);
  matchPair();
  //turn=1;
}
int numTry = 0;
void matchPair()
{
  numTry++;
  //add some println here
  if (tiles[tileNum1]== tiles[tileNum2])
  {//match
    correct++;
    if (correct == (Tilesnum/2))
    {
      turn=0;
      textSize(30);
      fill(0);
      text("YOU WIN",300,300);
      myDelay(500);
      reset();
     
    }
    match = true;
  }
  else
  {
    match = false;
    println("no match");
  
    detect=true;
  }
}

boolean detect=false;
void closeTiles()
{
   myDelay(500);
  rect(row1*tileW, col1*tileH, tileW, tileH); 
  rect(row2*tileW, col2*tileH, tileW, tileH);
}



void reset(){

  
  initializeBoard(n);
 
}
  
