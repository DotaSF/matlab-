uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' ;
         '*.jpg','.jpgͼ��' ;
         '*.tif','.tifͼ��' ;
         '*.png','.pngͼ��' ;
         '*.gif','.gifͼ��' ;
         '*.bmp','.bmpͼ��' ;})
     
%%
% uigetfile('F:\MATLAB Edit 2013a\MATLAB Edit 2012B\ysw\book\GUI����ֲ�\','.m')

%%
[filename, pathname, filterindex] = uigetfile({'*.*','All Files' },'mytitle',...
          'F:\MATLAB Edit 2013a\MATLAB Edit 2012B\ysw\book\GUI����ֲ�\��3��\ysw3_1.m')
%%
uigetfile('F:\MATLAB Edit 2013a\MATLAB Edit 2012B\ysw\book\GUI����ֲ�\','.m')

%%
clc,clear,close all
warning off
[filename, pathname, filterindex] = uigetfile({'*.*','All Files' },'mytitle',...
          'F:\MATLAB Edit 2013a\MATLAB Edit 2012B\ysw\book\GUI����ֲ�\��3��\ysw3_1.m')
run(filename)    









      
      

