function F = servo_file_4dof_blsh(Dx,x,path,parameters)
%x = [q1 q2 q3 dq1 dq2 dq3]
%parameters = [d_ax d_ax2];
%path = [x y dx dy d2x d2y]
   

F(1) = parameters(1)*cos(x(3))+parameters(2)*cos(x(3)+x(4))-path(1); %x constraint
F(2) = parameters(1)*sin(x(3))+parameters(2)*sin(x(3)+x(4))-path(2); %y constraint

%servo velocity
%F(1) = -parameters(9)*x(7)*sin(x(3))-parameters(10)*(x(7)+x(8))*sin(x(3)+x(4))-path(3); %dx constraint
%F(2) = parameters(9)*x(7)*cos(x(3))+parameters(10)*(x(7)+x(8))*cos(x(3)+x(4))-path(4); %dy constraint
    
end