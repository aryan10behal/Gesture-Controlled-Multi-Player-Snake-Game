void level()
{  make();
  if(players==1)
  {
    singleplayer();
    reduce();
  }
  else if(players==2)
  { 
    multiplayer();
    reduce();
  }
}
void make()
{ clear();  
   stroke(64,64,64);
   strokeWeight(2);
  fill(178,190,181);
  rect(block.x,block.y,wid[0],lnth[0]);
  fill(153,0,153);
  rect(block1.x,block1.y,wid[1],lnth[1]);
  fill(0,0,204);
  rect(block2.x,block2.y,wid[2],lnth[2]);
}
void reduce()
{
  if((snake.pos.x>block.x && snake.pos.x<block.x+wid[0] && snake.pos.y>block.y && snake.pos.y<block.y+lnth[0])  ||   (snake.pos.x>block1.x && snake.pos.x<block1.x+wid[1] && snake.pos.y>block1.y && snake.pos.y<block1.y+lnth[1])  ||(snake.pos.x>block2.x && snake.pos.x<block2.x+wid[2] && snake.pos.y>block2.y && snake.pos.y<block2.y+lnth[2]))
  {
  snake.len=snake.len-1;
    }
  
  
  if(players==2)
  {
    
  if((snake2.pos.x>block.x && snake2.pos.x<block.x+wid[0] && snake2.pos.y>block.y && snake2.pos.y<block.y+lnth[0])  ||   (snake2.pos.x>block1.x && snake2.pos.x<block1.x+wid[1] && snake2.pos.y>block1.y && snake2.pos.y<block1.y+lnth[1])  ||(snake2.pos.x>block2.x && snake2.pos.x<block2.x+wid[2] && snake2.pos.y>block2.y && snake2.pos.y<block2.y+lnth[2]))
    {
     snake2.len=snake2.len-1;
    }
  }
}
