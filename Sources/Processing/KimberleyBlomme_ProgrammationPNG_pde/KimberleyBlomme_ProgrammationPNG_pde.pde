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

SoundFile[] OrgansSounds;

void setup() {
  
  size(1280,720,P3D);
  colorMode(RGB, 100);
  println(MultiMarker.VERSION);
  cam=new Capture(this,1280,720);
  nya=new MultiMarker(this,width,height,"../../data/camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addARMarker(loadImage("../../Images/Markers/BIOheartMarker.jpg"),16,25,80);
  nya.addARMarker(loadImage("../../Images/Markers/HeartMarker.jpg"),16,25,80);
  nya.addARMarker(loadImage("../../Images/Markers/BIOlungsMarker.jpg"),16,25,80);
  nya.addARMarker(loadImage("../../Images/Markers/LungsMarker.png"),16,25,80);
  nya.addARMarker(loadImage("../../Images/Markers/BIObrainMarker.jpg"),16,25,80);
  nya.addARMarker(loadImage("../../Images/Markers/BrainMarker.jpg"),16,25,80);
  nya.addARMarker(loadImage("../../Images/Markers/BIOstomachMarker.jpg"),16,25,80);
  nya.addARMarker(loadImage("../../Images/Markers/StomachMarker.jpg"),16,25,80);
  cam.start();
  
  models = new PShape[9];
  
  for (int m=1; m <= 1; m++){ 
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
  /*heart = loadShape("../../Model3D/Heart.obj");
  heart.setTexture(cam);
  lungs = loadShape("../../Model3D/Lungs.obj");
  lungs.setTexture(cam);*/
}

  OrgansSounds = new SoundFile[9];

  for (int s=1; s <= 1; s++){ 
  OrgansSounds [0] = new SoundFile(this, "../../Sounds/SyntheticHeartbeat.mp3");
  //OrgansSounds[0].play();
  OrgansSounds [1] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  //OrgansSounds[1].play();
  OrgansSounds [2] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  //OrgansSounds[2].play();
  OrgansSounds [3] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  //OrgansSounds[3].play();
  OrgansSounds [4] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  //OrgansSounds[4].play();
  OrgansSounds [4] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  //OrgansSounds[4].play();
  OrgansSounds [5] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  //OrgansSounds[5].play();
  OrgansSounds [6] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  //OrgansSounds[6].play();
  OrgansSounds [7] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  //OrgansSounds[7].play();
  OrgansSounds [8] = new SoundFile(this, "../../Sounds/Heartbeat.mp3");
  //OrgansSounds[8].play();
  }
  
  
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
       
 /* 
  }*/
  for (int i = 0; i <8; i++) {
    if((!nya.isExist(i))){
    continue;}
  
    
  nya.beginTransform(i);
  //fill(0,0,255);
  //translate(0,0,20);
  //box(40);
  
    shape (models[i]);
    Organs[i] = true;
    SoundPlay();
    /*image (corrupted, 10, 10);
    image(corrupted, 20, 20, width/-3, height/3);*/
    
    shape (models[i]);
    SoundPlay();
    /*image (corrupted, 10, 10);
    image(corrupted, 20, 20, width/-3, height/3);*/
    shape (models[i]);
    
    shape (models[i]);
    
    shape (models[i]);
    
    shape (models[i]);
    
    shape (models[i]);
    
    shape (models[i]);
    
  nya.endTransform();
}

}
