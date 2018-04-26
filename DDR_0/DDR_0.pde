void setup() {
 // size(512, 512); // arcs
 size(1024, 1024,P3D); //triangles
//  translate(width/2,height/2);
 // fullScreen(P3D);
  background(255);
}
//*********************
// INIT VARIABLES 
//********************
BoxDraw boxDraw = new BoxDraw();

String inputFileName = "../outfile.txt";

//file obj to read from
BufferedReader reader;
String inputStr; //reads .txt file input
String[] acclines; //reads input file, 1d array
String[] orelines;

//current acceleration.orientation vectors
float[] accdims = new float[2];
float[] oredims = new float[2];
float[] acceldev = new float[2];
//old position value, default to middle.
//float[] old_position = {(width/2) - 50,(height/2) + 50, 
//                        (width/2) + 50, (height/2) + 50,
//                        (width/2 + 50), (height/2) -50,
//                        (width/2 - 50), (height/2) -50};
float[] old_position_quad = {462,562,
                            562,562,
                            562,462,
                            462,462};
int i = 0;  //color increment
int n = 0; //color slowing increment
float[] old_position_cube = {50, 50, 50, i};  //cube position aaaand increment

int[] fillColor = {250,250,250};

int[][] colorList = {{0,255,197}, //lime green
                    {173,245,255}, //light blue
                    {239,241,243}, //eggshell color
                    {62,195,0}, //bright green
                    {255,252,49}, //brighter yellow
                    {255,202,233}, //light pink
                    {203,238,243}, //light blue
                    {156,255,250}, //another light blue
                    {240,56,255}, // bright purple
                    {0,53,84}, //uhhh
                    {78,255,239}, //turquoise
                    {248,112,96}, //burnt orange
                    {229,224,89}, //puke MIGHT TAKE OUT
};

void draw() {
  
  reader = createReader(inputFileName);  //open file to read
  try {
    inputStr = reader.readLine();
  }
  catch (Exception e) {
    System.out.println("Exception thrown trying to read .txt input file");
    //e.printStackTrace();
  }
  
  if(n<10){
    n += 1;
  }
  else if(n==10){
    n = 0;
    if(i<12){
      i += 1;
    }
    else if(i==12){
      i = 0;
    }
  }
  
  
  if (inputStr != null) {
    String[] instanceData = split(inputStr, "|");  //data from instance of input
    oredims = float(split(instanceData[0],','));
    accdims = float(split(instanceData[1],','));
    acceldev = float(split(instanceData[2],','));
    System.out.println(inputStr);
    //draw box
    //old_position_quad = boxDraw.drawBox(accdims, oredims, old_position_quad);
    //lights();
    translate(width/2,height/2);
    
    old_position_cube = boxDraw.cubeDrawList(accdims, oredims, old_position_cube, colorList, i); //<>//
    //i = int(old_position_cube[3]);
  }
  else {
    System.out.println("inputStr null");
    //old_position_cube = boxDraw.cubeDraw(accdims,oredims,old_position_cube);

  }
  
}

void keyPressed() {
 if (key == 's') {
   
   println("Saving...");
   saveFrame("screen-image.jpg");
   println("Done saving.");
 }
 if (key == 'q') {
   exit();
 }
 if (key == 'b'){
   background(255);
 }
  
}
