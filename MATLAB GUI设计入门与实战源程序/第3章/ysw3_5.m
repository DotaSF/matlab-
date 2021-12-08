clc,clear,close all
warning off
feature jit off
copyfile(fullfile(matlabroot,...
         'help','includes','product',...
         'images','global','ico_large_info.png'));
[cdata] = imread('DSC06314.jpg'); 
h=msgbox('程序完成',...
         '余胜威','custom',cdata);
%%
clc,clear,close all
[cdata,map] = imread('DSC06314.jpg'); 
h=msgbox('余胜威',...
         '执行自己的图标','custom',cdata,map);
     
%%
uiwait(msgbox('Operation Completed','Success','modal'));
%%
clc,clear,close all
CreateStruct.Interpreter = 'tex';
CreateStruct.WindowStyle = 'modal';
h=msgbox('Z = X^2 + Y^2','Value',CreateStruct);





     
     