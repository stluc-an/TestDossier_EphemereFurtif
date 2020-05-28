import processing.sound.*;
SoundFile file;


import processing.serial.*;

Serial monArduino;

void setup() {
  
  size(640, 360);
  background(255);
    
  
  file = new SoundFile(this, "testSon.mp3");
  file2 = new SoundFile(this, "TestSon2.mp3");
  file3 = new SoundFile(this, "testSon3.mp3");
  file4 = new SoundFile(this, "testSon4.mp3");
 
  
  
  printArray(Serial.list());
  monArduino = new Serial(this, Serial.list()[0], 115200); 
}

void draw() {
 
  while(monArduino.available() > 0){
    int octetLu = monArduino.read();
    if(octetLu == 0){
      println ("pas de son");
    }else if (octetLu ==1){
      println ("activer le son");
      if (!file.isPlaying());
          file.play();
     }
     
     
     
      while(monArduino.available() > 0){
    int octetLu = monArduino.read();
    if(octetLu == 0){
      println ("pas de son");
    }else if (octetLu ==1){
      println ("activer le son");
      if (!file.isPlaying());
          file2.play();
     }
     
     
     
      while(monArduino.available() > 0){
    int octetLu = monArduino.read();
    if(octetLu == 0){
      println ("pas de son");
    }else if (octetLu ==1){
      println ("activer le son");
      if (!file.isPlaying());
          file3.play();
     }
     
     
     
     
      while(monArduino.available() > 0){
    int octetLu = monArduino.read();
    if(octetLu == 0){
      println ("pas de son");
    }else if (octetLu ==1){
      println ("activer le son");
      if (!file.isPlaying());
          file4.play();
     }
  
  
  }
  
}
