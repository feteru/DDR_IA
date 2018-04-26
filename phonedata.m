%% Initialize and activate 

connector on cheesecake;
%clear m;

m = mobiledev

m.AccelerationSensorEnabled = 1;
m.AngularVelocitySensorEnabled = 1;
% m.MagneticSensorEnabled = 0;
m.OrientationSensorEnabled = 1;
% m.PositionSensorEnabled = 0;

m.Logging = 1;

pause(0.2);
%disp(m)
while(1)
    fileID = fopen('outfile.txt','w');
    %report out angular velocity
    %angvel = (angvellog(m))
    %n = length(angvel);
    %angvel = angvel(n,1) + ", " + angvel(n,2) + ", " + angvel(n,3);
    %angvel = mean(angvel,1);
    %fprintf(fileID,'%s\n',angvel);
    %print out orientation
    orient_avg = orientlog(m);
    %orient_avg = mean(orient_avg,1);
    %orient_avg = orient_avg(:,end);
    orient_avg = orient_avg(end,1) + ", " + orient_avg(end,2) + ", " + orient_avg(end,3);
%     fprintf(fileID,'%s\n',orient_avg);
    accel = accellog(m);
%     accellog_small = accellog(1:10:end);
    acceldev = std(accel)
    accel = accel(end,1) + ", " + accel(end,2) + ", " + accel(end,3);    %generate string format for printing
    writeline = orient_avg + " | " + accel;
    fprintf(fileID,'%s\n',writeline);   %write to file
    fclose(fileID);
    pause(0.05);
end