% 区域颜色填充
clc,clear,close all % 清存
warning off         % 取消警告
feature jit off     % 加速代码执行
im = imread('pic4.bmp');
imshow(im)
bw1 = im2bw(im);
imshow(bw1)
bw2 = edge(bw1);
bw2 = double(bw2);
% for i=1:size(bw2,1)
%     for j=1:size(bw2,2)
%         if bw2(i,j)==0
%             bw2(i,j)=10;
%         end
%     end
% end    
imshow(bw2,[])
bw3 = bwfill(bw2,'holes');
imshow(bw3)
bw3(261:370,315:450)=1;
imshow(bw3)
bw4=edge(bw3);
imshow(bw4)

%%
clc,clear,close all % 清存
warning off         % 取消警告
feature jit off     % 加速代码执行
im = imread('pic4.bmp');
imshow(im)
bw1 = im2bw(im);
imshow(bw1)
bw2 = edge(bw1);
bw3 = zeros(size(bw2,1),size(bw2,2));
bw3(261:370,315:450)=1;
bw4=edge(bw3);
bw5=bw2+bw4;
imshow(bw5)




