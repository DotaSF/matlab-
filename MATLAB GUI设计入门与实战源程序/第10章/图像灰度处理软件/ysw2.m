clc,clear,close all                    % 清屏、清工作区、关闭窗口
warning off                         % 消除警告
feature jit off                        % 加速代码执行
img=imread('231.jpg');
subplot(121),imshow(img),title('原始图像')
img_1=img(:,:,1);  % R
img_2=img(:,:,2);  % G
img_3=img(:,:,3);  % B
Y=0.299*img_1+0.587*img_2+0.114*img_3;  % 白平衡系数
[m,n]=size(Y);
k=Y(1,1);
for i=1:m
    for j=1:n
        if Y(i,j)>=k    % 判断比较
            k=Y(i,j);
            k1=i;    % 保存角标
            k2=j;    % 保存角标
        end
    end
end
[m1,n1]=find(Y==k);
Rave=sum(sum(img_1));    % 求和
Rave=Rave/(m*n);         % 比例系数
Gave=sum(sum(img_2));    % 求和
Gave=Gave/(m*n);
Bave=sum(sum(img_3));    % 求和
Bave=Bave/(m*n);
Kave=(Rave+Gave+Bave)/3;   % 求均值
img_1=(Kave/Rave)*img_1;    % 重构R通道
img_2=(Kave/Gave)*img_2;    % 重构G通道
img_3=(Kave/Bave)*img_3;    % 重构B通道
imgysw=cat(3,img_1,img_2,img_3);
subplot(122),imshow(imgysw),title('白平衡处理结果')
