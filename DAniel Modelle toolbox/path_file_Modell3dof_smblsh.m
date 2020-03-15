function [path]=path_file_Modell3dof_smblsh(type,t,t_max,p0pf)
    %Mapping
    p0=p0pf(1:3);
    pf=p0pf(4:6);
    %Path function
    s = (t^5*(70*t^4 - 315*t^3*t_max + 540*t^2*t_max^2 - 420*t*t_max^3 + 126*t_max^4))/t_max^9;
    zd=zeros(2,1);
    %straight line
    if type==1
        w = 2*pi/4; %soll nach 90grad enden!
        
        %p0(1) sollte L1+L2 entsprechen!!
        zd = [p0(1)*cos(w*s);...
                 p0(1)*sin(w*s);...
                 -p0(1)*w*sin(w*s);...
                 p0(1)*w*cos(w*s)];
    end
    path=zd.';
end