function jacobi = MKS_4dof_jacobi(in1,in2,in3,in4,in5,step_size_sym)
%MKS_4DOF_JACOBI
%    JACOBI = MKS_4DOF_JACOBI(IN1,IN2,IN3,IN4,IN5,STEP_SIZE_SYM)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    09-Apr-2020 10:43:05

parameters_sym2 = in5(:,2);
parameters_sym3 = in5(:,3);
parameters_sym4 = in5(:,4);
parameters_sym5 = in5(:,5);
parameters_sym6 = in5(:,6);
parameters_sym7 = in5(:,7);
parameters_sym8 = in5(:,8);
parameters_sym9 = in5(:,9);
parameters_sym10 = in5(:,10);
parameters_sym11 = in5(:,11);
parameters_sym12 = in5(:,12);
parameters_sym13 = in5(:,13);
parameters_sym14 = in5(:,14);
u2 = in3(2,:);
x_next1 = in1(1,:);
x_next2 = in1(2,:);
x_next3 = in1(3,:);
x_next4 = in1(4,:);
x_next5 = in1(5,:);
x_next6 = in1(6,:);
x_next7 = in1(7,:);
x_next8 = in1(8,:);
t2 = 1.0./step_size_sym;
t3 = 1.0./parameters_sym5;
t4 = parameters_sym11.*t3;
t5 = parameters_sym9.^2;
t6 = parameters_sym10.^2;
t7 = sin(x_next4);
t8 = parameters_sym8.*4.0;
t9 = parameters_sym4.*t6;
t10 = parameters_sym7.*parameters_sym8.*1.6e1;
t11 = parameters_sym2.*parameters_sym8.*t5.*1.6e1;
t12 = parameters_sym3.*parameters_sym8.*t5.*4.0;
t13 = parameters_sym4.*parameters_sym7.*t6.*4.0;
t14 = parameters_sym4.*parameters_sym8.*t5.*1.6e1;
t15 = parameters_sym4.^2;
t16 = cos(x_next4);
t17 = parameters_sym2.*parameters_sym4.*t5.*t6.*4.0;
t18 = parameters_sym3.*parameters_sym4.*t5.*t6;
t19 = t7.^2;
t20 = t5.*t6.*t15.*t19.*4.0;
t21 = t10+t11+t12+t13+t14+t17+t18+t20;
t22 = 1.0./t21;
t23 = t8+t9;
t24 = parameters_sym11.*t22.*t23.*4.0;
t25 = parameters_sym4.*parameters_sym9.*parameters_sym10.*t16.*2.0;
t26 = t8+t9+t25;
t27 = x_next3+x_next4;
t28 = sin(t27);
t29 = (parameters_sym10.*t28.*x_next7)./2.0;
t30 = (parameters_sym10.*t28.*x_next8)./2.0;
t31 = t29+t30;
t32 = cos(t27);
t33 = (parameters_sym10.*t32.*x_next8)./2.0;
t34 = t31.*x_next8;
t35 = (parameters_sym10.*t32.*x_next7)./2.0;
t36 = t33+t35;
t37 = t36.*x_next8;
t38 = t5.*t6.*t15.*4.0;
t39 = t16.^2;
t69 = t5.*t6.*t15.*t39.*4.0;
t40 = t10+t11+t12+t13+t14+t17+t18+t38-t69;
t41 = 1.0./t40;
t42 = (parameters_sym10.*t32)./2.0;
t43 = cos(x_next3);
t44 = parameters_sym9.*t43;
t45 = t42+t44;
t46 = t36.*x_next7;
t47 = t37+t46;
t48 = (parameters_sym10.*t28)./2.0;
t49 = sin(x_next3);
t50 = parameters_sym9.*t49;
t51 = t48+t50;
t52 = t31.*x_next7;
t53 = t34+t52;
t54 = t45.*x_next7;
t55 = t33+t54;
t56 = t55.*x_next7;
t57 = t37+t56;
t58 = (parameters_sym4.*parameters_sym10.*t32.*t57)./2.0;
t59 = t51.*x_next7;
t60 = t30+t59;
t61 = t60.*x_next7;
t62 = t34+t61;
t63 = (parameters_sym4.*parameters_sym10.*t28.*t62)./2.0;
t64 = 1.0./parameters_sym6;
t65 = parameters_sym6.*parameters_sym8.*1.6e1;
t66 = parameters_sym4.*parameters_sym6.*t6.*4.0;
t67 = t10+t11+t12+t13+t14+t17+t18+t20+t65+t66;
t68 = parameters_sym13.*t22.*t64.*t67;
t70 = x_next2-x_next4;
t71 = parameters_sym13.*t70;
t72 = x_next6-x_next8;
t73 = parameters_sym14.*t72;
t74 = (parameters_sym4.*parameters_sym10.*t32.*t62)./2.0;
t91 = x_next8./2.5e1;
t92 = (parameters_sym4.*parameters_sym10.*t28.*t57)./2.0;
t75 = t71+t73+t74-t91-t92;
t76 = x_next6./1.25e2;
t77 = t71+t73+t76;
t78 = 1.0./t21.^2;
t79 = t45.*x_next7.*2.0;
t80 = parameters_sym10.*t32.*x_next8;
t81 = t79+t80;
t82 = t51.*x_next7.*2.0;
t83 = parameters_sym10.*t28.*x_next8;
t84 = t82+t83;
t85 = parameters_sym10.*t32.*x_next7;
t86 = t80+t85;
t87 = parameters_sym10.*t28.*x_next7;
t88 = t83+t87;
t118 = (parameters_sym4.*parameters_sym10.*t28.*t53)./2.0;
t119 = (parameters_sym4.*parameters_sym10.*t32.*t47)./2.0;
t89 = parameters_sym13+t58+t63-t118-t119;
t90 = t26.*t41.*t89.*4.0;
t93 = parameters_sym4.*parameters_sym9.*parameters_sym10.*t7.*t41.*t75.*8.0;
t94 = x_next1-x_next3;
t95 = parameters_sym11.*t94;
t96 = x_next5-x_next7;
t97 = parameters_sym12.*t96;
t98 = parameters_sym4.*t45.*t62;
t126 = x_next7.*1.6171875e-1;
t127 = parameters_sym4.*t51.*t57;
t99 = t95+t97+t98-t126-t127;
t100 = 1.0./t40.^2;
t101 = t5.*t6.*t7.*t15.*t16.*t26.*t75.*t100.*3.2e1;
t102 = parameters_sym12.*t22.*t23.*4.0;
t103 = parameters_sym14+1.0./1.25e2;
t104 = (parameters_sym4.*parameters_sym10.*t28.*t81)./2.0;
t128 = (parameters_sym4.*parameters_sym10.*t32.*t84)./2.0;
t105 = t104-t128;
t106 = t26.*t41.*t105.*4.0;
t107 = parameters_sym4.*t51.*t81;
t129 = parameters_sym4.*t45.*t84;
t108 = parameters_sym12+t107-t129+1.6171875e-1;
t109 = (parameters_sym4.*parameters_sym10.*t28.*t86)./2.0;
t132 = (parameters_sym4.*parameters_sym10.*t32.*t88)./2.0;
t110 = parameters_sym14+t109-t132+1.0./2.5e1;
t111 = t26.*t41.*t110.*4.0;
t112 = parameters_sym4.*t45.*t88;
t131 = parameters_sym4.*t51.*t86;
t113 = t112-t131;
t114 = t22.*t23.*t113.*4.0;
t115 = parameters_sym13.*t26.*t41.*4.0;
t116 = parameters_sym11.*t26.*t41.*4.0;
t117 = t58+t63-parameters_sym4.*t45.*t47-parameters_sym4.*t51.*t53;
t120 = parameters_sym7.*4.0;
t121 = parameters_sym2.*t5.*4.0;
t122 = parameters_sym3.*t5;
t123 = parameters_sym4.*t5.*4.0;
t124 = parameters_sym4.*parameters_sym9.*parameters_sym10.*t16.*4.0;
t125 = t8+t9+t120+t121+t122+t123+t124;
t130 = parameters_sym14.*t26.*t41.*4.0;
t133 = parameters_sym10.*t32;
jacobi = reshape([t2,0.0,0.0,0.0,t4,t24,-t24,t116,0.0,0.0,0.0,t2,0.0,0.0,0.0,t68-parameters_sym13.*t26.*t41.*4.0,t115-parameters_sym13.*t22.*t23.*4.0,t115-parameters_sym13.*t41.*t125.*4.0,0.0,0.0,0.0,0.0,t2,0.0,-t4,-t24,t24,-t116,-t50-parameters_sym10.*t28,t44+t133,0.0,0.0,0.0,t2,0.0,-t68+t90+t93+t101-t22.*t23.*t117.*4.0-t5.*t6.*t7.*t15.*t16.*t22.*t64.*u2.*8.0+t5.*t6.*t7.*t15.*t16.*t22.*t64.*t77.*8.0-t5.*t6.*t7.*t15.*t16.*t23.*t78.*t99.*3.2e1-t5.*t6.*t7.*t15.*t16.*t64.*t67.*t77.*t78.*8.0+t5.*t6.*t7.*t15.*t16.*t64.*t67.*t78.*u2.*8.0,-t90-t93-t101+parameters_sym13.*t22.*t23.*4.0+t22.*t23.*t117.*4.0-t5.*t6.*t7.*t15.*t16.*t23.*t78.*u2.*3.2e1+t5.*t6.*t7.*t15.*t16.*t23.*t77.*t78.*3.2e1+t5.*t6.*t7.*t15.*t16.*t23.*t78.*t99.*3.2e1,-t115-t26.*t41.*t117.*4.0+t41.*t89.*t125.*4.0+parameters_sym4.*parameters_sym9.*parameters_sym10.*t7.*t41.*t75.*1.6e1-parameters_sym4.*parameters_sym9.*parameters_sym10.*t7.*t41.*t77.*8.0-parameters_sym4.*parameters_sym9.*parameters_sym10.*t7.*t41.*t99.*8.0+parameters_sym4.*parameters_sym9.*parameters_sym10.*t7.*t41.*u2.*8.0+t5.*t6.*t7.*t15.*t16.*t26.*t100.*u2.*3.2e1-t5.*t6.*t7.*t15.*t16.*t26.*t77.*t100.*3.2e1-t5.*t6.*t7.*t15.*t16.*t26.*t99.*t100.*3.2e1+t5.*t6.*t7.*t15.*t16.*t75.*t100.*t125.*3.2e1,-parameters_sym10.*t28,t133,-1.0,0.0,0.0,0.0,t2+t3.*(parameters_sym12+7.0./5.0e1),t102,-t102,parameters_sym12.*t26.*t41.*4.0,0.0,0.0,0.0,-1.0,0.0,0.0,0.0,t2-parameters_sym14.*t26.*t41.*4.0+t22.*t64.*t67.*t103,t130-t22.*t23.*t103.*4.0,parameters_sym14.*t41.*t125.*-4.0+t26.*t41.*t103.*4.0,0.0,0.0,0.0,0.0,-1.0,0.0,-parameters_sym12.*t3,t106-t22.*t23.*t108.*4.0,t2-t106+t22.*t23.*t108.*4.0,t26.*t41.*t108.*-4.0+t41.*t105.*t125.*4.0,0.0,0.0,0.0,0.0,0.0,-1.0,0.0,t111+t114-parameters_sym14.*t22.*t64.*t67,-t111-t114+parameters_sym14.*t22.*t23.*4.0,t2-t130+t41.*t110.*t125.*4.0+t26.*t41.*(t112-t131).*4.0,0.0,0.0,0.0,0.0,0.0,0.0,-t3,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t22.*t64.*t67,t22.*t23.*4.0,t26.*t41.*-4.0,0.0,0.0],[10,10]);