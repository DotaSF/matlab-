% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
format short
tic  % �����ʱ
m=20;  % �������е���
n=100; % ׶���е���
t=linspace(0,2*pi,n); % ��
r=linspace(0,1,m);    % �뾶
x=r'*cos(t);  % x
y=r'*sin(t);  % y
z1=sqrt(x.^2+y.^2); % �뾶
z2=1+sqrt(1+eps-x.^2-y.^2); % �����
X=[x;x];Y=[y;y]; % ��������
Z=[z1;z2];       % ��������
figure('color',[1,1,1])
mesh(X,Y,Z)  % 3D����
view(0,-18)  % �ӽ�
colormap([0 0 1]),axis off % ȡ������ʾ
toc  % ��ʱ����'

%% �����
% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
format short
tic  % �����ʱ
L=7; % �ظ��������
N=10000; % ����
for k=1:L
    P=rand(N,3);
    x=2*P(:,1)-1;
    y=2*P(:,2)-1;
    z=2*P(:,3);
    R2=x.^2+y.^2;
    R=sqrt(R2);   % �뾶
    II=find(z>=R&z<=1+sqrt(1-R2)); % ���㲻��ʽ
    m=length(II);
    q(k)=8*m/N;  % ���
end
error=q-pi % ���
figure('color',[1,1,1])
plot(x(II),y(II),'bp') % ����x,y��ͼ
toc  % ��ʱ����

