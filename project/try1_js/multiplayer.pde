 void multiplayer()
        {   singleplayer();
            if(check2==true)
                speed2=0.3;
         else if(check2==false)
            speed2=0.1;  
            snake2.update();
            snake2.show(); 
            snake2.eat();
            fill(255,0,255);
            textAlign(CENTER,CENTER);
            textSize(20);
            text("Snake 2: "+str((snake2.len-2)/10),920,20);
            if(((snake2.len-2)/10)>10)
            {
              clear();
              fill(255);
              textAlign(CENTER,CENTER);
              textSize(35);
              if(level==2)
              { image(img3,0,0,width,height);
                fill(255);
                textAlign(CENTER,TOP);
                text("Great Snake 2 won!!\nHope you liked the gaming experience!!!",width/2,height/2);
                textSize(20);
                textAlign(CENTER,BOTTOM);
                text("Press E to escape",width/2,height-grid);
              }
              else
              {
                fill(0,0,0);
                image(img3,0,0,width,height);
              text("Snake 2 wins the battle\n\n\nPress P for level 2\n##Beware of the boxes.\n\nPress O to  play again\nPress E to exit",width/2,height/2);
              text("Press 2 for level 2.\n\nPress E to exit",width/2,height/2);
              flag2=true;  
            }
             keyPressed();
            }
            else if(((snake.len-2)/10)>10)
            {
              clear();
              fill(255);
              textAlign(CENTER,CENTER);
              textSize(35);
              if(level==2)
              { image(img3,0,0,width,height);
                fill(0,0,0);
                textAlign(CENTER,TOP);
                text("Great Snake 1 won!!\nHope you liked the gaming experience!!!",width/2,height/2);
                textSize(20);
                textAlign(CENTER,BOTTOM);
                text("Press E to escape",width/2,height-grid);
              }
              else
              {
                image(img4,0,0,width,height);
                fill(255,0,0);
                text("Snake 1 wins the battle\n\n\nPress P for level\n ##Beware of the boxes.\n\nPress O to  play again.\nPress E to exit",width/2,height/2);   
                flag2=true;
              }
               keyPressed();
            }
        }
