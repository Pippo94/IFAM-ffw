function [] = plotResults_3dof(data)

close all
L1 = data.system.parameters(1);
L2 = data.system.parameters(2);

figure(1)

ax1 = subplot(4,4, [1 2 5 6 9 10 13 14]);

hold on
plot(ax1, L1*cos(data.ffw.x(:,2)), L1*sin(data.ffw.x(:,2)));
plot(ax1, L1*cos(data.ffw.x(:,2))+L2*cos(data.ffw.x(:,2)+data.ffw.x(:,3)),...
    L1*sin(data.ffw.x(:,2))+L2*sin(data.ffw.x(:,2)+data.ffw.x(:,3)));
plot(ax1,data.ffw.path_ref(1:3:end,1), data.ffw.path_ref(1:3:end,2), 'k--')
legend('Arm 1', 'Arm2', 'Referenz')
axis([-0.1 0.6 -0.6 0.6])
title('Endeffektor')
xlabel(ax1, 'Zeit t')
ylabel(ax1, 'Torque')

%plot q1
ax2 = subplot(4,4,3);

plot(ax2, data.ffw.t, data.ffw.x(:,1))

title('qm1')
xlabel(ax2, 'Zeit t')
ylabel(ax2, 'Winkel in Rad')

%plot q2
ax3 = subplot(4,4,4);

plot(ax3, data.ffw.t, data.ffw.x(:,2))

title('q1')
xlabel(ax3, 'Zeit t')
ylabel(ax3, 'Winkel in Rad')

%plot q3
ax4 = subplot(4,4,[7 8]);

plot(ax4, data.ffw.t, data.ffw.x(:,3))
title('q2')
xlabel(ax4, 'Zeit t')
ylabel(ax4, 'Winkel in Rad')

%plot u1
ax6 = subplot(4,4, [11 12]);

plot(ax6, data.ffw.t, data.ffw.u(:,1))

title('Input u1')
xlabel(ax6, 'Zeit t')
ylabel(ax6, 'Torque')

%plot u2
ax7 = subplot(4, 4, [15 16]);

plot(ax7, data.ffw.t, data.ffw.u(:,2))

title('Input u2')
xlabel(ax6, 'Zeit t')
ylabel(ax6, 'Torque')



end