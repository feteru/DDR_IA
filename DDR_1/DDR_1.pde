void setup() {
 // size(512, 512); // arcs
 //size(1024, 1024,P3D); //triangles
  fullScreen(P3D);
  background(0);
}
//*********************
// INIT VARIABLES 
//********************
//BoxDraw boxDraw = new BoxDraw();
SphereDraw sphereDraw = new SphereDraw();


String inputFileName = "../outfile.txt";

//file obj to read from
BufferedReader reader;
String inputStr; //reads .txt file input
String[] acclines; //reads input file, 1d array
String[] orelines; 

//current acceleration.orientation vectors
float[] accdims = new float[2];
float[] oredims = new float[2];

//old position value, default to middle.
//float[] old_position = {(width/2) - 50,(height/2) + 50, 
//                        (width/2) + 50, (height/2) + 50,
//                        (width/2 + 50), (height/2) -50,
//                        (width/2 - 50), (height/2) -50};
float[] old_position_quad = {462,562,
                            562,562,
                            562,462,
                            462,462};

float[] old_position_cube = {50, 50, 50};
float[] old_position_sphere = {50, 50, 50};


void draw() {
  
  reader = createReader(inputFileName);  //open file to read
  try {
    inputStr = reader.readLine();
  }
  catch (Exception e) {
    System.out.println("Exception thrown trying to read .txt input file");
    //e.printStackTrace();
  }
  
  if (inputStr != null) {
    String[] instanceData = split(inputStr, "|");  //data from instance of input
    oredims = float(split(instanceData[0],','));
    accdims = float(split(instanceData[1],','));
    System.out.println(inputStr); //<>//
    //draw sphere
    noStroke();
    lights();
    translate(width/2,height/5);
    sphere(50);
    old_position_sphere =  sphereDraw.drawSphere(accdims,oredims,old_position_sphere);
    //old_position_cube = boxDraw.cubeDraw(accdims,oredims,old_position_cube);
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
  
}
