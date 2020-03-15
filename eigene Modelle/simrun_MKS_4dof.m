%MKS_4dof Simulation
clear all
clc

%parameters  [m1 m2 m3 m4 I1 I2 I3 I4 L1 L2 c1 d1 c2 d2];
parameters = [0.3 0.3 2.53 0.728 1.4E-3 1.17E-5 4.57E-2 4.5E-3 ...
                      0.305 0.1 330 0.146 713.02 0.25];
                  
%initial value
y0=[0,0,0,0,0,0,0,0];

[t,y] = ode45(@(t,y) MKS_4dof(t, y, input(t), parameters),0:0.01:10,y0);

function [u] = input(t)
u = zeros(2,1);

if t <= 1.5
    u(1) = 0.005;
    u(2) = -0.00001;
end

end