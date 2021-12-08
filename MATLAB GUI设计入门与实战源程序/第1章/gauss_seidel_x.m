function x = gauss_seidel_x(A,B,x0,Err)
% AΪ������ϵ��
% BΪ������ֵ
% x0Ϊ��ֵ
% Err��⾫��
D = diag(diag(A)); % ��ȡA��
L = -tril(A)+D;    % �������Ǿ���
U = -triu(A)+D;    % �������Ǿ���
DL = D-L;     
A_DL = inv(DL);    % ����
x = A_DL*U*x0+A_DL*B;   
while norm(x-x0)>Err   % d�����μ�����2����С��Err�˳�ѭ����
    x=x0;
    x0 = A_DL*U*x+A_DL*B;   
end
