PImage img0;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;

//Music!
import ddf.minim.*;
Minim minim;
AudioPlayer bgm;
AudioPlayer startSE;
AudioPlayer EndingBGM;

void setup(){
  size(1000, 1000, P3D);
  img0 = loadImage("Mendako64.png");
  img1 = loadImage("Naruto32.png");
  img2 = loadImage("Kani64.png");
  img3 = loadImage("NikoNikoSun128.png");
  img4 = loadImage("TitleScreen500.png");
  img5 = loadImage("Control500.png");
  img6 = loadImage("END500.png");
  //Music!
  minim = new Minim(this);
  bgm = minim.loadFile("PowderSnow.mp3");
  bgm.setGain(-30);
  startSE = minim.loadFile("se_click_1.mp3"); 
  EndingBGM = minim.loadFile("EndingBGM.mp3");
  EndingBGM.setGain(-30);
}

int TitleFlag  = 1;
int GameFlag   = 0;
int ClearFlag  = 0;
int LoseFlag   = 0;
int NarutoFlag = 0;

int KaniCount0 = 0;
int KaniCount1 = 0;
int KaniCount2 = 0;
int KaniCount3 = 0;
int KaniCount4 = 0;
int KaniCount5 = 0;
int KaniCount6 = 0;
int KaniCount7 = 0;

int KaniCountSum = 0;

int MendakoX = -32;
int MendakoY = 300;

int NarutoX = 0;
int NarutoY = 0;

int KaniLine0 = 5;
int KaniLine1 = 5;
int KaniLine2 = 5;
int KaniLine3 = 5;
int KaniLine4 = 5;
int KaniLine5 = 5;
int KaniLine6 = 5;
int KaniLine7 = 5;

void keyPressed() {
  //MendakoKey
  if(key == 'd')      MendakoX += 10;
  else if(key == 'a') MendakoX -= 10;
  
  //NarutoKey
  if(key == ' ' && NarutoFlag == 0) { // Space key
    NarutoFlag = 1;
    NarutoX = MendakoX + 16; 
    NarutoY = MendakoY;
  }
  
  //Title
  if(key == '0'){
    startSE.play();
    delay(500);
    
    TitleFlag = 0;
  } 
}   

void draw(){
  translate(width/2, height/2);
  background(32);
  
  //TitleScreen!
  if(TitleFlag == 1){
    beginShape();
    texture(img4);
    vertex(-500, -500, 0, 0);
    vertex( 500, -500, 500, 0);
    vertex( 500,  500, 500, 500);
    vertex(-500,  500, 0, 500);
    endShape();
  }
  
  //GameFlag
  if(TitleFlag == 0) GameFlag = 1;
  
  //GameStart!
  if(GameFlag == 1){
    bgm.play();
    //MendakoPlayer
    image(img0, MendakoX, MendakoY);
  
    //NarutoBullet
    if(NarutoFlag == 1){
      image(img1, NarutoX, NarutoY);
      NarutoY -= 10;
      if(NarutoY < -500) NarutoFlag = 0;
    }

    //NikoNikoSunLife 
    int NikoNikoSunX = -500;
    for(int i = 0; i < 3; i++){
      image(img3, NikoNikoSunX, -500);
      NikoNikoSunX += 105;
    }
  
    //KaniEnemy
    //KaniLine0
    int KaniY = -300;
    for(int i = 0; i < KaniLine0; i++){
      image(img2, -384, KaniY);
      KaniY += 100;
      if(KaniLine0 == 5 && -415 < NarutoX && NarutoX < -322 &&  100 < NarutoY && NarutoY <  132){
        KaniLine0 = 4;
        NarutoFlag = 0;
      }
      if(KaniLine0 == 4 && -415 < NarutoX && NarutoX < -322 &&    0 < NarutoY && NarutoY <   32){
        KaniLine0 = 3;
        NarutoFlag = 0;
      }
      if(KaniLine0 == 3 && -415 < NarutoX && NarutoX < -322 && -100 < NarutoY && NarutoY <  -68){
        KaniLine0 = 2;
        NarutoFlag = 0;
      }
      if(KaniLine0 == 2 && -415 < NarutoX && NarutoX < -322 && -200 < NarutoY && NarutoY < -168){
        KaniLine0 = 1;
        NarutoFlag = 0;
      }
      if(KaniLine0 == 1 && -415 < NarutoX && NarutoX < -322 && -300 < NarutoY && NarutoY < -268){
        KaniLine0 = 0;
        NarutoFlag = 0;
        KaniCount0 = 1; 
      }
    }
    //KaniLine1
    KaniY = -300;
    for(int i = 0; i < KaniLine1; i++){
      image(img2, -284, KaniY);
      KaniY += 100;
      if(KaniLine1 == 5 && -315 < NarutoX && NarutoX < -222 &&  100 < NarutoY && NarutoY <  132){
        KaniLine1 = 4;
        NarutoFlag = 0;
      }
      if(KaniLine1 == 4 && -315 < NarutoX && NarutoX < -222 &&    0 < NarutoY && NarutoY <   32){
        KaniLine1 = 3;
        NarutoFlag = 0;
      }
      if(KaniLine1 == 3 && -315 < NarutoX && NarutoX < -222 && -100 < NarutoY && NarutoY <  -68){
        KaniLine1 = 2;
        NarutoFlag = 0;
      }
      if(KaniLine1 == 2 && -315 < NarutoX && NarutoX < -222 && -200 < NarutoY && NarutoY < -168){
        KaniLine1 = 1;
        NarutoFlag = 0;
      }
      if(KaniLine1 == 1 && -315 < NarutoX && NarutoX < -222 && -300 < NarutoY && NarutoY < -268){
        KaniLine1 = 0;
        NarutoFlag = 0;
        KaniCount1 = 1; 
      }
    }
    //KaniLine2
    KaniY = -300;
    for(int i = 0; i < KaniLine2; i++){
      image(img2, -184, KaniY);
      KaniY += 100;
      if(KaniLine2 == 5 && -215 < NarutoX && NarutoX < -122 &&  100 < NarutoY && NarutoY <  132){
        KaniLine2 = 4;
        NarutoFlag = 0;
      }
      if(KaniLine2 == 4 && -215 < NarutoX && NarutoX < -122 &&    0 < NarutoY && NarutoY <   32){
        KaniLine2 = 3;
        NarutoFlag = 0;
      }
      if(KaniLine2 == 3 && -215 < NarutoX && NarutoX < -122 && -100 < NarutoY && NarutoY <  -68){
        KaniLine2 = 2;
        NarutoFlag = 0;
      }
      if(KaniLine2 == 2 && -215 < NarutoX && NarutoX < -122 && -200 < NarutoY && NarutoY < -168){
        KaniLine2 = 1;
        NarutoFlag = 0;
      }
      if(KaniLine2 == 1 && -215 < NarutoX && NarutoX < -122 && -300 < NarutoY && NarutoY < -268){
        KaniLine2 = 0;
        NarutoFlag = 0;
        KaniCount2 = 1; 
      }
    }
    //KaniLine3
    KaniY = -300;
    for(int i = 0; i < KaniLine3; i++){
      image(img2, -84, KaniY);
      KaniY += 100;
      if(KaniLine3 == 5 && -115 < NarutoX && NarutoX < -22 &&  100 < NarutoY && NarutoY <  132){
        KaniLine3 = 4;
        NarutoFlag = 0;
      }
      if(KaniLine3 == 4 && -115 < NarutoX && NarutoX < -22 &&    0 < NarutoY && NarutoY <   32){
        KaniLine3 = 3;
        NarutoFlag = 0;
      }
      if(KaniLine3 == 3 && -115 < NarutoX && NarutoX < -22 && -100 < NarutoY && NarutoY <  -68){
        KaniLine3 = 2;
        NarutoFlag = 0;
      }
      if(KaniLine3 == 2 && -115 < NarutoX && NarutoX < -22 && -200 < NarutoY && NarutoY < -168){
        KaniLine3 = 1;
        NarutoFlag = 0;
      }
      if(KaniLine3 == 1 && -115 < NarutoX && NarutoX < -22 && -300 < NarutoY && NarutoY < -268){
        KaniLine3 = 0;
        NarutoFlag = 0;
        KaniCount3 = 1; 
      }
    }
    //KaniLine4
    KaniY = -300;
    for(int i = 0; i < KaniLine4; i++){
      image(img2, 16, KaniY);
      KaniY += 100;
      if(KaniLine4 == 5 && -15 < NarutoX && NarutoX < 78 &&  100 < NarutoY && NarutoY <  132){
        KaniLine4 = 4;
        NarutoFlag = 0;
      }
      if(KaniLine4 == 4 && -15 < NarutoX && NarutoX < 78 &&    0 < NarutoY && NarutoY <   32){
        KaniLine4 = 3;
        NarutoFlag = 0;
      }
      if(KaniLine4 == 3 && -15 < NarutoX && NarutoX < 78 && -100 < NarutoY && NarutoY <  -68){
        KaniLine4 = 2;
        NarutoFlag = 0;
      }
      if(KaniLine4 == 2 && -15 < NarutoX && NarutoX < 78 && -200 < NarutoY && NarutoY < -168){
        KaniLine4 = 1;
        NarutoFlag = 0;
      }
      if(KaniLine4 == 1 && -15 < NarutoX && NarutoX < 78 && -300 < NarutoY && NarutoY < -268){
        KaniLine4 = 0;
        NarutoFlag = 0;
        KaniCount4 = 1; 
      }
    }
    //KaniLine5
    KaniY = -300;
    for(int i = 0; i < KaniLine5; i++){
      image(img2, 116, KaniY);
      KaniY += 100;
      if(KaniLine5 == 5 && 85 < NarutoX && NarutoX < 178 &&  100 < NarutoY && NarutoY <  132){
        KaniLine5 = 4;
        NarutoFlag = 0;
      }
      if(KaniLine5 == 4 && 85 < NarutoX && NarutoX < 178 &&    0 < NarutoY && NarutoY <   32){
        KaniLine5 = 3;
        NarutoFlag = 0;
      }
      if(KaniLine5 == 3 && 85 < NarutoX && NarutoX < 178 && -100 < NarutoY && NarutoY <  -68){
        KaniLine5 = 2;
        NarutoFlag = 0;
      }
      if(KaniLine5 == 2 && 85 < NarutoX && NarutoX < 178 && -200 < NarutoY && NarutoY < -168){
        KaniLine5 = 1;
        NarutoFlag = 0;
      }
      if(KaniLine5 == 1 && 85 < NarutoX && NarutoX < 178 && -300 < NarutoY && NarutoY < -268){
        KaniLine5 = 0;
        NarutoFlag = 0;
        KaniCount5 = 1; 
      }
    }
    //KaniLine6
    KaniY = -300;
    for(int i = 0; i < KaniLine6; i++){
      image(img2, 216, KaniY);
      KaniY += 100;
      if(KaniLine6 == 5 && 185 < NarutoX && NarutoX < 278 &&  100 < NarutoY && NarutoY <  132){
        KaniLine6 = 4;
        NarutoFlag = 0;
      }
      if(KaniLine6 == 4 && 185 < NarutoX && NarutoX < 278 &&    0 < NarutoY && NarutoY <   32){
        KaniLine6 = 3;
        NarutoFlag = 0;
      }
      if(KaniLine6 == 3 && 185 < NarutoX && NarutoX < 278 && -100 < NarutoY && NarutoY <  -68){
        KaniLine6 = 2;
        NarutoFlag = 0;
      }
      if(KaniLine6 == 2 && 185 < NarutoX && NarutoX < 278 && -200 < NarutoY && NarutoY < -168){
        KaniLine6 = 1;
        NarutoFlag = 0;
      }
      if(KaniLine6 == 1 && 185 < NarutoX && NarutoX < 278 && -300 < NarutoY && NarutoY < -268){
        KaniLine6 = 0;
        NarutoFlag = 0;
        KaniCount6 = 1; 
      }
    }
    //KaniLine7
    KaniY = -300;
    for(int i = 0; i < KaniLine7; i++){
      image(img2, 316, KaniY);
      KaniY += 100;
      if(KaniLine7 == 5 && 285 < NarutoX && NarutoX < 378 &&  100 < NarutoY && NarutoY <  132){
        KaniLine7 = 4;
        NarutoFlag = 0;
      }
      if(KaniLine7 == 4 && 285 < NarutoX && NarutoX < 378 &&    0 < NarutoY && NarutoY <   32){
        KaniLine7 = 3;
        NarutoFlag = 0;
      }
      if(KaniLine7 == 3 && 285 < NarutoX && NarutoX < 378 && -100 < NarutoY && NarutoY <  -68){
        KaniLine7 = 2;
        NarutoFlag = 0;
      }
      if(KaniLine7 == 2 && 285 < NarutoX && NarutoX < 378 && -200 < NarutoY && NarutoY < -168){
        KaniLine7 = 1;
        NarutoFlag = 0;
      }
      if(KaniLine7 == 1 && 285 < NarutoX && NarutoX < 378 && -300 < NarutoY && NarutoY < -268){
        KaniLine7 = 0;
        NarutoFlag = 0;
        KaniCount7 = 1; 
      }
    }  
  }
  
  //KaniCount To Ending
  KaniCountSum = 0;
  KaniCountSum =  KaniCount0 + KaniCount1 + KaniCount2 + KaniCount3 + KaniCount4 + KaniCount5 + KaniCount6 + KaniCount7;
    
  //KaniALLDELETE
  if(KaniCountSum == 8){
    ClearFlag = 1;
    GameFlag  = 0;
  }
  
  //Ending
  if(ClearFlag == 1){
    bgm.close();
    EndingBGM.play();
    texture(img6);
    vertex(-500, -500, 0, 0);
    vertex( 500, -500, 500, 0);
    vertex( 500,  500, 500, 500);
    vertex(-500,  500, 0, 500);
    endShape();
  }
}
