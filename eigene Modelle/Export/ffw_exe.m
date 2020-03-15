function [x_out,u_out,counter,path_ref]=ffw_exe(x_old,u_old,t,parameters,p0pf,type,t_max,counter)
%current: vector: previous result of the newton algorythm
%t: scalar: current time
%parameters: vector: parameters in the same format/order as the parameter file
%p0pf: vector: [start_point,end_point]
%type: scalar: which path of the path should be executed?
%t_max: scalar: time to reach the end_point
path_file=@path_file_MKS_4dof;
jacobi=@MKS_4dof_jacobi;
ffw=@MKS_4dof_ffw;
step_size=0.01;
num_of_states=8;
abs_error=0.001;
max_iteration=30;
%% Beginning of Template
next_x=x_old.';
next_u=u_old.';
current=[next_x;next_u];
next=current;
path_ref=path_file(type,t,t_max,p0pf);%read out path from the path file
counter=0;%counts newton iterations
while counter<max_iteration%check wether the maximum iteration is reached
    counter = counter+1;
    %evaluate jacobi file for the current jacobi matrix
    jacobi_value=jacobi(next_x,current,next_u,path_ref,parameters,step_size);
    %evaluate ffw file for the current value of the function
    ffw_value=ffw((next-current)/step_size,next_x,next_u,path_ref,parameters);
    %Newton's method
    next=next - (jacobi_value \ ffw_value);
    %split up the solution of Newton's method into states (x) and system inputs (u)
    next_x=next(1:num_of_states);
    next_u=next(num_of_states+1:end);
    %evaluate ffw file for the current value of the function
    ffw_value=ffw((next-current)/step_size,next_x,next_u,path_ref,parameters);
    if max(abs(ffw_value)) < abs_error%is the solution close enough to zero?
        break;%yes --> stop Newton's method
    end
end
x_out=next_x.';
u_out=next_u.';
end
