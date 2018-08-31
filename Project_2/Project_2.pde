import processing.sound.*;
SoundFile file;
//datatypes
float Xs [] = new float [100];
float Ys [] = new float [100];
float speed[] = new float [100];
PImage snowy;
PImage Flakes;
void setup()
{
  //snow background
  snowy = loadImage ("snow.jpg");
  snowy.resize(800, 800);
  //song
  file = new SoundFile(this, "trap.mp3");
  file.play();
  size (800, 800);
  for (int i=0; i<100; i++)
  {
    Xs[i] = random(0, 800);
    Ys[i] = random(0, 800);
    //speed of snowflakes
    speed[i]=random(2, 5);
  }
  //snowflakes
  Flakes = loadImage ("snowflake.png");
  Flakes.resize(50, 50);
}

void draw()
{
  background (snowy);
  for (int i=0; i<100; i++)
  {
    //speed and position of snowflakes
    image (Flakes, Xs[i], Ys[i]);
    Ys[i] = Ys[i] + 2;
    if (key ==CODED)
    {
      if (keyCode == RIGHT)
      {
        Xs[i] = Xs[i] +speed[i];
      }
      if (keyCode == LEFT)
      {
        Xs[i] = Xs[i] - speed[i]*3;
      }
    }

    //snowflakes repeating
    if (Ys[i] > height)
    {
      Ys[i] = 0;
      Xs[i] = random(width);
    }
  }
}
