%% ������ӱ���е�����
% ���ڴ����µ��ӱ�������ݵĽű�:
%
%    ������: F:\MATLAB Edit 2013a\MATLAB Edit
%    2012B\ysw\book\GUI����ֲ�\��2��\ysw.xlsx ������: Sheet1
%
% Ҫ��չ�����Թ�����ѡ�����ݻ��������ӱ��ʹ�ã������ɺ���������ű���

% �� MATLAB �Զ������� 2015/01/31 21:22:39

%% ��������
data = xlsread('F:\MATLAB Edit 2013a\MATLAB Edit 2012B\ysw\book\GUI����ֲ�\��2��\ysw.xlsx','Sheet1');

%% ����������������б�������
VarName1 = data(:,1);
VarName2 = data(:,2);
VarName3 = data(:,3);
VarName4 = data(:,4);

%% �����ʱ����
clearvars data raw;