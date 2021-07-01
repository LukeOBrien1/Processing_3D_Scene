
import peasy.*;

PeasyCam cam;  //setting up peasycam

void setup() {
  size(900,600,P3D);
  cam = new PeasyCam(this,450, 0,0, 500);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(800);
    
  loop();
  frameRate(60);  //setting the framerate
}

int i = 0;
float[][] scalingMatrix = {{1.0,0.0,0.0,0.0},{0.0,0.9,0.0,0.0},{0.0,0.0,1.0,0.0},{0.0,0.0,0.0,1.0}}; // scale by 0.9  
float[][] scalingMatrix2 = {{0.9,0.0,0.0,0.0},{0.0,1.0,0.0,0.0},{0.0,0.0,1.0,0.0},{0.0,0.0,0.0,1.0}}; // scale by 0.9

float[][] translateMatrix = {{1.0,0.0,0.0,0.0},{0.0,1.0,0.0,0.0},{0.0,0.0,1.0,0.0},{6,0,0,1.0}}; // translate the rocket by distance of 2
float[][] translateCarMatrix = {{1.0,0.0,0.0,0.0},{0.0,1.0,0.0,0.0},{0.0,0.0,1.0,0.0},{-4,0,0,1.0}}; // translate the car by distance of 2
float[][] translateInMatrix = {{1.0,0.0,0.0,0.0},{0.0,1.0,0.0,0.0},{0.0,0.0,1.0,0.0},{-170,170,-20,1.0}}; //bring a shape to the origin
float[][] translateOutMatrix = {{1.0,0.0,0.0,0.0},{0.0,1.0,0.0,0.0},{0.0,0.0,1.0,0.0},{170,-170,20,1.0}}; // push the shape back out
float theta = radians(10); // convert degrees to radians
  
float[][] rotXMatrix = {{1.0,0.0,0.0,0.0},{0.0,cos(theta),sin(theta),0.0},{0.0,-sin(theta),cos(theta),0.0},{0.0,0.0,0.0,1.0}}; // roatate around x axis
float[][] rotYMatrix = {{cos(theta),0.0,-sin(theta),0.0,0.0},{0.0,1.0,0.0,0.0},{sin(theta),0.0,cos(theta),0.0},{0.0,0.0,0.0,1.0}}; // roatate around y axis
float[][] rotZmatrix= {{cos(theta),sin(theta),0.0,0.0},{-sin(theta),cos(theta),0.0,0.0},{0.0,0.0,1.0,0.0},{0.0,0.0,0.0,1.0}}; // roatate around z axis

float[] transform_point(float[][] m, float[] p)
{
   float[] p_new = {0.0,0.0,0.0,0.0}; // handle 4 elements as its 3D calc
   
   p_new[0] = m[0][0] * p[0] + m[1][0] * p[1] + m[2][0] * p[2] + m[3][0] * p[3];
   p_new[1] = m[0][1] * p[0] + m[1][1] * p[1] + m[2][1] * p[2] + m[3][1] * p[3];
   p_new[2] = m[0][2] * p[0] + m[1][2] * p[1] + m[2][2] * p[2] + m[3][2] * p[3]; 
   p_new[3] = m[0][3] * p[0] + m[1][3] * p[1] + m[2][3] * p[2] + m[3][3] * p[3]; 
  
   return p_new;
}

// rocket points
float[] p1 = {160,-30,-25,1};
float[] p2 = {175,-30,-25,1};
float[] p3 = {175,-45,-25,1};
float[] p4 = {160,-45,-25,1};
float[] p5 = {160,-30,-10,1};
float[] p6 = {175,-30,-10,1};
float[] p7 = {175,-45,-10,1};
float[] p8 = {160,-45,-10,1};

float rocketTranslate[][] = translateMatrix;

//car points
float[] c1 = {700,35,-80,1};
float[] c2 = {500,35,-80,1};
float[] c3 = {500,0,-80,1};
float[] c4 = {700,0,-80,1};
float[] c5 = {700,35,-80,1};
float[] c6 = {500,35,-80,1};
float[] c7 = {500,0,-80,1};
float[] c8 = {700,0,-80,1};
float[] c9 = {540,0,-80,1};
float[] c10 = {670,0,-80,1};
float[] c11 = {560,-25,-80,1};
float[] c12 = {660,-25,-80,1};
float[] t1 = {540,20,-79,1};
float[] t2 = {520,20,-79,1};
float[] t3 = {520,40,-79,1};
float[] t4 = {540,40,-79,1};
float[] t5 = {540,20,-182,1};
float[] t6 = {520,20,-182,1};
float[] t7 = {520,40,-182,1};
float[] t8 = {540,40,-182,1};
float[] w1 = {650,20,-79,1};
float[] w2 = {670,20,-79,1};
float[] w3 = {670,40,-79,1};
float[] w4 = {650,40,-79,1};
float[] w5 = {650,20,-182,1};
float[] w6 = {670,20,-182,1};
float[] w7 = {670,40,-182,1};
float[] w8 = {650,40,-182,1};

float[] d1 = {700,35,-180,1};
float[] d2 = {500,35,-180,1};
float[] d3 = {500,0,-180,1};
float[] d4 = {700,0,-180,1};
float[] d5 = {700,35,-180,1};
float[] d6 = {500,35,-180,1};
float[] d7 = {500,0,-180,1};
float[] d8 = {700,0,-180,1};
float[] d9 = {540,0,-180,1};
float[] d10 = {670,0,-180,1};
float[] d11 = {560,-25,-180,1};
float[] d12 = {660,-25,-180,1};

float carTranslate[][] = translateCarMatrix;
float carScale[][] = scalingMatrix;

//sun points
float[] s1 = {150,-150,0,1.0};
float[] s2 = {190,-150,0,1.0};
float[] s3 = {190,-190,0,1.0};
float[] s4 = {150,-190,0,1.0};
float[] s5 = {150,-150,40,1.0};
float[] s6 = {190,-150,40,1.0};
float[] s7 = {190,-190,40,1.0};
float[] s8 = {150,-190,40,1.0};

float sunRotate[][];

void draw() {
  
  background(21,80,100);
  lights();
  strokeWeight(5);
  drawAxes();
  stroke(0, 0, 0);
  strokeWeight(3);
  fill(180,200,220);
  
  ground();    // draws the ground
  gunMan();    //draws the gunman
  victim();    //draws the victim
  sun();      //draws the sun
  
  sunRotate=translateInMatrix;    //used to make the sun rotate arounds its own center
  transformSun();
  sunRotate=rotXMatrix;
  transformSun();
  sunRotate=translateOutMatrix;
  transformSun();
  stroke(0);
  
  rocket();  //draws the rocket
  transformRocket();  //moves the rocket
  
  car();
  if(c2[0] > 50)
  {
    transformCar();  //moved the car
  }
  else
  {  
    carCrash();  // crushes the car
  }
}

void drawAxes() {  //shows the axis
 stroke(255, 0, 0);
  line(-50, 0, 0, 50, 0, 0);
  
  stroke(0, 255, 0);
  line(0, -50, 0, 0, 50, 0);
  
  stroke(0, 0, 255);
  line(0, 0, -50, 0, 0, 50);
  
}

void ground()  //creates ground
{
  pushMatrix();
  fill(180,200,220);
  translate(450, 50, -60);
  box(900, 15, 300);
  popMatrix();
}

void gunMan()//creates gunman
{
  torso(100, -10, 0);
  leg(100,30,10);
  leg(100,30,-10);
  arm(100,-10,19);
  gunArm(110,-20,-19);
  head(100, -40, 0);
  bazooka(115,-37,-17);
}

void victim()//creates victim
{
  torso(620, -10, -10);
  leg(620,30,0);
  leg(620,30,-20);
  arm(620,-10,9);
  arm(620,-10,-29);
  head(620, -40, -10);

}

void leg(int x, int y, int z)  //creates legs
{
  pushMatrix();  //used to limit scope
  fill(60,120,220);
  translate(x, y, z);  
  box(7, 25, 7);
  popMatrix(); 
}

void arm(int x, int y, int z) //creates the arms
{
  fill(255,220,220);
    
  pushMatrix();
  translate(x, y, z);
  box(7, 30, 7);
  popMatrix(); 
}

void gunArm(int x, int y, int z)  //the gun arm
{
  pushMatrix();
  fill(255,220,220);
  translate(x, y, z);
  box(20, 7, 7);
  popMatrix(); 
     
  pushMatrix();
  translate((x+13), y-3, z);
  box(7, 13, 7);
  popMatrix();
}

void torso(int x, int y, int z)
{ 
  pushMatrix();
  fill(210,40,40);
  translate(x, y, z);
  box(20, 40, 30);
  popMatrix();
  
  pushMatrix();
  fill(60,120,220);
  translate(x, (y+25), z);
  box(20, 10, 30);
  popMatrix(); 
}

void head(int x, int y, int z)
{
  pushMatrix();
  noStroke();
  fill(255,220,220);
  translate(x, y, z);
  sphere(10);
  stroke(1);
  popMatrix(); 
}


void bazooka(int x, int y, int z)
{
  pushMatrix();
  fill(60,90,90);
  translate(x, y, z);
  box(70, 15, 15);
  popMatrix(); 
}

void rocket()  //draws the lines of the object
{
  line(p1[0],p1[1],p1[2], p2[0],p2[1],p2[2]); 
  line(p3[0],p3[1],p3[2], p2[0],p2[1],p2[2]); 
  line(p3[0],p3[1],p3[2], p4[0],p4[1],p4[2]); 
  line(p1[0],p1[1],p1[2], p4[0],p4[1],p4[2]); 
  line(p5[0],p5[1],p5[2], p6[0],p6[1],p6[2]); 
  line(p6[0],p6[1],p6[2], p7[0],p7[1],p7[2]); 
  line(p7[0],p7[1],p7[2], p8[0],p8[1],p8[2]); 
  line(p5[0],p5[1],p5[2], p8[0],p8[1],p8[2]); 
  line(p1[0],p1[1],p1[2], p5[0],p5[1],p5[2]); 
  line(p6[0],p6[1],p6[2], p2[0],p2[1],p2[2]); 
  line(p3[0],p3[1],p3[2], p7[0],p7[1],p7[2]); 
  line(p8[0],p8[1],p8[2], p4[0],p4[1],p4[2]); 
}

void transformRocket()
{
  p1 = transform_point(rocketTranslate, p1);
  p2 = transform_point(rocketTranslate, p2);
  p3 = transform_point(rocketTranslate, p3);
  p4 = transform_point(rocketTranslate, p4);
  p5 = transform_point(rocketTranslate, p5);
  p6 = transform_point(rocketTranslate, p6);
  p7 = transform_point(rocketTranslate, p7);
  p8 = transform_point(rocketTranslate, p8);

  if(p1[0] >= 620)
  {
     p1[0] = 175;
     p2[0] = 160;
     p3[0] = 160;
     p4[0] = 175;
     p5[0] = 175;
     p6[0] = 160;
     p7[0] = 160;
     p8[0] = 175;
  }
}

void car()//draws the lines of the object
{
  stroke(255, 0, 0);
  //front
  line(c1[0],c1[1],c1[2], c2[0],c2[1],c2[2]); 
  line(c3[0],c3[1],c3[2], c2[0],c2[1],c2[2]); 
  line(c3[0],c3[1],c3[2], c4[0],c4[1],c4[2]); 
  line(c1[0],c1[1],c1[2], c4[0],c4[1],c4[2]); 
  line(c5[0],c5[1],c5[2], c6[0],c6[1],c6[2]); 
  line(c6[0],c6[1],c6[2], c7[0],c7[1],c7[2]); 
  line(c7[0],c7[1],c7[2], c8[0],c8[1],c8[2]); 
  line(c5[0],c5[1],c5[2], c8[0],c8[1],c8[2]); 
  line(c1[0],c1[1],c1[2], c5[0],c5[1],c5[2]); 
  line(c6[0],c6[1],c6[2], c2[0],c2[1],c2[2]); 
  line(c3[0],c3[1],c3[2], c7[0],c7[1],c7[2]); 
  line(c8[0],c8[1],c8[2], c4[0],c4[1],c4[2]); 
  line(c9[0],c9[1],c9[2], c11[0],c11[1],c11[2]); 
  line(c10[0],c10[1],c10[2], c12[0],c12[1],c12[2]); 
  line(c11[0],c11[1],c11[2], c12[0],c12[1],c12[2]);  

  //back
  line(d1[0],d1[1],d1[2], d2[0],d2[1],d2[2]); 
  line(d3[0],d3[1],d3[2], d2[0],d2[1],d2[2]); 
  line(d3[0],d3[1],d3[2], d4[0],d4[1],d4[2]); 
  line(d1[0],d1[1],d1[2], d4[0],d4[1],d4[2]); 
  line(d5[0],d5[1],d5[2], d6[0],d6[1],d6[2]); 
  line(d6[0],d6[1],d6[2], d7[0],d7[1],d7[2]); 
  line(d7[0],d7[1],d7[2], d8[0],d8[1],d8[2]); 
  line(d5[0],d5[1],d5[2], d8[0],d8[1],d8[2]); 
  line(d1[0],d1[1],d1[2], d5[0],d5[1],d5[2]); 
  line(d6[0],d6[1],d6[2], d2[0],d2[1],d2[2]); 
  line(d3[0],d3[1],d3[2], d7[0],d7[1],d7[2]); 
  line(d8[0],d8[1],d8[2], d4[0],d4[1],d4[2]); 
  line(d9[0],d9[1],d9[2], d11[0],d11[1],d11[2]); 
  line(d10[0],d10[1],d10[2], d12[0],d12[1],d12[2]); 
  line(d11[0],d11[1],d11[2], d12[0],d12[1],d12[2]); 
  
  //connecting lines
  line(d1[0],d1[1],d1[2], c1[0],c1[1],c1[2]);
  line(d2[0],d2[1],d2[2], c2[0],c2[1],c2[2]);
  line(d3[0],d3[1],d3[2], c3[0],c3[1],c3[2]);
  line(d4[0],d4[1],d4[2], c4[0],c4[1],c4[2]);
  line(d5[0],d5[1],d5[2], c5[0],c5[1],c5[2]);
  line(d6[0],d6[1],d6[2], c6[0],c6[1],c6[2]);
  line(d7[0],d7[1],d7[2], c7[0],c7[1],c7[2]);
  line(d8[0],d8[1],d8[2], c8[0],c8[1],c8[2]);
  line(d9[0],d9[1],d9[2], c9[0],c9[1],c9[2]); 
  line(d10[0],d10[1],d10[2], c10[0],c10[1],c10[2]); 
  line(d11[0],d11[1],d11[2], c11[0],c11[1],c11[2]); 
  line(d12[0],d12[1],d12[2], c12[0],c12[1],c12[2]); 
  
  //tires
  stroke(0);
  line(t1[0],t1[1],t1[2], t2[0],t2[1],t2[2]); 
  line(t3[0],t3[1],t3[2], t2[0],t2[1],t2[2]); 
  line(t3[0],t3[1],t3[2], t4[0],t4[1],t4[2]); 
  line(t1[0],t1[1],t1[2], t4[0],t4[1],t4[2]);
  line(t5[0],t5[1],t5[2], t6[0],t6[1],t6[2]); 
  line(t6[0],t6[1],t6[2], t7[0],t7[1],t7[2]); 
  line(t7[0],t7[1],t7[2], t8[0],t8[1],t8[2]); 
  line(t8[0],t8[1],t8[2], t5[0],t5[1],t5[2]);
  line(w1[0],w1[1],w1[2], w2[0],w2[1],w2[2]); 
  line(w3[0],w3[1],w3[2], w2[0],w2[1],w2[2]); 
  line(w3[0],w3[1],w3[2], w4[0],w4[1],w4[2]); 
  line(w1[0],w1[1],w1[2], w4[0],w4[1],w4[2]); 
  line(w5[0],w5[1],w5[2], w6[0],w6[1],w6[2]); 
  line(w6[0],w6[1],w6[2], w7[0],w7[1],w7[2]); 
  line(w7[0],w7[1],w7[2], w8[0],w8[1],w8[2]); 
  line(w8[0],w8[1],w8[2], w5[0],w5[1],w5[2]);
}

void carCrash()
{
  i++;
  c1 = transform_point(carScale, c1);
  c2 = transform_point(carScale, c2);
  c3 = transform_point(carScale, c3);
  c4 = transform_point(carScale, c4);
  c5 = transform_point(carScale, c5);
  c6 = transform_point(carScale, c6);
  c7 = transform_point(carScale, c7);
  c8 = transform_point(carScale, c8);
  c9 = transform_point(carScale, c9);
  c10 = transform_point(carScale, c10);
  c11 = transform_point(carScale, c11);
  c12 = transform_point(carScale, c12);
  
  d1 = transform_point(carScale, d1);
  d2 = transform_point(carScale, d2);
  d3 = transform_point(carScale, d3);
  d4 = transform_point(carScale, d4);
  d5 = transform_point(carScale, d5);
  d6 = transform_point(carScale, d6);
  d7 = transform_point(carScale, d7);
  d8 = transform_point(carScale, d8);
  d9 = transform_point(carScale, d9);
  d10 = transform_point(carScale, d10);
  d11 = transform_point(carScale, d11);
  d12 = transform_point(carScale, d12);
  
  w1 = transform_point(carScale, w1);
  w2 = transform_point(carScale, w2);
  w3 = transform_point(carScale, w3);
  w4 = transform_point(carScale, w4);
  w5 = transform_point(carScale, w5);
  w6 = transform_point(carScale, w6);
  w7 = transform_point(carScale, w7);
  w8 = transform_point(carScale, w8);
  
  t1 = transform_point(carScale, t1);
  t2 = transform_point(carScale, t2);
  t3 = transform_point(carScale, t3);
  t4 = transform_point(carScale, t4);
  t5 = transform_point(carScale, t5);
  t6 = transform_point(carScale, t6);
  t7 = transform_point(carScale, t7);
  t8 = transform_point(carScale, t8);
  
  if(i >= 100)
  {
    carScale = scalingMatrix2;
  }
}

void transformCar()
{
  c1 = transform_point(carTranslate, c1);
  c2 = transform_point(carTranslate, c2);
  c3 = transform_point(carTranslate, c3);
  c4 = transform_point(carTranslate, c4);
  c5 = transform_point(carTranslate, c5);
  c6 = transform_point(carTranslate, c6);
  c7 = transform_point(carTranslate, c7);
  c8 = transform_point(carTranslate, c8);
  c9 = transform_point(carTranslate, c9);
  c10 = transform_point(carTranslate, c10);
  c11 = transform_point(carTranslate, c11);
  c12 = transform_point(carTranslate, c12);
  
  d1 = transform_point(carTranslate, d1);
  d2 = transform_point(carTranslate, d2);
  d3 = transform_point(carTranslate, d3);
  d4 = transform_point(carTranslate, d4);
  d5 = transform_point(carTranslate, d5);
  d6 = transform_point(carTranslate, d6);
  d7 = transform_point(carTranslate, d7);
  d8 = transform_point(carTranslate, d8);
  d9 = transform_point(carTranslate, d9);
  d10 = transform_point(carTranslate, d10);
  d11 = transform_point(carTranslate, d11);
  d12 = transform_point(carTranslate, d12);
  
  w1 = transform_point(carTranslate, w1);
  w2 = transform_point(carTranslate, w2);
  w3 = transform_point(carTranslate, w3);
  w4 = transform_point(carTranslate, w4);
  w5 = transform_point(carTranslate, w5);
  w6 = transform_point(carTranslate, w6);
  w7 = transform_point(carTranslate, w7);
  w8 = transform_point(carTranslate, w8);
  
  t1 = transform_point(carTranslate, t1);
  t2 = transform_point(carTranslate, t2);
  t3 = transform_point(carTranslate, t3);
  t4 = transform_point(carTranslate, t4);
  t5 = transform_point(carTranslate, t5);
  t6 = transform_point(carTranslate, t6);
  t7 = transform_point(carTranslate, t7);
  t8 = transform_point(carTranslate, t8);
}

void sun() //draws the lines of the object
{
    stroke(255, 255,0) ; //yellow
  line(s1[0],s1[1],s1[2], s2[0],s2[1],s2[2]); // s1 to s2
  line(s2[0],s2[1],s2[2], s3[0],s3[1],s3[2]); //s2 to s3
  line(s3[0],s3[1],s3[2], s4[0],s4[1],s4[2]);//s3 to s4
  line(s4[0],s4[1],s4[2], s1[0],s1[1],s1[2]);//s4 to s1
  
  line(s5[0],s5[1],s5[2], s6[0],s6[1],s6[2]);//s5 to s6
  line(s6[0],s6[1],s6[2], s7[0],s7[1],s7[2]); //s6 to s7
  line(s7[0],s7[1],s7[2], s8[0],s8[1],s8[2]);//s7 to s8
  line(s8[0],s8[1],s8[2], s5[0],s5[1],s5[2]);//s8 to s5
  
  line(s2[0],s2[1],s2[2], s6[0],s6[1],s6[2]);//s2 to s6
  line(s3[0],s3[1],s3[2], s7[0],s7[1],s7[2]); //s3 to s7
  
  line(s1[0],s1[1],s1[2], s5[0],s5[1],s5[2]); // s1 to s5
  line(s4[0],s4[1],s4[2], s8[0],s8[1],s8[2]);//s4 to s8
}

void transformSun()
{
  s1 = transform_point(sunRotate, s1);
  s2 = transform_point(sunRotate, s2);
  s3 = transform_point(sunRotate, s3);
  s4 = transform_point(sunRotate, s4);
  s5 = transform_point(sunRotate, s5);
  s6 = transform_point(sunRotate, s6);
  s7 = transform_point(sunRotate, s7);
  s8 = transform_point(sunRotate, s8);

}