%% �������ᱣ��
clc,clear,close all % ���
warning off         % ȡ������
feature jit off     % ���ٴ���ִ��
hassep7;
h=getframe(figure(1));
imwrite(h.cdata,'pic2.bmp');
%% �������ᱣ��
saveas(gcf,'pic3.bmp')

%% ���������ᱣ��
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




