function [I,step]=Roberg(f,a,b,eps)
%��������ַ�
% I:    ����ֵ
% step: ���ֻ��ֵ����������
%  f:   ������
%  a:   ��������
%  b:   ��������
%  eps: ���־���
if(nargin==3)   % ���ȱʡeps�������
    eps=1.0e-4; % Ĭ��ֵ
end;
M=1;           % ��ʼ��
tol=10;        % ǰ�����λ��ֲ�ֵ
k=0;           % ��ʼ��
T=zeros(1,1);  % ��ʼ��
h=b-a;         % �������䳤��
% ��������
T(1,1)=(h/2)*(subs(sym(f),findsym(sym(f)),a)+subs(sym(f),findsym(sym(f)),b)); %��ʼֵ

while tol>eps
    k=k+1;  % �±�
    h=h/2;  % ���䳤��
    Q=0;
    for i=1:M
        x=a+h*(2*i-1);
        Q=Q+subs(sym(f),findsym(sym(f)),x); % ����
    end
    T(k+1,1)=T(k,1)/2+h*Q;
    M=2*M;
    for j=1:k
        T(k+1,j+1)=T(k+1,j)+(T(k+1,j)-T(k,j))/(4^j-1); % ����T
    end
    tol=abs(T(k+1,j+1)-T(k,j));  % ǰ�����λ��ֲ�ֵ
end
I=T(k+1,k+1);
step=k;   % ���ֻ��ֵ����������
