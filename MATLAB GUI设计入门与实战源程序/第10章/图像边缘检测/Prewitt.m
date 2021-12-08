%% Prewitt
clc,clear,close all                    % �������幤�������رմ���
warning off                         % ��������
feature jit off                        % ���ٴ���ִ��
I=imread('222.jpg');   % ����ͼ��
r=I(:,:,1);g=I(:,:,2);b=I(:,:,3);
nI=size(r);
im = single(I) / 255;

	yfilter = fspecial('prewitt');  % prewitt
	xfilter = yfilter';            % ת��
	
	rx = imfilter(im(:,:,1), xfilter);   % x�˲�ģ��
	gx = imfilter(im(:,:,2), xfilter);   % x�˲�ģ��
	bx = imfilter(im(:,:,3), xfilter);   % x�˲�ģ��
	
	ry = imfilter(im(:,:,1), yfilter);    % y�˲�ģ��
	gy = imfilter(im(:,:,2), yfilter);   % y�˲�ģ��
	by = imfilter(im(:,:,3), yfilter);   % y�˲�ģ��
	
	Jx = rx.^2 + gx.^2 + bx.^2;
	Jy = ry.^2 + gy.^2 + by.^2;
	Jxy = rx.*ry + gx.*gy + bx.*by;
	
	D = sqrt(abs(Jx.^2 - 2*Jx.*Jy + Jy.^2 + 4*Jxy.^2)); 		% 2x2 matrix J'*J�ĵ�һ������ֵ
	e1 = (Jx + Jy + D) / 2;
	%  e2 = (Jx + Jy - D) / 2; 		%�ڶ�������ֵ

edge_magnitude = sqrt(e1);
edge_orientation = atan2(-Jxy, e1 - Jy);
% figure,
% subplot(121),imshow(edge_magnitude)   % ��ֵ
% subplot(122),imshow(edge_orientation)   % ����

pre=edge(edge_magnitude,'prewitt',0.19);
% figure,imshow(y),title('Prewitt Edge Detection')

% 3*3 prewitt
f=edge_magnitude;
sx=[-1 0 1;-1 0 1;-1 0 1]; % convolution mask�����Ĥ
sy=[1 1 1;0 0 0;-1 -1 -1]; % convolution mask�����Ĥ
for x=2:1:nI(1,1)-1
    for y=2:1:nI(1,2)-1
        mod=[f(x-1,y-1),f(x-1,y),f(x-1,y+1);   % ģ��
            f(x,y-1),f(x,y),f(x,y+1);
            f(x+1,y-1),f(x+1,y),f(x+1,y+1)];
        mod=double(mod);    % ת������
        fsx=sx.*mod;         % ��Ե���
        fsy=sy.*mod;         % ��Ե���
        ftemp(x,y)=sqrt((sum(fsx(:)))^2+(sum(fsy(:)))^2);
    end
end
fs=im2bw(ftemp); % fs=im2uint8(ftemp);
fs=bwareaopen(fs,1000);
% figure,imshow(fs);title('Prewitt Edge Detection');

subplot(131),imshow(edge_magnitude),title('edge magnitude')  % ��ֵ
subplot(132),imshow(pre),title('edge magnitude extraction')     % ��Ե��ȡ
subplot(133),imshow(fs);title('Prewitt Edge Detection');         % Prewitt���˲�
