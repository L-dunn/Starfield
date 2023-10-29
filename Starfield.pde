int numParticles = (int)(Math.random() * 21) + 10;
Particle[] particlesArr = new Particle[numParticles];
float rot = 0;

void setup()
{
  background(0);
  size(800, 800);
  frameRate(100);
  for(int i = 0; i < particlesArr.length; i++){
    particlesArr[i] = new Particle();
  }
  for(int j = 0; j < (int)(Math.random() * 21) + 2; j++){
    if(j % 2 == 0){
      particlesArr[j] = new OddballParticle();
    }
  }
}
void draw()
{
  fill(0, 15);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  for(int i = 0; i < particlesArr.length; i++){
    rotate(rot);
    rot += 0.1;
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
    x = 0;
    y = 0;
    speed = (Math.random() * 2) + 1.5;
    angle = (Math.random() * 2) * (Math.PI);
    particleColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
  }
  void move(){
    x += Math.cos(angle) * speed;
    y += Math.sin(angle) * speed;
  }
  void show(){
    fill(particleColor);
    noStroke();
    ellipse((float)x, (float)y, size, size);
  }
}

class OddballParticle extends Particle//inherits from Particle
{
  OddballParticle(){
    size = (int)(Math.random() * 21) + 20;
    speed = speed - 0.5;
  }
}

void mousePressed(){
  rot = 0;
  for(int i = 0; i < particlesArr.length; i++){
    particlesArr[i] = new Particle();
  }
  for(int j = 0; j < (int)(Math.random() * 21) + 2; j++){
    if(j % 2 == 0){
      particlesArr[j] = new OddballParticle();
    }
  }
  redraw();
}
