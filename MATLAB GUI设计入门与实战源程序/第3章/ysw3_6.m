clc,clear,close all
warning off
prompt = {'����ά��:','��ɫ�ռ�����:'};
dlg_title = '��ʤ��';
% num_lines = 1;
answer = inputdlg(prompt,dlg_title)

%%
clc,clear,close all
warning off
prompt = {'����ά��:','��ɫ�ռ�����:'};
dlg_title = '��ʤ��';
num_lines = 2;
answer = inputdlg(prompt,dlg_title,num_lines)


%%
clc,clear,close all
warning off
prompt = {'����ά��:','��ɫ�ռ�����:'};
dlg_title = '��ʤ��';
num_lines = 1;
def = {'20','hsv'};
answer = inputdlg(prompt,dlg_title,num_lines,def)

%%
clc,clear,close all
warning off
prompt = {' x^2:','��ɫ�ռ�����:'};
dlg_title = '��ʤ��';
numlines=1;
defaultanswer={'20','RGB'};
options.Resize='on';
options.WindowStyle='normal';
options.Interpreter='tex';
answer=inputdlg(prompt,dlg_title,numlines,...
                defaultanswer,options);



















