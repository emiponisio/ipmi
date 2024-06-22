/*
Comision 3 
Ponisio Maria Emilia 
legajo : 90565/2
Link video explicativo :  https://youtu.be/Pj6zZtWrgW8
*/

String estado = "inicio"; //<>//
int cuentaFotograma= 0;
PImage imagen0;
int posX = 0;
int posY = 0;
int cantidad = 22;
int tamaño;


void setup () 
  {
    frameRate (30); //<>//
    size(800, 400);
    tamaño = width / cantidad; //<>//
  }

void draw ()
  {
    background(0);  //<>//
    imagen0 = loadImage("imagen1.png");
    
    anlizaEstado();  
      
  }
  
void anlizaEstado()
{
  if ( estado.equals("inicio"))
    {
      estadoInicio();
    }
    else if ( estado.equals("pantalla 1") )
     {
       estadoPantalla1();
     }
  
}
void estadoInicio()
 {
        //pantalla de inicio
        for (int x = 0; x < cantidad; x++)
          { 
            for (int y = 0; y < cantidad; y++)
              {
                float distan = dist(mouseX, mouseY, x * tamaño, y * tamaño);
                if ((x + y) % 2 == 0)
                  {
                    fill(255);
                  } 
                else 
                  {
                    float tono = dameTono(distan);
                    fill(255, 255, 255, tono);
                   }
                float tono = dameTono(distan);
                fill(255, 255, 255, tono);
                trazaElipse(x,y);          
                
              }
          }
          image(imagen0, 0, 0, 360, 400); 
 }
 void trazaElipse(int x,int y)
 {
   ellipse((x * tamaño + frameCount / 2) % width, (y * tamaño + tamaño / 2) % height, tamaño, tamaño);
 }
 
 float dameTono(float distancia)
 {
   return distancia * 255 / dist(width, height, 0, 0);
 }
 
 
 
void estadoPantalla1()
{
   // pantalla 1 
        for (int x = 0; x < cantidad; x++) 
          {
            for (int y = 0; y < cantidad; y++) 
              {
                float distan = dist(mouseX, mouseY, x * tamaño, y * tamaño);
                if ((x + y) % 2 == 0) 
                  {
                    fill(255);
                  } 
                else 
                  {
                    float tono = distan * 255 / dist(width, height, 0, 0);
                    fill(255, 255, 255, tono);
                    //float tono = distan * 255 / dist(width, height, 0, 0);
                    fill(random(0,255));
                    ellipse((x * tamaño + frameCount / 2) % width, (y * tamaño + tamaño / 2) % height, tamaño, tamaño);
                  }
              }
          image(imagen0, 0, 0, 360, 400);
          cuentaFotograma++;
          if( cuentaFotograma>= 600 ) 
            {
              estado= "inicio";
            cuentaFotograma = 0;
            }
          }
  
}
void mouseWheel(MouseEvent event)
{
  //Acá vuelvo las variables a su estado original
  estado = "inicio";
  cuentaFotograma= 0;
  posX = 0;
  posY = 0;
  cantidad = 22;
  tamaño = width / cantidad;
}

 void mousePressed () 
   { 
     if ( estado.equals("inicio") ) 
       {
         {
           estado= "pantalla 1" ; 
           cuentaFotograma = 0 ;
         }
       }
     else if (estado.equals("pantalla 1") ) 
       {
        estado= "inicio" ;
        cuentaFotograma = 0 ;
       }
  
   }
