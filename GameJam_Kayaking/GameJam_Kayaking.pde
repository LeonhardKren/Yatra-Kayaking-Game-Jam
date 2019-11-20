int balls[] = new int[10]; //<>//
int balls2[]= new int[10];
float speed=5;
PImage Kayak;
PImage paddle;
int rotation=1;
void setup()
{
  size(800, 800);
  Kayak=loadImage("kayak.png");
  paddle=loadImage("Paddle.png");
  paddle.resize(400, 100);
  for (int i=0; i<10; i++)
  {
    balls[0]=0;
    balls[i]=0-500*i;
    balls2[0]=-250;
    balls2[i]=-250-500*i;
  }
}
void draw()
{
  imageMode(CENTER);
  background(0, 0, 255);
  text(speed, 10, 10);
  image(Kayak, 400, 400); 
  speed*=0.999;
  for (int i=0; i<10; i++)
  {
    fill(255, 255, 255);
    ellipse(250, balls[i], 70, 70);
    balls[i]+=speed;
    ;
    ellipse(550, balls2[i], 70, 70);
    balls2[i]+=speed;
    if (balls[i]>800)
    {
      balls[i]-=5000;
    }
    if (balls2[i]>800)
    {
      balls2[i]-=5000;
    }
  }
  fill(255, 0, 0);
  ellipse(250, 400, 70, 70);
  ellipse(550, 400, 70, 70);
  if (rotation==1)
  {
    imageMode(CENTER);
    pushMatrix();
    translate(400, 400);
    rotate(PI/4); 
    image(paddle, 0, 0);
    popMatrix();
  }
  if (rotation==0)
  {
    imageMode(CENTER);
    pushMatrix();
    translate(400, 400);
    rotate(-PI/4); 
    image(paddle, 0, 0);
    popMatrix();
  }
  if(rotation>1)
  {
   rotation=1; 
  }
  if(rotation<0)  
  {
    rotation=0;
  }
}

void keyPressed()
{
  for (int i=0; i<10; i++)
  {
    if (key=='a'||key=='A')
    {
      if (balls[i]>300
        &&balls[i]<500)
      {
        speed+=1;
      } else
      {
        speed-=0.05;
      }
      rotation-=1;
    }
    if (key=='d'||key=='D')
    {
      if (balls2[i]>300
        && balls2[i]<500)
      {
        speed+=1;
      } else
      {
        speed-=0.05;
      }
      rotation+=1;
    }
  }
}
