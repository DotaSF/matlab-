function y = LinearBarAssemble(K,k,i,j)
%线性的加和
K(i,i) = K(i,i)+k(1,1);
K(i,j) = K(i,j)+k(1,2);
K(j,i) = K(j,i)+k(2,1);
K(j,j) = K(j,j)+k(2,2);
y = K;