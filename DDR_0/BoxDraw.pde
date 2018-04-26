class BoxDraw {

  float[] drawBox(float[] accdims, float[] oredims, float[] old_position_quad) {
    //define the changes to old position, aka just opsition
    //float[] new position = new float[4];  //establish variable for new position
    //x & y accel average
    float accavg = ((accdims[0] + accdims[1]) / 2) * 10;  //average x and y accelerations, just because
    accdims[2] = accdims[2] * 10;
    if (accavg > 0) {
      old_position_quad[2] = old_position_quad[2] + accavg;
      old_position_quad[4] = old_position_quad[4] + accavg;
    }
    if (accavg < 0) {
      old_position_quad[0] = old_position_quad[0] + accavg;
      old_position_quad[6] = old_position_quad[6] + accavg;
    }

    if (accdims[2] > 0) {
      old_position_quad[1] = old_position_quad[1] + accdims[2];
      old_position_quad[3] = old_position_quad[3] + accdims[2];
    }
    if (accdims[2] < 0) {
      old_position_quad[5] = old_position_quad[5] + accdims[2];
      old_position_quad[7] = old_position_quad[7] + accdims[2];
    }
    quad(old_position_quad[0], old_position_quad[1], 
      old_position_quad[2], old_position_quad[3], 
      old_position_quad[4], old_position_quad[5], 
      old_position_quad[6], old_position_quad[7]);

    return old_position_quad;
  }

  float[] cubeDraw(float[] accdims, float[] oredims, float[] old_position_cube, int[] fillColor) {
    //draw a 3d cube and alter the dimensions based on the inputs.
    if(old_position_cube.length == 3) {
      //old_position_cube[0] += abs(accdims[0]);
      //old_position_cube[1] += abs(accdims[1]);
      //old_position_cube[2] += abs(accdims[2]);
      old_position_cube[0] += abs(oredims[0]/10);
      old_position_cube[1] += abs(oredims[1]/10);
      old_position_cube[2] += abs(oredims[2]/10);

    }
    
    fillColor[0] += int(accdims[0]);
    fillColor[1] += int(accdims[1]);
    fillColor[2] += int(accdims[2]);
    fill(fillColor[0],fillColor[1],fillColor[2]);
    
    box(old_position_cube[0]%height*2, old_position_cube[1]%width*2, old_position_cube[2]%height*2);
    return old_position_cube;
  }
  
  
  float[] cubeDrawList(float[] accdims, float[] oredims, float[] old_position_cube, int[][] colorList, int i, int n) {
    //draw a 3d cube and alter the dimensions based on the inputs.
    if(old_position_cube.length == 4) {
      //old_position_cube[0] += abs(accdims[0]);
      //old_position_cube[1] += abs(accdims[1]);
      //old_position_cube[2] += abs(accdims[2]);
      
      //use orientation to control the size of the cube
      //x = azimuth, y = pitch, z = roll
      old_position_cube[0] -= abs(oredims[0]/10);
      old_position_cube[1] -= abs(oredims[1]/10);
      old_position_cube[2] -= abs(oredims[2]/10);
      //int n = int(old_position_cube[3]);

    }

    //fillColor[1] += int(accdims[1]*10);
    //fillColor[2] += int(accdims[2]*10);
    translate(oredims[1], oredims[2]);
    float ncolor = n/10;
    color inter1 = color(colorList[i][0], colorList[i][1],colorList[i][2]);
    color inter2 = color(colorList[i+1][0], colorList[i+1][1],colorList[i+1][2]);
    color lerp_inter = lerpColor(inter1, inter2, ncolor);
    //fill(colorList[i][0],colorList[i][1],colorList[i][2]);
    fill(lerp_inter);
    box(old_position_cube[0]%(height/1.25), old_position_cube[1]%(width/1.25), old_position_cube[2]%(height/1.25));
    //deal with incrementation
    //if(i<12){
    //  i += 1;
    //}
    //else{ i = 0;}
    //old_position_cube[3] = i;
    return old_position_cube;
  }
}
