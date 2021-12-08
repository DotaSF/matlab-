%plot是绘制工作区间内的变量，所以一个变量只对应一个值
%不能同时画出变化前和变化后的图
clc;clear;
load_system('pidsss');
sim('pidsss');
tt = ScopeData(:,1);
y1 = ScopeData(:,2);
y2 = ScopeData(:,3);
set_param('pidsss/Step','After','1');
plot(tt,y1,'b',tt,y2,'r');
grid on;
hold on
temp = get_param('pidsss/Subsystem','DialogParameters')
set_param('pidsss/Step','After','10');
plot(tt,y1,'b',tt,y2,'r');
sim('pidsss');