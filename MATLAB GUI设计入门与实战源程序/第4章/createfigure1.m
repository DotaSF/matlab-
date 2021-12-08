function createfigure1(xdata1, ydata1, zdata1)
%CREATEFIGURE1(XDATA1, YDATA1, ZDATA1)
%  XDATA1:  surface xdata
%  YDATA1:  surface ydata
%  ZDATA1:  surface zdata

%  由 MATLAB 于 06-Apr-2015 13:41:44 自动生成

% 创建 figure
figure1 = figure('Color',[1 1 1]);

% 创建 axes
axes1 = axes('Parent',figure1,'XTick',zeros(1,0),...
    'Position',[0.13 0.113300330033003 0.775 0.810792079207921],...
    'FontSize',24);
%% 取消注释以下行以保留轴的 X 极限
% xlim(axes1,[-3 3]);
%% 取消注释以下行以保留轴的 Y 极限
% ylim(axes1,[-3 3]);
%% 取消注释以下行以保留轴的 Z 极限
% zlim(axes1,[-6.54664452432043 8.07517354515923]);
view(axes1,[-37.5 30]);
grid(axes1,'on');
hold(axes1,'all');

% 创建 surf
surf(xdata1,ydata1,zdata1,'Parent',axes1);

% 创建 xlabel
xlabel('x');

% 创建 ylabel
ylabel('y');

% 创建 title
title('Peaks');

% 创建 textarrow
annotation(figure1,'textarrow',[0.170050761421319 0.228426395939086],...
    [0.850485148514851 0.673267326732673],'TextEdgeColor','none','FontSize',20,...
    'String',{'peaks'});

