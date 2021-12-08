function createfigure1(xdata1, ydata1, zdata1)
%CREATEFIGURE1(XDATA1, YDATA1, ZDATA1)
%  XDATA1:  surface xdata
%  YDATA1:  surface ydata
%  ZDATA1:  surface zdata

%  �� MATLAB �� 06-Apr-2015 13:41:44 �Զ�����

% ���� figure
figure1 = figure('Color',[1 1 1]);

% ���� axes
axes1 = axes('Parent',figure1,'XTick',zeros(1,0),...
    'Position',[0.13 0.113300330033003 0.775 0.810792079207921],...
    'FontSize',24);
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

% ���� textarrow
annotation(figure1,'textarrow',[0.170050761421319 0.228426395939086],...
    [0.850485148514851 0.673267326732673],'TextEdgeColor','none','FontSize',20,...
    'String',{'peaks'});

