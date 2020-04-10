% MKS xd = f(x,u,parameter)
clear all
clc

%% Parameter
q = sym('q',[4 1],'real');
dq = sym('dq',[4 1],'real');
u = sym('u',[2 1],'real');

syms m1 m2 m3 m4 I1 I2 I3 I4 L1 L2 c1 d1 c2 d2 t t_ode real;
parameter = [m1 m2 m3 m4 I1 I2 I3 I4 L1 L2 c1 d1 c2 d2];
m = [m1 m2 m3 m4];
I = [I1 I2 I3 I4];

%Reibung
load('Par2.mat', 'D')
D = D*dq;


%Richtungsvektoren Schwerpunkt
r(:,:,1) = sym(zeros(3,1));
r(:,:,2) = [0 L1*cos(q(3)) L1*sin(q(3))]';
r(:,:,3) = [0.5*L1*cos(q(3)) 0.5*L1*sin(q(3)) 0]';
r(:,:,4) = [L1*cos(q(3))+0.5*L2*cos(q(3)+q(4)) L1*sin(q(3))+0.5*L2*sin(q(3)+q(4)) 0]';

%Jacobi Translation
for i=1:4
    J_T(:,:,i) = jacobian(r(:,:,i),q);
end

%Jacobi Rotation
J_R = sym(zeros(3,4,2));
J_R(:,:,1) = [0 0 0 0; 0 0 0 0; 1 0 0 0];
J_R(:,:,2) = [0 0 0 0; 0 0 0 0; 0 1 1 0];
J_R(:,:,3) = [0 0 0 0; 0 0 0 0; 0 0 1 0];
J_R(:,:,4) = [0 0 0 0; 0 0 0 0; 0 0 1 1];


%massenmatrix
M = zeros(4,4);
for i=1:4
    M = M+J_T(:,:,i).'*m(i)*J_T(:,:,i)+J_R(:,:,i).'*I(i)*J_R(:,:,i);
end
M_inv = simplify(inv(M));

%Zeitableitung Jacobi-Mtrizen
for i=1:4
    J_Td(:,:,i) = jacobd(J_T(:,:,i),q,dq);
end

%Coriolis und co
k = zeros(4,1);
for i=1:4
   k = k + J_T(:,:,i).'*m(i)*(J_Td(:,:,i)*dq);
   % unter Berücksichtigung, dass alpha_quer = 0 | w_tilde*I*w = 0
end

%Eingeprägte Momente (Kräfte = 0)
le = sym(zeros(3,1,4));
le(:,:,1) = [0 0 c1*(q(3)-q(1))+d1*(dq(3)-dq(1))].';
le(:,:,2) = [0 0 c2*(q(4)-q(2))+d2*(dq(4)-dq(2))].';
le(:,:,3) = -le(:,:,1);
le(:,:,4) = -le(:,:,2);

%projezierte Kräfte
fq = zeros(4,1);

for i=1:4
    fq = fq+J_R(:,:,i).'*le(:,:,i);
end

%% Bewegungsgleichung in Dx Form aufstellen

%dynamik
f = [dq; M_inv*(fq-k+D)];
%input
W = [1 0 0 0 ; 0 1 0 0].'; %sortiert input u
b = [zeros(4,2);M_inv*W];


f_xu = f+b*u;

x = [q; dq];
f_export = matlabFunction(f_xu,'Vars',{t, x, u, parameter, t_ode},'File','MKS_4dof');


%Funktion Ableitung der Jacobi Matrizen
function jd = jacobd(ja,y,yd)
[m,n] = size(ja);
jd = sym('jd',[m n]);
for i=1:m
    for j=1:n
        jd(i,j)=jacobian(ja(i,j),y)*yd;
    end
end
end








