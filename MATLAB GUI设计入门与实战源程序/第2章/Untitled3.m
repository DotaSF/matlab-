%% 导入电子表格中的数据
% 用于从以下电子表格导入数据的脚本:
%
%    工作簿: F:\MATLAB Edit 2013a\MATLAB Edit
%    2012B\ysw\book\GUI设计手册\第2章\ysw.xlsx 工作表: Sheet1
%
% 要扩展代码以供其他选定数据或其他电子表格使用，请生成函数来代替脚本。

% 由 MATLAB 自动生成于 2015/01/31 21:22:39

%% 导入数据
data = xlsread('F:\MATLAB Edit 2013a\MATLAB Edit 2012B\ysw\book\GUI设计手册\第2章\ysw.xlsx','Sheet1');

%% 将导入的数组分配给列变量名称
VarName1 = data(:,1);
VarName2 = data(:,2);
VarName3 = data(:,3);
VarName4 = data(:,4);

%% 清除临时变量
clearvars data raw;