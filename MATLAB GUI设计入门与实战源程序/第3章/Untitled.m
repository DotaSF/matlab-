uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' ;
         '*.jpg','.jpg图像' ;
         '*.tif','.tif图像' ;
         '*.png','.png图像' ;
         '*.gif','.gif图像' ;
         '*.bmp','.bmp图像' ;})
     
%%
% uigetfile('F:\MATLAB Edit 2013a\MATLAB Edit 2012B\ysw\book\GUI设计手册\','.m')

%%
[filename, pathname, filterindex] = uigetfile({'*.*','All Files' },'mytitle',...
          'F:\MATLAB Edit 2013a\MATLAB Edit 2012B\ysw\book\GUI设计手册\第3章\ysw3_1.m')
%%
uigetfile('F:\MATLAB Edit 2013a\MATLAB Edit 2012B\ysw\book\GUI设计手册\','.m')

%%
clc,clear,close all
warning off
[filename, pathname, filterindex] = uigetfile({'*.*','All Files' },'mytitle',...
          'F:\MATLAB Edit 2013a\MATLAB Edit 2012B\ysw\book\GUI设计手册\第3章\ysw3_1.m')
run(filename)    









      
      

