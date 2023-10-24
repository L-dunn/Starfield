int numParticles = 50;
Particle[] particlesArr = new Particle[numParticles];

void setup()
{
  size(500, 500);
  for(int i = 0; i < particlesArr.length; i++){
    particlesArr[i] = new Particle();
  }
  particlesArr[0] = new OddballParticle();
}
void draw()
{
  background(0);
  for(int i = 0; i < particlesArr.length; i++){
    particlesArr[i].move();
    particlesArr[i].show();
  }
}
class Particle
{
  double x, y, speed, angle;
  int particleColor;
  int size = 10;
  Particle(){
    x = y = 250;
    speed = 5;
    angle = (Math.random() * 2) * (Math.PI);
    particleColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
  }
  void move(){
    x += Math.cos(angle);
    y += Math.sin(angle);
  }
  void show(){
    fill(particleColor);
    ellipse((float)x, (float)y, size, size);
  }
}

class OddballParticle extends Particle//inherits from Particle
{
  OddballParticle(){
    size = 30;
  }
  void show(){
    ellipse((float)x, (float)y, size, size);
  }
}

