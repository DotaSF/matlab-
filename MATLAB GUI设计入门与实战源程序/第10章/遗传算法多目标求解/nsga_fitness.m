function  fitnessfcn=nsga_fitness(x)

% Ackleyº¯Êý
fitnessfcn(1) = -20*exp(-0.2*sqrt((x(1)^2+x(2)^2)/2))-exp((cos(2*pi*x(1))+cos(2*pi*x(2)))/2)+20+2.71289;
% Rastriginº¯Êý
fitnessfcn(2) = sum(x .^ 2 - 10 .* cos(2 .* pi .* x) + 10, 2);

end
