function [VarName1,VarName2,VarName3,VarName4] = importfile2(workbookFile,sheetName,startRow,endRow)
%IMPORTFILE2 ������ӱ���е�����
%   [VarName1,VarName2,VarName3,VarName4] = IMPORTFILE2(FILE) ��ȡ��Ϊ FILE ��
%   Microsoft Excel ���ӱ���ļ��ĵ�һ�Ź������е����ݣ�������������Ϊ��ʸ�����ء�
%
%   [VarName1,VarName2,VarName3,VarName4] = IMPORTFILE2(FILE,SHEET)
%   ��ָ���Ĺ������ж�ȡ��
%
%   [VarName1,VarName2,VarName3,VarName4] =
%   IMPORTFILE2(FILE,SHEET,STARTROW,ENDROW) ����ָ�����м����ָ���������ж�ȡ�����ڲ��������м������
%   STARTROW �� ENDROW ָ��Ϊ��Сƥ���һ�Ա�����ʸ����Ҫ��ȡ���ļ���β����Ϊ inf ָ�� ENDROW��%
% ʾ��:
%   [VarName1,VarName2,VarName3,VarName4] =
%   importfile2('ysw.xlsx','Sheet1',1,11);
%
%   ������� XLSREAD��

% �� MATLAB �Զ������� 2015/01/31 21:23:57

%% ���봦��

% ���δָ���������򽫶�ȡ��һ�Ź�����
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% ���δָ���е������յ㣬��ᶨ��Ĭ��ֵ��
if nargin <= 3
    startRow = 1;
    endRow = 11;
end

%% ��������
data = xlsread(workbookFile, sheetName, sprintf('A%d:D%d',startRow(1),endRow(1)));
for block=2:length(startRow)
    tmpDataBlock = xlsread(workbookFile, sheetName, sprintf('A%d:D%d',startRow(block),endRow(block)));
    data = [data;tmpDataBlock]; %#ok<AGROW>
end

%% ����������������б�������
VarName1 = data(:,1);
VarName2 = data(:,2);
VarName3 = data(:,3);
VarName4 = data(:,4);

