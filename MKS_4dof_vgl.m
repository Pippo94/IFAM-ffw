clear all
close all 
clc

% Modell vergleich auf gleiche Parameter und AW achten!!!!
cd './eigene Modelle'

MKS_4dof_exe
res1 = results;

cd ../
save('res1', 'res1')

cd './DAniel Modelle toolbox/4dof_backlash/'
Modell_4dof_blsh_exe
res2 = results;

load('../../res1.mat')
in1 = @(t) input(t,res1.ffw.u.',res1.ffw.t);
in2 = @(t) input(t,res2.ffw.u.',res2.ffw.t);
[t1,y1] = ode15s(@(t,y) Modell_4dof_blsh(t,y,in1(t),parameters),res1.ffw.t,x0);
[t2,y2] = ode15s(@(t,y) Modell_4dof_blsh(t,y,in2(t),parameters),res2.ffw.t,x0);
cd '../../'
save('res1', 'res1', 't1', 'y1')
save('res2', 'res2', 't2', 'y2')

close all
clear all
clc


load('res1.mat')
load('res2.mat')

% plot
u_diff = res2.ffw.u - res1.ffw.u;

figure(1)

%u1
ax1 = subplot(2,1,1);
plot(ax1, res1.ffw.t, res1.ffw.u(:,1), 'r', res2.ffw.t, res2.ffw.u(:,1), 'b')
legend('ohne', 'mit blsh')
title('\tau_{u,1}')
xlabel(ax1, 'Zeit t')
ylabel(ax1, 'Torque')

%u1 diff
ax2 = subplot(2,1,2);
plot(ax2,res1.ffw.t, u_diff(:,1))
title('\tau_{u,1} Differenz')
xlabel(ax2, 'Zeit t')
ylabel(ax2, 'Torque')

figure(2)
%u2
ax3 = subplot(2,1,1);
plot(ax3, res1.ffw.t, res1.ffw.u(:,2), 'r', res2.ffw.t, res2.ffw.u(:,2), 'b')
title('\tau_{u,2}')
legend('ohne', 'mit blsh')
xlabel(ax3, 'Zeit t')
ylabel(ax3, 'Torque')

%u2 diff
ax4 = subplot(2,1,2);
plot(ax4, res1.ffw.t, u_diff(:,2))
title('\tau_{u,2} Differenz')
xlabel(ax4, 'Zeit t')
ylabel(ax4, 'Torque')

figure(3)
L1 = res2.system.parameters(1);
L2 = res2.system.parameters(2);


ax5 = subplot(2,4, [1 2 5 6]);
hold on
plot(ax5, L1*cos(y1(:,3))+L2*cos(y1(:,3)+y1(:,4)),...
    L1*sin(y1(:,3))+L2*sin(y1(:,3)+y1(:,4)), 'r');
plot(ax5, L1*cos(y2(:,3))+L2*cos(y2(:,3)+y2(:,4)),...
    L1*sin(y2(:,3))+L2*sin(y2(:,3)+y2(:,4)), 'b');
plot(ax5,res2.ffw.path_ref(1:3:end,1), res2.ffw.path_ref(1:3:end,2), 'k--')
axis('equal')
legend('ffw ohne blsh', 'ffw mit blsh', 'Referenz')

title('Endeffektor')
xlabel(ax5, 'x')
ylabel(ax5, 'y')

%plot q1
ax6 = subplot(2,4,3);
hold on
plot(ax6, t1, y1(:,1), 'r')
plot(ax6, t2, y2(:,1), 'b')
plot(ax6, res2.ffw.t, res2.ffw.x(:,1), '--k')
title('q_1')
xlabel(ax2, 'Zeit t')
ylabel(ax2, 'Winkel  in rad')

%plot q2
ax7 = subplot(2,4,4);
hold on
plot(ax7, t1, y1(:,2), 'r')
plot(ax7, t2, y2(:,2), 'b')
plot(ax7, res2.ffw.t, res2.ffw.x(:,2), '--k')
title('q_2')
%legend('ffw ohne blsh', 'ffw mit blsh', 'Referenz')
xlabel(ax2, 'Zeit t')
ylabel(ax2, 'Winkel  in rad')

%plot q3
ax8 = subplot(2,4,7);
hold on
plot(ax8, t1, y1(:,3), 'r')
plot(ax8, t2, y2(:,3), 'b')
plot(ax8, res2.ffw.t, res2.ffw.x(:,3), '--k')
title('q_3')
%legend('ffw ohne blsh', 'ffw mit blsh', 'Referenz')
xlabel(ax2, 'Zeit t')
ylabel(ax2, 'Winkel  in rad')

%plot q4
ax9 = subplot(2,4,8);
hold on
plot(ax9, t1, y1(:,4), 'r')
plot(ax9, t2, y2(:,4), 'b')
plot(ax9, res2.ffw.t, res2.ffw.x(:,4), '--k')
title('q_4')
%legend('ffw ohne blsh', 'ffw mit blsh', 'Referenz')
xlabel(ax2, 'Zeit t')
ylabel(ax2, 'Winkel  in rad')


function in = input(t,solution,time)

%input by interpolation also for ode45
in(1,1) = interp1(time,solution(1,:),t);
in(2,1) = interp1(time,solution(2,:),t);
end
