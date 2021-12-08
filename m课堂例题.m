k = SpringElementStiffness(120)

n = 5;
K = zeros(n,n);
K = SpringAssemble(K,k,1,2)
K = SpringAssemble(K,k,2,3)
K = SpringAssemble(K,k,3,5)
K = SpringAssemble(K,k,4,5)
K = SpringAssemble(K,k,2,4)
K = SpringAssemble(K,k,2,4)
U = zeros(5,1);
F = [0;0;20];
KK = K;
K = K(2:4,2:4);
U = K\F
U = [0;U;];
F = KK*U