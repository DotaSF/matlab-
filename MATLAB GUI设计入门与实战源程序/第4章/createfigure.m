function createfigure(xdata1, ydata1, zdata1)
%CREATEFIGURE(XDATA1, YDATA1, ZDATA1)
%  XDATA1:  surface xdata
%  YDATA1:  surface ydata
%  ZDATA1:  surface zdata

%  �� MATLAB �� 06-Apr-2015 13:02:42 �Զ�����

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1);
%% ȡ��ע���������Ա������ X ����
% xlim(axes1,[-3 3]);
%% ȡ��ע���������Ա������ Y ����
% ylim(axes1,[-3 3]);
%% ȡ��ע���������Ա������ Z ����
% zlim(axes1,[-6.54664452432043 8.07517354515923]);
view(axes1,[-37.5 30]);
grid(axes1,'on');
hold(axes1,'all');

% ���� surf
surf(xdata1,ydata1,zdata1,'Parent',axes1);

% ���� xlabel
xlabel('x');

% ���� ylabel
ylabel('y');

% ���� title
title('Peaks');

