clear all
close all
clc

%parameters  [m1 m2 m3 m4 I1 I2 I3 I4 L1 L2 c1 d1 c2 d2] (alt, 4dof);
load 'Par2.mat';
d_ax2 = 0.1;
parameters = [d_ax; d_ax2];

%initial value

x0 = [0,0,0.01/180*pi,0,0,0];

%start and finish point
r = sqrt(parameters(1).^2+parameters(2).^2+2*parameters(1)*parameters(2)*cos(x0(3)));

p0pf=[r;0;0;...
          0;r;0];

%number of differential equation
num_of_dif_equation = 6;

options.ffw.abs_error = 1E-6;
options.ffw.t_max = 5;
%options.ffw.u_0 = [0 0];
options.ffw.step_size = 0.01;
options.ffw.max_iteration = 30;
%options.ffw.solver = 'BDF_onestep';
%options.ffw.implRK.k = 3;
%options.ffw.Jacobi_analytic = false;
%ffw_toolbox_cleanup('auto');
%options.ffw.export_ffw2c = true; %exportffw2m
%options.ffw.export_ffw2m = true;
%options.ffw.export_type = 'ffw';

%Toolbox execution
results=ffw_toolbox(@Modell_3dof_smblsh,'Dx-model',@servo_file_Modell3dof_smblsh,@path_file_Modell3dof_smblsh,...
    parameters,num_of_dif_equation,x0,p0pf,options);

plotResults_3dof(results);