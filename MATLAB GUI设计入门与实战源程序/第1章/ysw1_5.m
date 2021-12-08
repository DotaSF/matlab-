% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
for i= 1:255;
    ysw(i,:) = i*ones(1,255);
end
imshow(ysw)
colormap(jet)  % 颜色
shading interp % 消隐

ysw1 = uint8(ysw);
imshow(ysw1)
colormap(jet)  % 颜色
shading interp % 消隐

ysw2 = ysw >100;  % 大于100为1，否则为0
imshow(ysw2)
colormap(jet)  % 颜色
shading interp % 消隐

ysw3 = uint16(ysw); 
imshow(ysw3)
colormap(jet)  % 颜色
shading interp % 消隐

ysw4 = single(ysw); 
imshow(ysw4)
colormap(jet)  % 颜色
shading interp % 消隐










