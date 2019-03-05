float px, py, ang;
PShape vase, flower, table, bee;
PImage vTexture, tTexture, bTexture;

void setup() {
  size(800, 800, P3D);
  noFill();
  textSize(20);
  
  vTexture = loadImage("images\\vase.jpg");
  tTexture = loadImage("images\\table.jpg");
  bTexture = loadImage("images\\bee.png");

  vase = loadShape("models\\vase.obj");  
  vase.scale(8);
  vase.setTexture(vTexture);

  flower = loadShape("models\\flower.obj");
  flower.scale(350);

  table = loadShape("models\\table.obj");
  table.scale(3.5);
  table.setTexture(tTexture);

  
  bee = loadShape("models\\bee.obj");
  bee.scale(0.15);
  bee.setTexture(bTexture);
  
  endShape(CLOSE);

  ang=PI/3;
}

void draw() {
  background(250);  
  lights();
  lightSpecular(100, 100, 100) ;
  directionalLight(0.8, 0.8, 0.8, 0, 0, 1) ;
    
  pushMatrix();
    translate(width/2, height/2-30, 0);
    rotateX(radians(-20));
    
    // MESA
    pushMatrix();
      rotateX(radians(90));
      translate(0, 0, -315);
      pushStyle();
        specular(0, 0, 100);
        shininess(100);
      popStyle();
      shape(table);
    popMatrix();
    
    // JARRÓN
    pushMatrix();
      translate(0,45,0);
      rotateX(radians(180));
      pushStyle();
        specular(0, 0, 100);
        shininess(100);
      popStyle();
      shape(vase);
    popMatrix();
    
    // FLOR
    pushMatrix();
      rotateX(radians(180));
      rotateY(radians(160));
      translate(0, 70, 0);
      shape(flower);
    popMatrix();  
    
    // ABEJA
    pushMatrix();  
      rotateX(radians(180));
      rotateY(radians(ang));
      translate(0, 190, 0);
      shape(bee);
    popMatrix(); 
  popMatrix();
  
  fill(100,100,100);   
  text("Utilice las flechas del teclado para mover la cámara", width/5, 75);
  camera(width/2.0-px, height/2.0-py, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);

  ang+=3;
  if (ang>=360) ang=0;
  
  if (keyPressed) keyPressed();
}

void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
      case UP: py += 10; break;
      case DOWN: py -= 10; break;
      case LEFT: px -= 10; break;
      case RIGHT: px += 10; break;
    }
  }
}
