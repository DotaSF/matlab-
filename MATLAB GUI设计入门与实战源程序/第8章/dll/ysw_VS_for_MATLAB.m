clc,clear,close all
warning off
loadlibrary('ysw_VS2010_MATLAB2012B.dll','ysw_add.h')
% libfunctions ysw_VS2010_MATLAB2012B -full
m = calllib('ysw_VS2010_MATLAB2012B','add',3.3,3)

