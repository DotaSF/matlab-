function  [c, ceq] = non_constraint(x)
c=(x(1)-1)^2-x(2); % 不等式约束
ceq=[0];           % 无等式约束
end

