import  processing.serial.*;
int grid =20,i;  //how big each sq grid is
PVector food;
PImage img;
PImage img2; 
PImage img3;
PImage img4;
boolean check;
boolean check2;
int token=1;
int x=150;
int y=200;
int colour=255;
int wid[]={0,0,0};  // for width of block
int lnth[]={0,0,0};
int m=1000;
int k=800; 
PVector block=new PVector(floor(random(m)),50);
PVector block1=new PVector(floor(random(m)),300);
PVector block2=new PVector(floor(random(m)),600);
int level=0;
int players=0;
float speed=0.1;
float speed2=0.1;
boolean menu=false;
boolean dead = true;
boolean flag2=true;
int highscore=0;
Snake snake;
Snake2 snake2;
boolean flag=true;
int choice=-1;
void setup()
{
 size(1000,800);
  snake = new Snake();
  snake2 = new Snake2();
  food = new PVector(floor(random(width)),floor(random(height)));
  frameRate(100);  //controls speed by frames processed in 1 sec
  img = loadImage("screen-1.jpg");
  img2 =loadImage("abc.jpg");
  img3 =loadImage("ims.jpg");
  img4 =loadImage("la.jpg");
  int i;
for(i=0;i<3;i++)
{
  lnth[i]=50+floor(random(x));
  wid[i]=50+floor(random(y));
}
}

void draw()
{
  background(0);
  if(!dead)
  { 
     if(!menu)
           {
            fill(255,140,25);
            image(img2,0,0,width,height);
            textAlign(TOP,RIGHT);
            textSize(35);
            text("Enter x for single player",width/2,height/2);
            text("\nEnter y for multiplayer",width/2,height/2);
            keyPressed();
            if(choice!=-1)
            {
            menu=true;
            }
           }
     switch(choice)
          {
            case 1: players=1;
                    singleplayer();
                      break;
            case 2: players=2;
                     multiplayer();
                       break;
            case 3:  menu=false; 
                     snake = new Snake();
                     snake2 = new Snake2(); 
                     break;
            case 4:level=2;
               if(flag2)
                 {  snake.len=2;
                   snake2.len=2;
                    flag2=false;
                  }
                   level();
                   break;
            case 5:exit();
          }
  }
  else
  {
    fill(255);
    image(img,0,0,width,height);
    textAlign(CENTER,CENTER);
    textSize(35);
    text("Let the battle begin\n Click k to start the game" ,width/2,height/2);
   }
 }

void newFood()
{
  food.x= floor(random(width));
  food.y= floor(random(height));
  food.x= floor(food.x/grid)*grid;
  food.y= floor(food.y/grid)*grid;
}

void keyPressed()
{
  if(keyCode==75)
   {
  if(dead)
  {
    snake = new Snake();
   clear();
   fill(255);
  newFood();
  dead = false;
   }
  } 
  if(keyCode == 88)//x for single player
    choice=1;
  if (keyCode == 89)//y for multiplayer
    choice=2; 
  if (keyCode == 79) //o for playing again
    choice=3;
  if(keyCode==80)  //  p  For level 2
     choice=4;
  if(keyCode==69) //e for exit
     choice=5;
  
  
  
  
       if(keyCode==76)         //l for speed of snake 1
           check=true;
       if(keyCode==67)         //  c for speed of snake 2              
            check2=true;
       
       
       
                  if (keyCode == LEFT)
                  {snake.vel.x = -1*speed;
                  snake.vel.y = 0;    //-1 or +1 control speed
                       }
                  else if (keyCode == RIGHT)
                  {snake.vel.x =1*speed;
                  snake.vel.y = 0;  }
                  else if (keyCode == UP)
                   {snake.vel.y = -1*speed;
                   snake.vel.x = 0;}
                  else if(keyCode == DOWN)
                  { snake.vel.y = 1*speed;
                    snake.vel.x = 0;}
  
  
          if (keyCode == 65)                                     //a for left of player 2
          {snake2.vel.x = -1*speed2;
          snake2.vel.y = 0;    //-1 or +1 control speed
               }
          else if (keyCode == 68)                                //d for right for player 2
          {snake2.vel.x =1*speed2;
          snake2.vel.y = 0;  }
          else if (keyCode == 87)                                //w for up player 2
           {snake2.vel.y = -1*speed2;
           snake2.vel.x = 0;
             }
          else if(keyCode == 83)                                  //s for down player 2
          { snake2.vel.y = 1*speed2;
            snake2.vel.x = 0;}
}
void keyReleased()
{
  if(keyCode==76)
      {
        check=false;
       }
  if(keyCode==67)
      { check2=false;
      }
  }
