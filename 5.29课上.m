%���ڷ������֪λ����
%  F����-��֪�����������ж�ӦK������е�ֵ
k1 = LinearBarElementStiffness(210,0.003,1.5);
k2 = LinearBarElementStiffness(210,0.003,1);
n = 3;
K = zeros(n,n);
K = SpringAssemble(K,k1,1,2);
K = SpringAssemble(K,k2,2,3);
U = zeros(3,1);
KK = K;
FF = KK*[0;0;0.002]
Kk = K(2,2);
Ff = [10-0.002*K(2,3)]
U = Kk\Ff;
U = [0;U;0.002]
F = KK*U