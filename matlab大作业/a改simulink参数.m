%plot�ǻ��ƹ��������ڵı���������һ������ֻ��Ӧһ��ֵ
%����ͬʱ�����仯ǰ�ͱ仯���ͼ
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