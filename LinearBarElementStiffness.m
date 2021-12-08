function y = LinearBarElementStiffness(E,A,L)
%µ•∏’∂»æÿ’Û
y = [E*A/L -E*A/L;-E*A/L E*A/L];