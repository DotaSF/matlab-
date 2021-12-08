function [x,n]=jacobi(A,b,x0,eps,varargin)
% ����Jacobi�����������Է�����Ax=b�Ľ�
% �������룺
% A�����Է������ϵ������
% b�����Է������еĳ�������
% x0��������ʼ����
% eps����ľ��ȿ���
% varargin��������������

% �������
% x�����Է�����Ľ�
% n��������辫�ȵĽ�ʵ�ʵĵ�������
if nargin==3
    eps= 1.0e-6; % ȱʡֵ
elseif nargin<3
    error('�������')  % �������
    return
elseif nargin ==5
    M  = varargin{1};
end  
M  = 500;   % ��������
    
D=diag(diag(A));	%��A�ĶԽǾ���
L=-tril(A,-1);   	%��A����������
U=-triu(A,1);   		%��A�������Ǿ���
B=D\(L+U);
f=D\b;
x=B*x0+f;
n=1;               	%��������
%��������
while norm(x-x0)>=eps
    x0=x;      % ��ֵ
    x =B*x0+f; % ֵ����
    n=n+1;
    if(n>=M)
        disp('Warning:��������̫�࣬���ܲ�������');
        return;
    end
end
