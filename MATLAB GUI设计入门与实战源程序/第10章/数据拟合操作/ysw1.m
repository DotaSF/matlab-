clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format shortg       % 数据类型

t1=0:2;
t2=3:18;
t3=19:20;
p1=[780 1230 1290];
p2=[1410 1320 1050 1230 990 1590 1200 2700 1170 1260 1225.531915 1290 1290 23.47826087 1800 1425];
p3=[3306.122449 2533.333333];
plot([t1,t2,t3],[p1,p2,p3],'mo--')

% plot(t1,p1,'r','linewidth',2)
% plot(t2,p2,'g','linewidth',2);
% plot(t3,p3,'b','linewidth',2)
xlabel('t');
ylabel('pcu/h');


