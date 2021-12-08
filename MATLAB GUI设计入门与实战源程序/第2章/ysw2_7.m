imshow(ysw)
image(ysw)
imagesc(ysw)
%%
% Designed by Yu Shengwei From SWJTU University
% 2015��2��3��
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
tic                 % �����ʱ
im = imread('ysw.jpg');   % ��ȡͼ��
imshow(im)               % ��ʾͼ��
toc                 % ��ʱ����
figure,
subplot(221),imshow(im);title('RGB')
subplot(222),imshow(im(:,:,1));title('R');
subplot(223),imshow(im(:,:,2));title('G');
subplot(224),imshow(im(:,:,3));title('B');

%%
im = imread('C:\Users\Administrator\Desktop\360����.jpg');   % ��ȡͼ��
subplot(221),imshow(im);title('RGB')
subplot(222),imshow(im(:,:,1));title('R');
subplot(223),imshow(im(:,:,2));title('G');
subplot(224),imshow(im(:,:,3));title('B');

%%
im = imread('.\ysw\me.jpg');   % ��ȡͼ��
subplot(221),imshow(im);title('RGB')
subplot(222),imshow(im(:,:,1));title('R');
subplot(223),imshow(im(:,:,2));title('G');
subplot(224),imshow(im(:,:,3));title('B');

%% ͼ��ı���
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
tic                 % �����ʱ
im = imread('ysw.jpg');   % ��ȡͼ��
imshow(im)                % ��ʾͼ��
imwrite(im,'curve.jpg');  % ����ͼ��
imwrite(im,'C:\Users\Administrator\Desktop\curve.jpg');  % ����ͼ��
toc                 % ��ʱ����
%%
im = imread('ysw.jpg');   % ��ȡͼ��
imshow(im)                % ��ʾͼ��
saveas(gcf,'curve1.jpg')
%%
im = imread('ysw.jpg');     % ��ȡͼ��
imshow(im,'border','tight') % ��ʾͼ��
saveas(gcf,'curve2.jpg')

%%
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
tic                 % �����ʱ
im = imread('ysw.jpg');   % ��ȡͼ��
newfig=figure;
imshow(im)                % ��ʾͼ��
set(newfig,'visible','off');
set(newfig,'color','w');
set(newfig,'Units','default','Position','default');
f = getframe(newfig);
set(newfig,'visible','off');
imwrite(f.cdata,'curve3.jpg');

im = imread('curve3.jpg');   % ��ȡͼ��
figure,
imshow(im)    
toc 























