int rows, colums;
int scl = 20;
float[][] terraic;
float flying =0;
void setup(){
  size(1200, 1000, P3D);
  rows =  2000 / scl;
  colums = 2000 /scl;
  terraic = new float[colums][rows];   
}

void draw(){
  flying -= 0.01;
  float yoff = flying;
  for (int y=0; y < rows; y++){
    float xoff=0;
    for (int x=0; x < colums; x++){
      terraic[x][y]=map(noise(xoff,yoff), 0, 1, -50, 100);
      xoff+=0.1;
    }
    yoff+=0.1;
  }
  
  background(255);
  
  stroke(255);
  //noStroke();
  //fill(0, 119, 179);
  translate(width/2, height/2);
  rotateX(PI/3);
  fill(0, 119, 179);
  
  translate(-1800/2,-1000/2);
  for (int y=0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for (int x=0; x < colums; x++){
      //rect(x*scl, y*scl,scl,scl);
      
      vertex(x*scl, y*scl, terraic[x][y]);
      vertex(x*scl, (y+1)*scl, terraic[x][y+1]);
      
    }
    
    endShape();
  }
  
 
 
   
  
 
}
