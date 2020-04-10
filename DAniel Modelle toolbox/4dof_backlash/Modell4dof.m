clear
close all
clc

%% Parameter
q = sym('q',[4 1],'real');
dq = sym('dq',[4 1],'real');
u = sym('u',[2 1],'real');

syms t t_ode parameter real 

load 'Par2.mat'

% Kinematik
kin(1,:) = [0 q(3)]; 
kin(2,:) = [d_ax q(4)]; % first parameter is axis distance
% Joint-Friction
D = D*dq;

% Erzeugen des Backlash Torques
% d1 = [];
T_cnl = Smbacklash(k1,d1,0.05,0.2*pi/180,0); 
% T_cnl = Smbacklash(k1,d1,0.01,0.15*pi/180,1);      % for damping

%% Aufstellen des Modells
for i=1:length(kin(:,1))          % Transformationsmatrizen aus DH Parameter
    T_kin(:,:,i) = [cos(kin(i,2)) -sin(kin(i,2)) kin(i,1);...
        sin(kin(i,2)) cos(kin(i,2)) 0; 0 0 1];
end

r(:,1) = T_kin(:,3,1);          % Vektor zu Schwerpunkten in Abh. der verallg. Koordinaten
r(:,2) = T_kin(:,:,1)*T_kin(:,3,2);
r(:,3) = T_kin(:,:,1)*[cog(:,1);1];
r(:,4) = T_kin(:,:,1)*T_kin(:,:,2)*[cog(:,2);1];

for i=1:length(r(1,:))          % Jacobi Matrix transl.
    J_T(:,:,i) = jacobian(r([1 2],i),q);
end

for i=1:length(r(1,:))          % Geschwindigkeiten
    v(:,i) = simplify(J_T(:,:,i)*dq);
end

for i=1:length(r(1,:))          % lokale Beschleunigungen
    as(:,i) = simplify(jacobian(v(:,i),q)*dq);
end

J_R(1,:) = [1 0 0 0];
J_R(2,:) = [0 1 1 0];
J_R(3,:) = [0 0 1 0];
J_R(4,:) = [0 0 1 1];

for i=1:length(r(1,:))          % Winkelgeschwindigkeiten
    w(:,i) = simplify(J_R(i,:)*dq);
end

for i = 1:length(r(1,:))        % lokale Winkelbeschleunigungen
    als(:,i) = jacobian(w(:,i),q)*dq;
end

m = [m_a'; m_u'];    % Massenvektor zusammenbauen
I = [I_a'; I_u];
M = zeros(length(m));
k = zeros(length(m),1);
%g = zeros(length(m),1);

for i=1:length(m)
    M = M + (J_T(:,:,i)'*m(i)*J_T(:,:,i)+J_R(i,:)'*I(i,:)*J_R(i,:));
    k = k + (J_T(:,:,i)'*m(i)*as(:,i) + J_R(i,:)'*I(i,:)*als(:,i));
    %g = g + (J_T(:,:,i)'*[0 -9.81]'*m(i));
end

M_inv = simplify(inv(M));
B = [eye(length(kin(:,1))); zeros(length(kin(:,1)))];
K = diag([k1 k2]);
D2 = diag([d1 d2]);
% C = [K*(q(3:4)-q(1:2))+D2*(dq(3:4)-dq(1:2));K*(q(1:2)-q(3:4))+D2*(dq(1:2)-dq(3:4))];
% nominal viscoelastic
% C = [K*(q(3:4)-q(1:2));K*(q(1:2)-q(3:4))];
% nominal elastic

strb = symvar(T_cnl);
C = [subs(T_cnl,strb(1), [q(3)-q(1)]);...
     K(2,2)*(q(4)-q(2))+D2(2,2)*(dq(4)-dq(2));...
     subs(T_cnl,strb(1),[q(1)-q(3)]);...
    -K(2,2)*(q(4)-q(2))-D2(2,2)*(dq(4)-dq(2))]; % reference backlash

%% Analyse der Dynamik
f = [dq; M_inv*(C-k+D)];
g2(:,1) = [zeros(4,1); M_inv*B(:,1)];
g2(:,2) = [zeros(4,1); M_inv*B(:,2)];

x = [q;dq];

% h(1) = q(3);
% h(2) = q(2)+q(3);

f_t = f+g2*u;
f_f = matlabFunction(f_t,'Vars',{t, x, u, parameter, t_ode},'File','Modell_4dof_blsh');