function x = gauss_seidel_x(A,B,x0,Err)
% A为方程组系数
% B为方程组值
% x0为初值
% Err求解精度
D = diag(diag(A)); % 提取A中
L = -tril(A)+D;    % 求下三角矩阵
U = -triu(A)+D;    % 求上三角矩阵
DL = D-L;     
A_DL = inv(DL);    % 求逆
x = A_DL*U*x0+A_DL*B;   
while norm(x-x0)>Err   % d当两次计算结果2范数小于Err退出循环体
    x=x0;
    x0 = A_DL*U*x+A_DL*B;   
end
