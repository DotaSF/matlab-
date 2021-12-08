clc,clear,close all % 清存
warning off         % 取消警告
feature jit off     % 加速代码执行
f = uimenu('Label','Workspace');
    uimenu(f,'Label','New Figure','Callback','figure');
    uimenu(f,'Label','Save','Callback','save');
    uimenu(f,'Label','Quit','Callback','exit',... 
           'Separator','on','Accelerator','Q');
% 自定义菜单项
%%
f=figure('MenuBar','None');
mh = uimenu(f,'Label','Find'); 
frh = uimenu(mh,'Label','Find and Replace ...',...
							    'Callback','goto');
frh = uimenu(mh,'Label','Variable');                 
uimenu(frh,'Label','Name...', ...
          'Callback','variable');

uimenu(frh,'Label','Value...', ...
          'Callback','value');
%%
% Create the UICONTEXTMENU
cmenu = uicontextmenu;
% Create the parent menu
fontmenu = uimenu(cmenu,'label','Font');

% Create the submenus
font1 = uimenu(fontmenu,'label','Helvetica',...
               'Callback','HelvFont');
font2 = uimenu(fontmenu,'label',...
               'Monospace','Callback','MonoFont');
set(gcf,'uicontextmenu',cmenu);

















