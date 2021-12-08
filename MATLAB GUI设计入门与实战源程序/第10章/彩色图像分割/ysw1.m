clc,clear,close all
warning off
feature jit off
im = imread('greenBall1.jpg');
imshow(im)
greenBall1=im;
r = greenBall1(:, :, 1);
g = greenBall1(:, :, 2);
b = greenBall1(:, :, 3);

%% 计算绿色分量
justGreen = g - r/2 - b/2;
figure(2)
subplot(221),imshow(r); title('r')
subplot(222),imshow(g); title('g')
subplot(223),imshow(b); title('b')
subplot(224),imshow(justGreen);title('justGreen')

%%
%% 阈值二值化
bw = justGreen > 80; 
%% 去除小块
ball1 = bwareaopen(bw, 30);
figure(3),imshow(ball1)

r1=immultiply(r,ball1);
g1=immultiply(g,ball1);
b1=immultiply(b,ball1);
ball2=cat(3,r1,g1,b1);
figure(4),imshow(ball2)

%% 找球的球心
cc=bwconncomp(ball1);
s  = regionprops(ball1, {'centroid','area'});
if isempty(s)
  error('没有找到球!');
else
  [~, id] = max([s.Area]);
  ball1(labelmatrix(cc)~=id)=0;
end
figure(5)
imshow(ball2)
 hold on, plot(s(id).Centroid(1),s(id).Centroid(2),'wp','MarkerSize',20,'MarkerFaceColor','r'), hold off
 disp(['Center location is (',num2str(s(id).Centroid(1),4),', ',num2str(s(id).Centroid(2),4),')'])




