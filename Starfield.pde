int numParticles = (int)(Math.random() * 51) + 50;
Particle[] particlesArr = new Particle[numParticles];
float rot = 0;

void setup()
{
  size(500, 500);
  frameRate(60);
  for(int i = 0; i < particlesArr.length; i++){
    particlesArr[i] = new Particle();
  }
  for(int j = 0; j < (int)(Math.random() * 21) + 2; j++){
    if(j % 2 == 0){
      particlesArr[j] = new OddballParticle();
    }
  }
  //translate(mouseX, mouseY);
}
void draw()
{
  fill(0, 15);
  rect(0, 0, 500, 500);
  translate(mouseX, mouseY);
  for(int i = 0; i < particlesArr.length; i++){
    rotate(rot);
    rot += 0.01;
    particlesArr[i].move();
    particlesArr[i].show();
  }
}
class Particle
{
  double x, y, speed, angle;
  int particleColor;
  int size = 5;
  Particle(){
    x = mouseX;
    y = mouseY;
    speed = (Math.random() * 2) + 1;
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
  //translate(mouseX, mouseY);
  redraw();
}
