function jd = jacobd(ja,y,yd)
[m,n] = size(ja);
jd = sym('jd',[m n]);
for i=1:m
    for j=1:n
        jd(i,j)=jacobian(ja(i,j),y)*yd;
    end
end
end