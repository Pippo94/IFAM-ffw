function F_n = Smbacklash(c1,d1,p_cd,d_a,sw)
%BACKLASH2 Backlash with tanh
delta = sym('delta','real');
ddelta = sym('ddelta','real');

if sw == 0  % without damping
    F_n = (tanh(((1/d_a)*(delta))^4))*((1-p_cd)*c1*((delta)-d_a*(tanh((1/d_a)*(delta)))))+p_cd*c1*delta;
end

if sw == 1  % with damping
    F_n = (tanh(((1/d_a)*(delta))^4))*((1-p_cd)*c1*((delta)-d_a*(tanh((1/d_a)*(delta)))))+p_cd*c1*delta + d1*ddelta;
end


end

