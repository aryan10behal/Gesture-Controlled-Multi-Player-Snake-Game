void singleplayer()     
    {  
        snake.update();
        snake.show();
        snake.eat();
        if(check==true)
        speed=0.3;
         else if(check==false)
            speed=0.1;
        fill(255,0,0);
        stroke(96,96,96);
        rect(food.x,food.y,grid,grid);
        fill(255,0,255);
        textAlign(CENTER,CENTER);
        textSize(20);
        text("Snake 1: "+str((snake.len-2)/10),60,20);
        if(((snake.len-2)/10)>10)
        { clear();
              fill(0,0,0);
              textAlign(CENTER,CENTER);
              textSize(45);
              if(level==2)
              { image(img3,0,0,width,height);
                fill(0,0,0);
                textAlign(CENTER,TOP);
                text("Great you won!!\nHope you liked the gaming experience!!!",width/2,height/2);
                textSize(20);
                textAlign(CENTER,BOTTOM);
                text("Press E to escape",width/2,height-grid);
              }
              else
              { textSize(35);
              fill(255,0,0);
              image(img4,0,0,width,height);
              text("Congratulations on clearing level 1!!  \n\nPress P to proceed to level 2\n(##But beware of the blocks).\n\nPress E to exit",width/2,height/2);   
              }
              keyPressed();
          }
        
    }
