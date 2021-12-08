k = SpringElementStiffness(170);
n = 4;
K = zeros(n,n);
K = SpringAssemble(K,k,1,2);
K = SpringAssemble(K,k,2,3);
K = SpringAssemble(K,k,2,3);
K = SpringAssemble(K,k,3,4)
U = zeros(4,1);
F = [0;0;25];
KK = K;
K = K(2:4,2:4);
U = K\F;
U = [0;U]
F = KK*U
Fk1 = U(2)*170;
Fk2 = (U(3)-U(2))*170;
Fk3 = (U(4)-U(3))*170;
fprintf('整体刚度矩阵为：\n')
disp(K)
fprintf('节点2位移：%f\n',U(2))
fprintf('节点3位移：%f\n',U(3))
fprintf('节点4位移：%f\n',U(4))
fprintf('节点1支反力：%f\n',F(1))
fprintf('弹簧1内力Fk1：%f\n',Fk1)
fprintf('弹簧2和3内力Fk2：%f\n',Fk2)
fprintf('弹簧4内力Fk3：%f\n',Fk3)