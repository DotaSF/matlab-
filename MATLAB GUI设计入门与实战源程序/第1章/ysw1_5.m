% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ������� 
for i= 1:255;
    ysw(i,:) = i*ones(1,255);
end
imshow(ysw)
colormap(jet)  % ��ɫ
shading interp % ����

ysw1 = uint8(ysw);
imshow(ysw1)
colormap(jet)  % ��ɫ
shading interp % ����

ysw2 = ysw >100;  % ����100Ϊ1������Ϊ0
imshow(ysw2)
colormap(jet)  % ��ɫ
shading interp % ����

ysw3 = uint16(ysw); 
imshow(ysw3)
colormap(jet)  % ��ɫ
shading interp % ����

ysw4 = single(ysw); 
imshow(ysw4)
colormap(jet)  % ��ɫ
shading interp % ����










