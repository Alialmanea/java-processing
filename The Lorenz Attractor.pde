float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = 8.0 / 3.0;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
  size(800, 600, P3D);
  colorMode(HSB);
   
}

void draw(){

  background(0);

  float dt = 0.01;
  float dx = a * (y - x) * dt;
  float dy = (x * (b - z) - y) * dt;
  float dz = (x * y - c * z) * dt;
  x = x + dx;
  y = y + dy;
  z = z + dz;

  points.add(new PVector(x, y, z));
  
  
  translate(width/2, height/2, 0);
  
  float camX = map(mouseX, 0, width, -200, 200);
  float camY = map(mouseY, 0, height, -200, 200);
  camera(camX, camY, height / 2.0 / tan((PI * 30.0) / 180.0), 0, 0, 0, 0, 1, 0);
  
  scale(5);
  stroke(255);
  noFill();

  float hu = 0;
  beginShape();
  
  for (PVector v : points) {
    stroke(hu, 255, 255);
    vertex(v.x, v.y, v.z);
    
    hu += 0.5;
    if (hu > 255) {
      hu = 0;
    }
  }
  
  endShape();
  
  
   
  
 
}
