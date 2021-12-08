% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
%��̬ͬ�˲�
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic
im = imread('me.jpg');        % ��ͼ
im = imnoise(rgb2gray(im),'gaussian',0,1e-5); % ԭͼ�� + ������

%̬ͬ�˲���������
rL = 0.3999;  % ��Ƶ����
rH = 0.71;   % ��Ƶ����
D0 = 1;   % ��ֹƵ��
figure,
subplot(121),imshow(im);title('ԭʼͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
im_e = Homom_filter(im,D0,rL,rH);   % ̬ͬ�˲�
subplot(122),imshow(im_e,[]);title('̬ͬ�˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
toc

%%
%��̬ͬ�˲�
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
im = imread('me.jpg');        % ��ͼ
im = imnoise(rgb2gray(im),'gaussian',0,1e-5); % ԭͼ�� + ������

%̬ͬ�˲���������
rL = 0.3999;  % ��Ƶ����
rH = 0.71;   % ��Ƶ����
D0 = 1;   % ��ֹƵ��
global rL rH D0
figure,
subplot(121),imshow(im);title('ԭʼͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
im_e = Homom_filter_2(im);   % ̬ͬ�˲�
subplot(122),imshow(im_e,[]);title('̬ͬ�˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����


