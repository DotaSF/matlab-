%% 带坐标轴保存
clc,clear,close all % 清存
warning off         % 取消警告
feature jit off     % 加速代码执行
hassep7;
h=getframe(figure(1));
imwrite(h.cdata,'pic2.bmp');
%% 带坐标轴保存
saveas(gcf,'pic3.bmp')

%% 不带坐标轴保存
hassep7;
axis off

%%
imwrite(h.cdata,'curve.bmp');
saveas(gcf,'curve1.bmp')

newfig=figure;
set(newfig,'visible','off');
set(newfig,'color','w');
newaxes=copyobj(newfig,figure(1));
set(newaxes,'Units','default','Position','default');
f = getframe(newfig);
set(newfig,'visible','off');
imwrite(f.cdata,'curve2.bmp');




