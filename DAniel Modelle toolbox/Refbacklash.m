function [F_n, c_n] = Refbacklash(c1,d1,d_b,p_b)
%BACKLASH Modelling of Backlash depending Torque
% p_b is percentage of deadzone stiffness

delta = sym('delta','real');
ddelta = sym('ddelta','real');

F_nt = piecewise(delta<=-d_b, c1*(delta+d_b)+d1*ddelta - c1*p_b*d_b,...
    -d_b<delta<d_b, c1*p_b*delta, delta>=d_b, c1*(delta-d_b)+d1*ddelta + c1*p_b*d_b);
F_n = piecewise(sign(F_nt)~=sign(delta),0,F_nt);

c_n = 0;