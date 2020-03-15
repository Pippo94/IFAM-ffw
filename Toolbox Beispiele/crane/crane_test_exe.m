clear all
clc

%start and finish point
p0pf=[3;0;3;...
    5;0;5];
%initial value
x0=[p0pf(1),p0pf(3),0,0,0,0];
%number of differential equation
num_of_dif_equation=2*3;
%parameters
parameters = [0.7 0.4 9.81];

%Toolbox execution
results=ffw_toolbox(@model_crane_test,'Dx-model',@servo_file_crane_test,@path_file_crane_test,...
    parameters,num_of_dif_equation,x0,p0pf);