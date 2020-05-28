import processing.sound.*;
import processing.serial.*;

Serial monArduino;

// déclarer le tableau de sons
SoundFile[] files;

// on le déclare de façon globale pour pouvoir l'utiliser aussi avec le clavier
int octetLu;

// numéro du son en cours de lecture. -1 si pas de son lu.
int sonEnCours = -1;

void setup() {
  size(640, 360);
  background(255);
    
  // on initialise le tableau
  files = new SoundFile[4];
  
  // on remplit le tableau
  file[0] = new SoundFile(this,"testSon0.mp3");
  file[1] = new SoundFile(this,"testSon1.mp3");
  file[2] = new SoundFile(this,"testSon2.mp3");
  file[3] = new SoundFile(this,"testSon3.mp3");

  printArray(Serial.list());
  monArduino = new Serial(this, Serial.list()[0], 115200); 
}

void draw() {
  
  while(monArduino.available() > 0){
    octetLu = monArduino.read();
    
    // s'il y a un son en cours de lecture (soit une valeur qui n'est pas -1)
    if(sonEnCours > -1){
      // si le son en cours n'est plus en train d'être lu
      if(!files[sonEnCours].isPlaying()){
        // alors on remet sonEnCours à -1
        sonEnCours = -1;
      }
    }
    
    // si on a reçu une valeur d'un capteur ET qu'il n'y a pas d'autre son en cours
    if (octetLu > -1 && sonEnCours == -1){
      // on lit le son 
      files[octetLu].play();
      // et on enregistre dans sonEnCours le numéro du son qu'on vient de déclencher
      sonEnCours = octetLu;
    }
  }
  
}

// si on appuie sur une touche (n'utilise que 0 1 2 3 sinon ça sera le boxon)
void keyPressed() {
  // on convertit le code de touche qui ira de 48 à 51 en une valeur entre 0 et 3, et on l'assigne à octetLu, comme pour les capteurs.
  octetLu = int(key)-48;
  println("On a appuyé sur la touche " + octetLu);
}
