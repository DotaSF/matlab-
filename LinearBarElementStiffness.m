function y = LinearBarElementStiffness(E,A,L)
%���նȾ���
y = [E*A/L -E*A/L;-E*A/L E*A/L];