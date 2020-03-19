clear all
close all
clc

%parameters  [m1 m2 m3 m4 I1 I2 I3 I4 L1 L2 c1 d1 c2 d2];
parameters = [0.3 0.3 2.53 0.728 1.4E-3 1.17E-5 4.57E-2 4.5E-3 ...
                      0.305 0.1 330 0.146 713.02 0.25];
                  

%initial value
x0 = [1/180*pi, 5/180*pi, 1/180*pi, 5/180*pi, 0, 0, 0, 0]; %[qm1, qm2 q1 q2]

% für Testkreis

%start and finish point
r = sqrt(parameters(9).^2+parameters(10).^2+2*parameters(9)*parameters(10)*cos(x0(4)));

q = x0(3) + acos((parameters(9)^2+r^2-parameters(10)^2)/(2*parameters(9)*r)); % aus Kosinussatz


p0pf=[r;q;0;...
          0;r;0];
   
               
%number of differential equation
num_of_dif_equation=8;

options.ffw.abs_error = 1E-9;
options.ffw.t_max = 4;
%options.ffw.u_0 = [0 0];
options.ffw.step_size = 0.01;
options.ffw.max_iteration = 30;
%options.ffw.Jacobi_analytic = false;
%ffw_toolbox_cleanup('auto');
%options.ffw.export_ffw2c = true; %exportffw2m
%options.ffw.export_ffw2m = true;
%options.ffw.export_type = 'ffw';

%Toolbox execution
results=ffw_toolbox(@MKS_4dof,'Dx-model',@servo_file_MKS_4dof,@path_file_Modell4dof_Testkreis,...
    parameters,num_of_dif_equation,x0,p0pf,options);

plotResults(results);