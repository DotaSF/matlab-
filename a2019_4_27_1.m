r = 1;
H = 3;
h = 0:0.001:3;

for i = 1:length(h)
    if h(i)<r
        V(i) = 1/3*pi*h(i)^2*(3*r-h(i))
    elseif h[i]>H-r
        V(i) = 1/3*pi*h(i)^2*(3*r-h(i))
    else
        V(i) = 2/3*pi*r^3+pi*r^2*(h(i)-r)
    end
end
plot(h,V)