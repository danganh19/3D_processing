PShape model;

float chx = PI/2;
float chy = PI/2;

float zoom = 700;

float x;
float y;

void setup() {
  size(1280, 720, P3D);
  model = loadShape("museum.obj");
}

void draw() {
  background(0);

  ambientLight(100, 100, 100);
  lightFalloff(0.25, 0.001, 0.0);
  
  pointLight(200, 200, 200, 
    zoom * cos(chx) * sin(chy), 
    zoom * cos(chy), 
    zoom * sin(chx) * sin(chy)
    );
  
  //pointLight(15, 58, 250,0,0,0);


  camera(zoom * cos(chx) * sin(chy), 
    zoom * cos(chy), 
    zoom * sin(chx) * sin(chy), 
    0, 0, 0, 
    0, 1, 0);
  
  fill(75);
  box(900, 1, 900);

  //fill(#FF3B3B);
  //box(2000, 2, 2);
  //box(2, 2000, 2);
  //box(2, 2, 2000);

  shape(model);

  //translate(500,500, 0);


  if (mousePressed == true) {
    float
      dx = mouseX - x;
    float dy = mouseY - y;

    chx += (dx / width);
    chy += (dy / height);
  }

  x = mouseX;
  y = mouseY;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom += 20 * e;
}
