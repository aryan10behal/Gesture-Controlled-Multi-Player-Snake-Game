class Snake
{
  PVector pos;
  PVector vel;
  ArrayList<PVector> hist;
  int len;
  int moveX = 0;
  int moveY = 0;
Snake()
{
  pos= new PVector(0,0);
  vel = new PVector(1*speed,1*speed);
  hist = new ArrayList<PVector>();
  len=2;
}
 
void update()
  {
    hist.add(pos.copy());
   pos.x +=vel.x*grid;
   pos.y += vel.y*grid;
   moveX = int(vel.x);
   moveY = int(vel.y); 
   pos.x = (pos.x + width) % width;
   pos.y = (pos.y + height) % height;
 //  vel.mult(0);   
   if(hist.size() >len)
   {
     hist.remove(0);
   }
   
  } 


void eat()
{
  if((food.x-20)< pos.x && pos.x<(food.x+20) && pos.y< (food.y+20) && pos.y> (food.y-20))
  {
    len+=10;
    newFood();
  }
}
void show()
{
  noStroke();
  fill(255,255,0);
  rect(pos.x,pos.y,grid,grid);
  for(PVector p: hist)
  { 
    rect(p.x,p.y,grid,grid);
  }
} 
}
 
