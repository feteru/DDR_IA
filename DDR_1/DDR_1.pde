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


String inputFileName = "../phat_outfile.txt";

//file obj to read from
BufferedReader reader;
String inputStr; //reads .txt file input
String[] acclines; //reads input file, 1d array
String[] orelines; 

//current acceleration.orientation vectors
float[] accdims = new float[3];
float[] oredims = new float[3];

// default sphere position: start in center of screen
//float[] old_position_cube = {50, 50, 50};
float[] cur_sphere_position = {width/2, height/2, 50}; // x, y, radius


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
  
    // sphere position
    translate(cur_sphere_position[0],cur_sphere_position[1]);
    sphere(cur_sphere_position[2]); //sphere radius
    
    cur_sphere_position =  sphereDraw.drawSphere(accdims,oredims,cur_sphere_position);
   
  }
  else {
    System.out.println("inputStr null");
  //TODO some default movement

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
