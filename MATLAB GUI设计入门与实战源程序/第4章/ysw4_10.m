clc,clear,close all % ���
warning off         % ȡ������
feature jit off     % ���ٴ���ִ��
x=-8:0.5:8;               % ��������
[XX,YY]=meshgrid(x);
r=sqrt(XX.^2+YY.^2)+eps;
Z=sin(r)./r;
figure('color',[1,1,1])
surf(Z);                   %������
theAxes=axis;              %��������ֵ��ʹ������֡����ͬһ����ϵ��
fmat=moviein(20);          %����һ�������ľ��󣬱���20��
for j=1:30;                %ѭ��������������
    surf(sin(2*pi*j/20)*Z,Z)      %����ÿһ��������
    axis(theAxes)                 %ʹ����ͬ������ϵ
    fmat(:,j)=getframe;           %������������fmat��
end            
% movie(fmat,10)


