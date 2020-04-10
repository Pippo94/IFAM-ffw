clear
close all
clc

%% Parameter
q = sym('q',[3 1],'real');
dq = sym('dq',[3 1],'real');
u = sym('u',[2 1],'real');

%for toolbox export
syms t parameter t_ode real

load 'Par2.mat'

% Kinematik
kin(1,:) = [0 q(2)]; 
kin(2,:) = [d_ax q(3)]; % erster Parameter ist Achsabstand

% Joint-Friction
D = diag([D(1,1),D(3,3),D(2,2)+D(4,4)])*dq;

% Umrechnen in 3dof Modell
cog_t = cog(:,2);
cog(:,2) = (m_u(2)*cog(:,2))/(m_u(2) + m_a(2));     % cog von m_a ist [0 0]
I_u(2,1) = I_u(2,1) + m_u(2)*(norm(cog_t)-norm(cog(:,2)))^2 + I_a(2)+norm(cog(:,2))^2*m_a(2);
m_u(2) = m_u(2) + m_a(2);

m_a(2) = [];
I_a(2) = [];

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
r(:,2) = T_kin(:,:,1)*[cog(:,1);1];
r(:,3) = T_kin(:,:,1)*T_kin(:,:,2)*[cog(:,2);1];

for i=1:length(r(1,:))          % Jacobi Matrix transl.
    J_T(:,:,i) = jacobian(r([1 2],i),q);
end

for i=1:length(r(1,:))          % Geschwindigkeiten
    v(:,i) = simplify(J_T(:,:,i)*dq);
end

for i=1:length(r(1,:))          % lokale Beschleunigungen
    as(:,i) = simplify(jacobian(v(:,i),q)*dq);
end

J_R(1,:) = [1 0 0];
J_R(2,:) = [0 1 0];
J_R(3,:) = [0 1 1];

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
g = zeros(length(m),1);

for i=1:length(m)
    M = M + (J_T(:,:,i)'*m(i)*J_T(:,:,i)+J_R(i,:)'*I(i,:)*J_R(i,:));
    k = k + (J_T(:,:,i)'*m(i)*as(:,i) + J_R(i,:)'*I(i,:)*als(:,i));
    %g = g + (J_T(:,:,i)'*[0 9.81]'*m(i));
    %g = g + (J_T(:,:,i)'*[0 9.81*sin(2.85*pi/180)]'*m(i));
    %g = g + (J_T(:,:,i)'*[0 9.81*sin(3.7*pi/180)]'*m(i));
end

M_inv = simplify(inv(M));
B = [[1 0 0]' [0 0 1]' [0 1 0]'];

K = diag([k1]);
x = [q;dq];

 tp = symvar(T_cnl);    % smooth backlash
  C = [subs(T_cnl, tp(1),[q(2)-q(1)]);...
     subs(T_cnl, tp(1),[q(1)-q(2)]); 0];

 %C = [K*(q(2)-q(1))+d1*(dq(2)-dq(1)); K*(q(1)-q(2))+d1*(dq(1)-dq(2)); 0];
% nominal viscoelastic
%C = [K*(q(2)-q(1)); K*(q(1)-q(2)); 0];  % nominal elastic

%% Analyse der Dynamik
f = [dq; M_inv*(C-k+D)];

g2(:,1) = [zeros(3,1); M_inv*B(:,1)];
g2(:,2) = [zeros(3,1); M_inv*B(:,2)];

f_t = f+g2*u;
f_f = matlabFunction(f_t,'Vars',{t, x, u, parameter, t_ode},'File','Modell_3dof_smblsh');
