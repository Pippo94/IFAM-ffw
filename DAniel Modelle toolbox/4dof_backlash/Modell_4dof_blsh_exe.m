clear all
close all
clc

%parameters  [m1 m2 m3 m4 I1 I2 I3 I4 L1 L2 c1 d1 c2 d2] (alt, 4dof);
load 'Par2.mat'; %Werte Daniel

d_ax2 = 0.2; % zweite Achse selbst gewählt

parameters = [d_ax; d_ax2];

%initial value
x0 = [1/180*pi, 5/180*pi, 1/180*pi, 5/180*pi, 0, 0, 0, 0]; %[qm1, qm2 q1 q2 dqm1 dqm2 dq1 dq2]

% für Testkreis

%start and finish point
r = sqrt(parameters(1).^2+parameters(2).^2+2*parameters(1)*parameters(2)*cos(x0(4)));

q = x0(3) + acos((parameters(1)^2+r^2-parameters(2)^2)/(2*parameters(1)*r)); % aus Kosinussatz

% Anfangsbedingungen für Kreis Trajektorie
p0pf=[r;q;0;...
          0;r;0];
   
               
%number of differential equation
num_of_dif_equation=8;

options.ffw.abs_error = 1E-7;
options.ffw.t_max = 4;
options.ffw.step_size = 0.01;
options.ffw.max_iteration = 30;

%options.ffw.Jacobi_analytic = false;
%ffw_toolbox_cleanup('auto');

%options.ffw.export_ffw2c = true; %exportffw2m
%options.ffw.export_ffw2m = true;
%options.ffw.export_type = 'ffw';

options.sim.max_iteration=30;
options.sim.solver = 'ode15s';

%Toolbox execution
results=ffw_toolbox(@Modell_4dof_blsh,'Dx-model',@servo_file_4dof_blsh,@path_file_Modell_4dof_Testkreis,...
    parameters,num_of_dif_equation,x0,p0pf,options);

plotResults(results);