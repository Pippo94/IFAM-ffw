function [path]=path_file_Modell_4dof_Testkreis(type,t,t_max,p0pf)
  
    % Daten für Kreisbahn
    f = 0.85; % Mittelpunkt des Kreises bei .x% des Radius r aus p0pf
    
    R = p0pf(1);
    r = R*(1-f); % Radius des Teskreises
    q = p0pf(2); 
    
    %Path function
    s = (t^5*(70*t^4 - 315*t^3*t_max + 540*t^2*t_max^2 - 420*t*t_max^3 + 126*t_max^4))/t_max^9;
    zd=zeros(2,1);
    
   
    if type==1
        w = 2*pi; 
        
        zd = [cos(q)*f*R+cos(w*s+q)*r;...
                 sin(q)*f*R+sin(w*s+q)*r];
                 
    end
    path=zd;
end