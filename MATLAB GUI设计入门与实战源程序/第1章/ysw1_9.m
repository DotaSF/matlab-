% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ������� 
x = 0:0.05:10;    % 0.05,0.1,0.15,0.2,����,10
y = exp(-x).*sin(x);       % ���߷���
plot(x,y,'r.-')   % ��ͼ
grid off; xlabel('x'); ylabel('y')
text(3,0.1,'e^{-t}sint');
text(5,0.1,'x~{\chi}_{\alpha}^{2}(2)');

%%
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ������� 
x = 0:0.05:10;    % 0.05,0.1,0.15,0.2,����,10
y = exp(-0.5*x).*sin(10*x);       % ���߷���
plot(x,y,'r.-')   % ��ͼ
grid off; xlabel('x'); ylabel('y')
text(4,0.6,'\int \geq  \otimes ');
text(5,0.5,'\neq \perp \Re');
text(6,0.4,'\downarrow \subset  \copyright');


