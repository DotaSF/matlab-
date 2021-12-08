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
fprintf('����նȾ���Ϊ��\n')
disp(K)
fprintf('�ڵ�2λ�ƣ�%f\n',U(2))
fprintf('�ڵ�3λ�ƣ�%f\n',U(3))
fprintf('�ڵ�4λ�ƣ�%f\n',U(4))
fprintf('�ڵ�1֧������%f\n',F(1))
fprintf('����1����Fk1��%f\n',Fk1)
fprintf('����2��3����Fk2��%f\n',Fk2)
fprintf('����4����Fk3��%f\n',Fk3)