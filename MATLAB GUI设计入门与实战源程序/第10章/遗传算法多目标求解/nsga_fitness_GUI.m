function  fitnessfcn=nsga_fitness_GUI(x)
global f1 f2
if f1==1 & f2==1
    % Ackley函数
    fitnessfcn(1) = -20*exp(-0.2*sqrt((x(1)^2+x(2)^2)/2))-exp((cos(2*pi*x(1))+cos(2*pi*x(2)))/2)+20+2.71289;
    % Rastrigin函数
    fitnessfcn(2) = sum(x .^ 2 - 10 .* cos(2 .* pi .* x) + 10, 2);
end
if f1==1 & f2==0
    % Ackley函数
    fitnessfcn(1) = -20*exp(-0.2*sqrt((x(1)^2+x(2)^2)/2))-exp((cos(2*pi*x(1))+cos(2*pi*x(2)))/2)+20+2.71289;
end
if f1==0 & f2==1 
    % Rastrigin函数
    fitnessfcn(1) = sum(x .^ 2 - 10 .* cos(2 .* pi .* x) + 10, 2);
end

end

