PImage imagen1;
PImage imagen2;
PImage imagen3;
int pantallaActual = 1;
String text1Parte1 = "Sala de pulso es una";
String text1Parte2 = "instalación de Rafael Lozano-Hemmer";
String text2 = " En ella, se exploran conceptos de pulso, ritmo y conexión humana.";
String text3 = "Lo que nos mantiene vivos es algo que se autorregula ";
float xPosTextoP1Parte1 = 0;
float xPosTextoP1Parte2 = 0;
float xPosTextoP2 = 100;
float yPosTextoP3 = 10;
float xPosTextoP3 = 10;
PFont miFuente;

void setup() {
  size(640, 480);
  imagen1 = loadImage("imagen1.jpg");
  imagen2 = loadImage("imagen2.jpg");
  imagen3 = loadImage("imagen3.jpg");
  miFuente = createFont("HussarBoldWebEdition-xq5O.otf", 24); // Cambia "nombre_de_tu_fuente.ttf" al nombre de tu archivo de fuente
}

void draw() {
  textSize(20);
  if (pantallaActual == 1) {
    cargoImagenYAnimoTexto(1);
  } else if  (pantallaActual == 2) {
    cargoImagenYAnimoTexto(2);
  } else if  (pantallaActual == 3) {
    cargoImagenYAnimoTexto(3);
  } else if (pantallaActual == 4) {
    fill(0);
    rect(width/2, height/2, 50, 30);
    fill(255);
    textSize(12);
    text("Reiniciar", ((width/2)+4), (height/2)+15);
  }
}

void cargoImagenYAnimoTexto(int pantallaNro) {
  if (pantallaNro == 1) {
    xPosTextoP1Parte1 = xPosTextoP1Parte1 + 1.5;
    xPosTextoP1Parte2 = xPosTextoP1Parte2 + 1.5;
    background(255);
    image(imagen1, 0, 0);
    fill(255);
    textFont(miFuente); // Cambiar la fuente aquí
    text(text1Parte1, xPosTextoP1Parte1, 100);
    text(text1Parte2, xPosTextoP1Parte2, 130);
    if (xPosTextoP1Parte2 >= 550) {
      pantallaActual = pantallaActual + 1;
    } 
    textFont(createFont("Arial", 20));
  } else if (pantallaNro == 2) {
    xPosTextoP2 = xPosTextoP2 - 1;
    background(255);
    image(imagen2, 0, 0);
    fill(255);
    text(text2, xPosTextoP2, 400);
    if (xPosTextoP2 < 3) {
      pantallaActual = pantallaActual + 1;
    }
  } else if (pantallaNro == 3) {
    yPosTextoP3 = yPosTextoP3 + 2;
    background(255);
    image(imagen3, 0, 0);
    fill(255);
    text(text3, xPosTextoP3, yPosTextoP3);
    if (yPosTextoP3 > 400) {
      pantallaActual = 4;
    }
  }
}

void mousePressed() {
  if (mouseX >= 320 && mouseX <= 370 && mouseY >= 240 && mouseY <= 270) {
    pantallaActual = 1;
    xPosTextoP1Parte1 = 0;
    xPosTextoP1Parte2 = 0;
    xPosTextoP2 = 500;
    yPosTextoP3 = 10;
  }
}
