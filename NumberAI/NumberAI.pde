PrintWriter output;
BufferedReader reader; 
int PixelX=0;
int PixelY=0;
int NumOfCorners=0;
int NumOfHorLines=0;
int NumOfVerLines=0;
int NumOfEnds=0;
int NumberOfQualites=0;
int ColorOfPixel=255;
int NumberFromFile=0;
double slope=0;
boolean STOPDRAW=false;
boolean GotGuess=false;
boolean GuessIsRight=false;
boolean GuessGiven=false;
int guess=-1;
int LastGuess=guess;
void setup(){
  size(500,500);
  background(255);
  output = createWriter("/Users/ivandelgado/Desktop/NumberAI/Number0.txt");
  reader = createReader("/Users/ivandelgado/Desktop/NumberAI/Number0.txt");
}

void draw(){
  if(STOPDRAW==false){
    if(mousePressed==true){
      fill(0);
      rect(mouseX,mouseY,1,1);  
    }
  }else{
    if(GotGuess==true){
     System.out.println(guess);
     GuessGiven=true;
      if(GuessIsRight==true){
        return;
      }
      if(GuessIsRight==false){
        GetGuess(guess);
      }
    }  
    GetGuess(guess);
  } 
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==SHIFT){
      STOPDRAW=true;     
    }    
    if(keyCode==TAB){
      GuessIsRight=false;
    }
    if(keyCode==RETURN){
      GuessIsRight=true;
    }
  }
}

void GetGuess(int LastGuess) {
  try{
    if(LastGuess>0){
      GotGuess=false;
      for(int i=0;i<10;i++){
        if(i==LastGuess){
          
        }else{
            NumberOfQualites=0;
            NumOfCorners=GetCorners();
            NumOfVerLines=GetVerLines();
            NumOfHorLines=GetHorLines();
            NumOfEnds=GetEnds();
            output = createWriter("/Users/ivandelgado/Desktop/NumberAI/Number"+i+".txt");
            reader = createReader("/Users/ivandelgado/Desktop/NumberAI/Number"+i+".txt");
            for(int J=0;J<10;J++){
               NumberFromFile=reader.read();
               if(J==3){
                 if(NumOfCorners==NumberFromFile-48){
                   NumberOfQualites++;
                 }
               }
               else if(J==5){
                 if(NumOfVerLines==NumberFromFile-48){
                   NumberOfQualites++;
                 }
               }
               else if(J==7){
                 if(NumOfHorLines==NumberFromFile-48){
                   NumberOfQualites++;
                 }
               }
               else if(J==9){
                 if(NumOfHorLines==NumberFromFile-48){
                   NumberOfQualites++;
                 }
               }
               else if(NumberOfQualites>=3){
                 GotGuess=true;
                 guess=i;
                 return;
               }
            }
            output.close();
            reader.close();
        }
      }
    }else{
      
    } 
  }catch(IOException io){
    io.getStackTrace();   
  }
}

int GetCorners(){
  int Corners=0;
  boolean FoundFirstPixel=false;
  for(int row=0;row<501;row++){
    for(int col=0;col<501;col++){
      if(FoundFirstPixel==false&&get(row,col)!=255){
        
      }      
    }
  }  
  return Corners;
}
int GetVerLines(){
  int VerLines=0;
  
  
  return VerLines;
}
int GetHorLines(){
  int HorLines=0;
  
  
  return HorLines;
}
int GetEnds(){
  int Ends=0;
  
  
  return Ends;
}