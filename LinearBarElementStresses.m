function y = LinearBarElementStresses(k,u,A)
%求杆单元的力
y = k*u/A;