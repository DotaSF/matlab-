imshow(ysw)
image(ysw)
imagesc(ysw)
%%
% Designed by Yu Shengwei From SWJTU University
% 2015年2月3日
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format short        % 数据类型
tic                 % 运算计时
im = imread('ysw.jpg');   % 读取图像
imshow(im)               % 显示图像
toc                 % 计时结束
figure,
subplot(221),imshow(im);title('RGB')
subplot(222),imshow(im(:,:,1));title('R');
subplot(223),imshow(im(:,:,2));title('G');
subplot(224),imshow(im(:,:,3));title('B');

%%
im = imread('C:\Users\Administrator\Desktop\360网盘.jpg');   % 读取图像
subplot(221),imshow(im);title('RGB')
subplot(222),imshow(im(:,:,1));title('R');
subplot(223),imshow(im(:,:,2));title('G');
subplot(224),imshow(im(:,:,3));title('B');

%%
im = imread('.\ysw\me.jpg');   % 读取图像
subplot(221),imshow(im);title('RGB')
subplot(222),imshow(im(:,:,1));title('R');
subplot(223),imshow(im(:,:,2));title('G');
subplot(224),imshow(im(:,:,3));title('B');

%% 图像的保存
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format short        % 数据类型
tic                 % 运算计时
im = imread('ysw.jpg');   % 读取图像
imshow(im)                % 显示图像
imwrite(im,'curve.jpg');  % 保存图像
imwrite(im,'C:\Users\Administrator\Desktop\curve.jpg');  % 保存图像
toc                 % 计时结束
%%
im = imread('ysw.jpg');   % 读取图像
imshow(im)                % 显示图像
saveas(gcf,'curve1.jpg')
%%
im = imread('ysw.jpg');     % 读取图像
imshow(im,'border','tight') % 显示图像
saveas(gcf,'curve2.jpg')

%%
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format short        % 数据类型
tic                 % 运算计时
im = imread('ysw.jpg');   % 读取图像
newfig=figure;
imshow(im)                % 显示图像
set(newfig,'visible','off');
set(newfig,'color','w');
set(newfig,'Units','default','Position','default');
f = getframe(newfig);
set(newfig,'visible','off');
imwrite(f.cdata,'curve3.jpg');

im = imread('curve3.jpg');   % 读取图像
figure,
imshow(im)    
toc 























