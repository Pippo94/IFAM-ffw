function jacobi = Modell_3dof_smblsh_jacobi(in1,in2,in3,in4,in5,step_size_sym)
%MODELL_3DOF_SMBLSH_JACOBI
%    JACOBI = MODELL_3DOF_SMBLSH_JACOBI(IN1,IN2,IN3,IN4,IN5,STEP_SIZE_SYM)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    19-Mar-2020 12:56:02

parameters_sym1 = in5(1,:);
parameters_sym2 = in5(2,:);
u2 = in3(2,:);
x_next1 = in1(1,:);
x_next2 = in1(2,:);
x_next3 = in1(3,:);
x_next5 = in1(5,:);
x_next6 = in1(6,:);
t2 = 1.0./step_size_sym;
t3 = x_next1-x_next2;
t4 = t3.^2;
t9 = x_next1.*2.864788975654116e2;
t10 = x_next2.*2.864788975654116e2;
t11 = t9-t10;
t5 = tanh(t11);
t6 = t4.^2;
t7 = t6.*6.735510957298393e9;
t8 = tanh(t7);
t12 = t5.^2;
t13 = t12.*2.864788975654116e2;
t14 = t13-2.864788975654116e2;
t15 = t14.*pi.*(2.09e2./6.0e2);
t16 = t15+6.27e2./2.0;
t17 = t8.*t16.*7.136230642974381e2;
t18 = t8.^2;
t19 = t18-1.0;
t20 = x_next2.*(6.27e2./2.0);
t21 = t5.*pi.*(2.09e2./6.0e2);
t25 = x_next1.*(6.27e2./2.0);
t22 = t20+t21-t25;
t23 = t3.*t4.*t19.*t22.*1.9226463875825e13;
t24 = sin(x_next3);
t26 = t24.^2;
t27 = t26.*1.285377882027458e58;
t28 = t27+1.473798198206916e59;
t29 = 1.0./t28;
t30 = t8.*t16.*6.003647673769171e59;
t31 = t3.*t4.*t19.*t22.*1.61750538761725e70;
t32 = t30+t31+9.906018661719133e60;
t33 = cos(x_next2);
t34 = x_next5.^2;
t35 = x_next2+x_next3;
t36 = cos(t35);
t37 = t34.*t36.*3.7834046692607e-2;
t38 = x_next6.^2;
t39 = t36.*t38.*3.7834046692607e-2;
t40 = t36.*x_next5.*x_next6.*7.566809338521401e-2;
t41 = cos(x_next3);
t42 = t33.*t41.*3.88934e-2;
t43 = sin(x_next2);
t44 = sin(t35);
t45 = t34.*t44.*3.7834046692607e-2;
t46 = t38.*t44.*3.7834046692607e-2;
t47 = t44.*x_next5.*x_next6.*7.566809338521401e-2;
t48 = t24.*t33.*3.88934e-2;
t49 = t41.*t43.*3.88934e-2;
t50 = t41.^2;
t51 = t50.*1.285377882027458e58;
t52 = t51-1.602335986409662e59;
t53 = 1.0./t52;
t54 = t48+t49;
t55 = t33.*t34.*(6.1e1./2.0e2);
t56 = t37+t39+t40+t55;
t60 = t24.*t43.*3.88934e-2;
t57 = t42-t60;
t58 = t34.*t43.*(6.1e1./2.0e2);
t59 = t45+t46+t47+t58;
t61 = t37+t39+t40;
t62 = t45+t46+t47;
t63 = t43.*3.1354e-1;
t64 = t48+t49+t63;
t65 = t33.*3.1354e-1;
t66 = t41.*1.539838849612756e36;
t67 = t66+8.531696485319415e35;
t68 = 1.0./t52.^2;
t69 = x_next6.*(6.0./1.25e2);
t70 = t54.*t56;
t86 = t57.*t59;
t71 = t69+t70-t86;
t72 = t42-t60+t65;
t73 = t44.*x_next5.*7.566809338521401e-2;
t74 = t44.*x_next6.*7.566809338521401e-2;
t75 = t43.*x_next5.*(6.1e1./1.0e2);
t76 = t73+t74+t75;
t77 = t36.*x_next5.*7.566809338521401e-2;
t78 = t36.*x_next6.*7.566809338521401e-2;
t79 = t33.*x_next5.*(6.1e1./1.0e2);
t80 = t77+t78+t79;
t81 = t77+t78;
t82 = t73+t74;
t83 = t8.*t16;
t84 = t3.*t4.*t19.*t22.*2.694204382919357e10;
t85 = t83+t84+3.3e1./2.0;
t87 = t56.*t57;
t88 = t54.*t59;
t89 = t87+t88-t54.*t62-t57.*t61;
t90 = x_next2.*(3.3e1./2.0);
t91 = x_next5.*1.6171875e-1;
t92 = t8.*t22;
t93 = t56.*t64;
t94 = t90+t91+t92+t93-x_next1.*(3.3e1./2.0)-t59.*t72;
t95 = t41.*2.405998202519931e41;
t96 = t95+2.77327796509712e42;
t97 = t57.*t76;
t98 = t97-t54.*t80;
t99 = t54.*t81;
t100 = t99-t57.*t82+6.0./1.25e2;
t101 = parameters_sym2.*t36;
jacobi = reshape([t2,0.0,0.0,t17+t23+1.177478056090773e4,-t29.*t32,t53.*t67.*t85.*-7.0368744177664e23,0.0,0.0,0.0,t2,0.0,-t17-t23-1.177478056090773e4,t29.*t32,t53.*t67.*t85.*7.0368744177664e23,-parameters_sym1.*t43-parameters_sym2.*t44,t101+parameters_sym1.*t33,0.0,0.0,t2,0.0,t29.*(t54.*t59.*6.003647673769171e59+t56.*t57.*6.003647673769171e59-t62.*t64.*6.003647673769171e59-t61.*(t42+t65-t24.*t43.*3.88934e-2).*6.003647673769171e59)-t24.*t53.*t71.*1.083565260832285e60+t53.*t67.*t89.*7.0368744177664e23+t24.*t53.*u2.*1.083565260832285e60-t24.*1.0./t28.^2.*t41.*(x_next1.*-9.906018661719133e60+x_next2.*9.906018661719133e60+x_next5.*9.709023972423582e58+t8.*t22.*6.003647673769171e59+t56.*t64.*6.003647673769171e59-t59.*t72.*6.003647673769171e59).*2.570755764054916e58+t24.*t41.*t67.*t68.*t71.*1.809008547040355e82-t24.*t41.*t67.*t68.*u2.*1.809008547040355e82,t53.*t67.*(t87+t88-t62.*t64-t61.*t72).*7.0368744177664e23+t24.*t53.*t71.*2.167130521664569e60-t24.*t53.*t94.*1.083565260832285e60-t53.*t89.*t96.*9.007199254740992e18-t24.*t53.*u2.*2.167130521664569e60+t24.*t41.*t67.*t68.*t94.*1.809008547040355e82-t24.*t41.*t68.*t71.*t96.*2.315530940211655e77+t24.*t41.*t68.*t96.*u2.*2.315530940211655e77,-parameters_sym2.*t44,t101,-1.0,0.0,0.0,t2+9.990722900164133e1,0.0,0.0,0.0,0.0,0.0,-1.0,0.0,0.0,t2+t29.*(t64.*t80.*6.003647673769171e59-t72.*t76.*6.003647673769171e59+9.709023972423582e58)-t53.*t67.*t98.*7.0368744177664e23,t53.*t67.*(t64.*t80-t72.*t76+1.6171875e-1).*7.0368744177664e23+t53.*t96.*t98.*9.007199254740992e18,0.0,0.0,0.0,0.0,-1.0,0.0,t29.*(t64.*t81.*6.003647673769171e59-t72.*t82.*6.003647673769171e59)+t53.*t67.*t100.*7.0368744177664e23,t2+t53.*t67.*(t64.*t81-t72.*t82).*7.0368744177664e23-t53.*t96.*t100.*9.007199254740992e18,0.0,0.0,0.0,0.0,0.0,-7.136230642974381e2,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t53.*t67.*-7.0368744177664e23,t53.*t96.*9.007199254740992e18,0.0,0.0],[8,8]);
