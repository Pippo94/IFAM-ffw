function [path]=path_file_crane_test(type,t,t_max,p0pf)
    %Mapping
    p0=p0pf(1:3);
    pf=p0pf(4:6);
    %Path function
    s = (t^5*(70*t^4 - 315*t^3*t_max + 540*t^2*t_max^2 - 420*t*t_max^3 + 126*t_max^4))/t_max^9;
    zd=zeros(2,1);
    %straight line
    if type==1
        f = p0 + s * (pf - p0);
        zd = [1,0,0;0,0,1] * f;
    end
    path=zd.';
end