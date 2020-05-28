/**
 * NyARToolkit for proce55ing/3.0.5
 * (c)2008-2017 nyatla
 * airmail(at)ebony.plala.or.jp
 * 
 * マーカファイルの変わりにPNGを使います。
 * PNGは任意解像度の正方形である必要があります。
 * PNG画像にはエッジ部分を含めてください。
 * 全ての設定ファイルとマーカファイルはスケッチディレクトリのlibraries/nyar4psg/dataにあります。
 * 
 * This sketch uses a PNG image instead of the standard patt file.
 * The PNG image must be square form that includes edge.
 * Any pattern and configuration files are found in libraries/nyar4psg/data inside your sketchbook folder. 
 */
import processing.video.*;
import jp.nyatla.nyar4psg.*;
import processing.sound.*;

Capture cam;
MultiMarker nya;

PShape[] models;
boolean [] Organs; 
//PShape lungs;

PImage corrupted;

// je suggère de le renommer "organsSounds" sans majuscule au début ;)
SoundFile[] OrgansSounds;

void setup() {
  
  size(1280,720,P3D);
  colorMode(RGB, 100);
  println(MultiMarker.VERSION);
  cam=new Capture(this,1280,720);
  
  // déclaration des marqueurs AR
  nya=new MultiMarker(this,width,height,"../../data/camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addARMarker(loadImage("../../Images/Markers/BIOheartMarker.jpg"),16,25,80);
  nya.addARMarker(loadImage("../../Images/Markers/HeartMarker.jpg"),16,25,80);
  nya.addARMarker(loadImage("../../Images/Markers/BIOlungsMarker.jpg"),16,25,80);
  nya.addARMarker(loadImage("../../Images/Markers/LungsMarker.png"),16,25,80);
  nya.addARMarker(loadImage("../../Images/Markers/BIObrainMarker.jpg"),16,25,80);
  nya.addARMarker(loadImage("../../Images/Markers/BrainMarker.jpg"),16,25,80);
  nya.addARMarker(loadImage("../../Images/Markers/BIOstomachMarker.jpg"),16,25,80);
  nya.addARMarker(loadImage("../../Images/Markers/StomachMarker.jpg"),16,25,80);
  // est-ce qu'il ne manque pas le marqueur InnerEar?
  cam.start();
  
  // tableau des modèles 3D
  models = new PShape[9];
  
  // chargement des modèles 3D
  models[0]= loadShape("../../Model3D/BIOheart.obj");
  models[0].setTexture(cam);
  models[1]= loadShape("../../Model3D/Heart.obj");
  models[1].setTexture(cam);
  models[2]= loadShape("../../Model3D/BIOLungs.obj");
  models[2].setTexture(cam);
  models[3]= loadShape("../../Model3D/Lungs.obj");
  models[3].setTexture(cam);
  models[4]= loadShape("../../Model3D/BIObrain.obj");
  models[4].setTexture(cam);
  models[5]= loadShape("../../Model3D/Brain.obj");
  models[5].setTexture(cam);
  models[6]= loadShape("../../Model3D/BIOstomach.obj");
  models[6].setTexture(cam);
  models[7]= loadShape("../../Model3D/Stomach.obj");
  models[7].setTexture(cam);
  models[8]= loadShape("../../Model3D/InnerHear.obj");
  models[8].setTexture(cam);

  // tableau des sons
  OrgansSounds = new SoundFile[9];

  // chargement des sons
  OrgansSounds [0] = new SoundFile(this, "../../Sounds/SyntheticHeartbeat.mp3");
  OrgansSounds [1] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  OrgansSounds [2] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  OrgansSounds [3] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  OrgansSounds [4] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  OrgansSounds [4] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  OrgansSounds [5] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  OrgansSounds [6] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  OrgansSounds [7] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  OrgansSounds [8] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  
  corrupted = loadImage ("../../Images/Corrupted.png");
}


void SoundPlay(){
 
 Organs = new boolean[9];
  
 for (int i = 0; i <8; i++) {
  if(Organs[i]==true){
    OrgansSounds[i].play();}
  }
}



void draw()
{
  if (cam.available() !=true) {
      return;
  }
  cam.read();
  nya.detect(cam);
  background(0);
  nya.drawBackground(cam);//frustumを考慮した背景描画


  for (int i = 0; i <8; i++) {
    
    // est-ce que le marqueur i est détecté?
    if(nya.isExist(i)){
      nya.beginTransform(i);
  
        // on affiche le modèle 3D
        shape (models[i]);
        
        // on joue le son
        OrgansSounds[i].play();
            
      nya.endTransform();
    }
    
    // sinon, on ne voit pas le marquer
    else{
      OrgansSounds[i].stop();
    }
  
    
  
}

}
