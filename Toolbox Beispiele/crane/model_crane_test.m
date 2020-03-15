function F = model_crane_test(t,x,u,parameters,t_vector_ode)
    %ODE Compatibility Function
    if nargin==5
        u=ffw_toolbox_ode45_model_patcher(t,u,t_vector_ode);
    end
    %Parameter mapping
    tau_s=parameters(1);
    tau_l=parameters(2);
    g=parameters(3);
    %Input mapping
    u_s=u(1);
    u_l=u(2);
    %substitute to a first order ODE
    for i=1:3
        F(i)=x(i+3);
    end
    %Equations of motion
    F(4)=(-x(4)+u_s)/tau_s;
    F(5)=(-x(5)+u_l)/tau_l;
    F(6)=(-2*x(5)*x(6)-g*sin(x(3))-cos(x(3))*(u_s-x(4))/tau_s)/x(2);
end