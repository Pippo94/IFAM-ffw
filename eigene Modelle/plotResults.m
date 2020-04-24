function [] = plotResults(data)
close all
L1 = data.system.parameters(9);
L2 = data.system.parameters(10);

figure(1)

ax1 = subplot(4,4, [1 2 5 6 9 10 13 14]);

hold on
plot(ax1, L1*cos(data.sim_ffw.x(:,3)), L1*sin(data.sim_ffw.x(:,3)));
plot(ax1, L1*cos(data.sim_ffw.x(:,3))+L2*cos(data.sim_ffw.x(:,3)+data.sim_ffw.x(:,4)),...
    L1*sin(data.sim_ffw.x(:,3))+L2*sin(data.sim_ffw.x(:,3)+data.sim_ffw.x(:,4)));
plot(ax1,data.ffw.path_ref(1:3:end,1), data.ffw.path_ref(1:3:end,2), 'k--')
axis([-0.1 0.6 -0.6 0.6])
legend('Arm 1', 'Arm2', 'Referenz')

title('Endeffektor')
xlabel(ax1, 'Zeit t')
ylabel(ax1, 'Torque')

%plot q1
ax2 = subplot(4,4,3);

plot(ax2, data.ffw.t, data.ffw.x(:,1))
title('qm1')
xlabel(ax2, 'Zeit t')
ylabel(ax2, 'Winkel  in rad')

%plot q2
ax3 = subplot(4,4,4);

plot(ax3, data.ffw.t, data.ffw.x(:,2))
title('qm2')
xlabel(ax3, 'Zeit t')
ylabel(ax3, 'Winkel  in rad')

%plot q3
ax4 = subplot(4,4,7);

plot(ax4, data.ffw.t, data.ffw.x(:,3))
title('q1')
xlabel(ax4, 'Zeit t')
ylabel(ax4, 'Winkel  in rad')

%plot q4
ax5 = subplot(4,4,8);

plot(ax5, data.ffw.t, data.ffw.x(:,4))
title('q2')
xlabel(ax5, 'Zeit t')
ylabel(ax5, 'Winkel  in rad')

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
xlabel(ax7, 'Zeit t')
ylabel(ax7, 'Torque')



end