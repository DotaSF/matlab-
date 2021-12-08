function y = fun(x)

load('data.mat')
for i=1:length(dataflag)
    if dataflag(i,:)==x
        y=data(i,end);
    end
end









