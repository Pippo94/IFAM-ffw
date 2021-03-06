function f_t = Modell_3dof_smblsh(t,in2,in3,parameter,t_ode)
%MODELL_3DOF_SMBLSH
%    F_T = MODELL_3DOF_SMBLSH(T,IN2,IN3,PARAMETER,T_ODE)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    28-Feb-2020 16:04:32

dq1 = in2(4,:);
dq2 = in2(5,:);
dq3 = in2(6,:);
q1 = in2(1,:);
q2 = in2(2,:);
q3 = in2(3,:);
u1 = in3(1,:);
u2 = in3(2,:);
t2 = q1-q2;
t3 = t2.^2;
t4 = sin(q3);
t5 = t3.^2;
t6 = t5.*6.735510957298393e9;
t7 = tanh(t6);
t8 = q2.*(6.27e2./2.0);
t9 = q1.*2.864788975654116e2;
t51 = q2.*2.864788975654116e2;
t10 = t9-t51;
t11 = tanh(t10);
t12 = t11.*pi.*(2.09e2./6.0e2);
t50 = q1.*(6.27e2./2.0);
t13 = t8+t12-t50;
t14 = sin(q2);
t15 = q2+q3;
t16 = cos(t15);
t17 = dq2.^2;
t18 = cos(q2);
t19 = cos(q3);
t20 = dq3.^2;
t21 = sin(t15);
t22 = t19.^2;
t23 = t22.*1.285377882027458e58;
t24 = t23-1.602335986409662e59;
t25 = 1.0./t24;
t26 = t19.*1.539838849612756e36;
t27 = t26+8.531696485319416e35;
t28 = t4.*t18.*3.88934e-2;
t29 = t14.*t19.*3.88934e-2;
t30 = t16.*t17.*3.7834046692607e-2;
t31 = t16.*t20.*3.7834046692607e-2;
t32 = t17.*t18.*(6.1e1./2.0e2);
t33 = dq2.*dq3.*t16.*7.566809338521401e-2;
t34 = t30+t31+t32+t33;
t35 = t18.*t19.*3.88934e-2;
t36 = t14.*t17.*(6.1e1./2.0e2);
t37 = t17.*t21.*3.7834046692607e-2;
t38 = t20.*t21.*3.7834046692607e-2;
t39 = dq2.*dq3.*t21.*7.566809338521401e-2;
t40 = t36+t37+t38+t39;
t41 = dq3.*(6.0./1.25e2);
t42 = t28+t29;
t43 = t34.*t42;
t57 = t4.*t14.*3.88934e-2;
t44 = t35-t57;
t45 = t41+t43-t40.*t44;
t46 = t19.*2.405998202519931e41;
t47 = t46+2.77327796509712e42;
t48 = dq2.*1.6171875e-1;
t49 = q2.*(3.3e1./2.0);
t52 = t7.*t13;
t53 = t14.*3.1354e-1;
t54 = t28+t29+t53;
t55 = t34.*t54;
t56 = t18.*3.1354e-1;
f_t = [dq1;dq2;dq3;dq1.*(-9.990722900164133e1)-q1.*1.177478056090773e4+q2.*1.177478056090773e4+u1.*7.136230642974381e2+t7.*t13.*7.136230642974381e2;((q1.*(-3.3e1./2.0)+t48+t49+t52+t55-t40.*(t35+t56-t4.*t14.*3.88934e-2)).*-6.003647673769171e59)./(t4.^2.*1.285377882027458e58+1.473798198206916e59)-t25.*t27.*t45.*7.0368744177664e23+t25.*t27.*u2.*7.0368744177664e23;t25.*t27.*(q1.*(-3.3e1./2.0)+t48+t49+t52+t55-t40.*(t35+t56-t57)).*-7.0368744177664e23+t25.*t45.*t47.*9.007199254740992e18-t25.*t47.*u2.*9.007199254740992e18];
