class SphereDraw {

  float[] drawSphere(float[] accdims, float[] oredims, float[] old_position_sphere) {
   
    //x & y accel average
    float accavg = ((accdims[0] + accdims[1]) / 2) * 10;  //average x and y accelerations, just because
    //accdims[2] = accdims[2] * 10;
    
    float x_pos = oredims[0]; // roll
    float y_pos = oredims[1];  // pitch
    float x_accel = accdims[0]; // left/right
    float y_accel = accdims[1];  // up/down
    float z_accel = accdims[2];  // forward/back
    
    

    if (x_accel < 0) { // if x_accel is negative, x_accel is unit acceleration
      x_accel = 1; 
    }
    
    // move x position wrt width, speed up if accelerating
    old_position_sphere[0] = old_position_sphere[0] + (width/10)*x_pos*x_accel;
    
    // move y position wrt width, speed up if accelerating
    old_position_sphere[1] = old_position_sphere[1] + (height/10)*y_pos*y_accel;
        
    // adjust radius of the sphere
    old_position_sphere[2] = old_position_sphere[2] + (0.5*width*height/10)*accavg*z_accel;

    return old_position_sphere;
    
  }

}
