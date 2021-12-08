r = 1;
H = 3;
a = 0:0.01:1;
b = 1:0.01:2;
c = 2:0.01:3;
height = 0:0.01:3;
for h = 1:length(height)
    for i = 1:length(a)
        switch height(h)
            case a(i)
                V(h) = 1/3*pi*height(h)^2*(3*r-height(h))
        end
    end
    for i = 1:length(b)
        switch height(h)
            case b(i)
                V(h) = 2/3*pi*r^3+pi*r^2*(height(h)-r)
        end
    end
    for i = 1:length(c)
        switch height(h)
            case c(i)
                V(h) = 1/3*pi*height(h)^2*(3*r-height(h))
        end
    end
end
plot(height,V)
        