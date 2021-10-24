% define the variables;
% m = total mass of disk and axles
% r = radius
% Io = moment of inertia about point o
% theta = ramp slope angle
% g = gravity
% a = acceleration
m = 11.6;
r = 0.01;
Io = 0.1237;
pi = 3.141592654;
theta = 4.5*2*pi/360;
g = 9.81;
a = (m*g*sin(theta)*r^2)/(Io);
% time range from 1 to 20 seconds;
for i = 1:2001
time(i)=(i-1)/100;
x(i)=0.5*a*time(i)^2;
end
plot(time,x)
xlabel('time (s)')
ylabel('distance (m)')
title('Distance vs Time Graph')
