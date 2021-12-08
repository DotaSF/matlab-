%% Prewitt
clc,clear,close all                    % 清屏、清工作区、关闭窗口
warning off                         % 消除警告
feature jit off                        % 加速代码执行
I=imread('222.jpg');   % 读入图像
r=I(:,:,1);g=I(:,:,2);b=I(:,:,3);
nI=size(r);
im = single(I) / 255;

	yfilter = fspecial('prewitt');  % prewitt
	xfilter = yfilter';            % 转置
	
	rx = imfilter(im(:,:,1), xfilter);   % x滤波模板
	gx = imfilter(im(:,:,2), xfilter);   % x滤波模板
	bx = imfilter(im(:,:,3), xfilter);   % x滤波模板
	
	ry = imfilter(im(:,:,1), yfilter);    % y滤波模板
	gy = imfilter(im(:,:,2), yfilter);   % y滤波模板
	by = imfilter(im(:,:,3), yfilter);   % y滤波模板
	
	Jx = rx.^2 + gx.^2 + bx.^2;
	Jy = ry.^2 + gy.^2 + by.^2;
	Jxy = rx.*ry + gx.*gy + bx.*by;
	
	D = sqrt(abs(Jx.^2 - 2*Jx.*Jy + Jy.^2 + 4*Jxy.^2)); 		% 2x2 matrix J'*J的第一个特征值
	e1 = (Jx + Jy + D) / 2;
	%  e2 = (Jx + Jy - D) / 2; 		%第二个特征值

edge_magnitude = sqrt(e1);
edge_orientation = atan2(-Jxy, e1 - Jy);
% figure,
% subplot(121),imshow(edge_magnitude)   % 幅值
% subplot(122),imshow(edge_orientation)   % 方向

pre=edge(edge_magnitude,'prewitt',0.19);
% figure,imshow(y),title('Prewitt Edge Detection')

% 3*3 prewitt
f=edge_magnitude;
sx=[-1 0 1;-1 0 1;-1 0 1]; % convolution mask卷积掩膜
sy=[1 1 1;0 0 0;-1 -1 -1]; % convolution mask卷积掩膜
for x=2:1:nI(1,1)-1
    for y=2:1:nI(1,2)-1
        mod=[f(x-1,y-1),f(x-1,y),f(x-1,y+1);   % 模板
            f(x,y-1),f(x,y),f(x,y+1);
            f(x+1,y-1),f(x+1,y),f(x+1,y+1)];
        mod=double(mod);    % 转换类型
        fsx=sx.*mod;         % 边缘检测
        fsy=sy.*mod;         % 边缘检测
        ftemp(x,y)=sqrt((sum(fsx(:)))^2+(sum(fsy(:)))^2);
    end
end
fs=im2bw(ftemp); % fs=im2uint8(ftemp);
fs=bwareaopen(fs,1000);
% figure,imshow(fs);title('Prewitt Edge Detection');

subplot(131),imshow(edge_magnitude),title('edge magnitude')  % 幅值
subplot(132),imshow(pre),title('edge magnitude extraction')     % 边缘提取
subplot(133),imshow(fs);title('Prewitt Edge Detection');         % Prewitt锐化滤波
