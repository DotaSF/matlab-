function varargout = ysw2(varargin)
% YSW2 MATLAB code for ysw2.fig
%      YSW2, by itself, creates a new YSW2 or raises the existing
%      singleton*.
%
%      H = YSW2 returns the handle to a new YSW2 or the handle to
%      the existing singleton*.
%
%      YSW2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in YSW2.M with the given input arguments.
%
%      YSW2('Property','Value',...) creates a new YSW2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ysw2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ysw2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ysw2

% Last Modified by GUIDE v2.5 08-Jun-2015 12:34:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ysw2_OpeningFcn, ...
                   'gui_OutputFcn',  @ysw2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ysw2 is made visible.
function ysw2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ysw2 (see VARARGIN)

% Choose default command line output for ysw2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ysw2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ysw2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
[filename,pathname]=uigetfile({'*.jpg';'*.bmp';'*.tif'},'选择图片');
str=[pathname,filename];
I=imread(str);
axes(handles.axes1);
imshow(I)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc,clear,close all

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global I
set(handles.radiobutton1, 'Value', 1);
set(handles.radiobutton2, 'Value', 0);
set(handles.radiobutton3, 'Value', 0);
set(handles.radiobutton4, 'Value', 0);

axes(handles.axes1);
imshow(I)

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global I
set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 1);
set(handles.radiobutton3, 'Value', 0);
set(handles.radiobutton4, 'Value', 0);

r=I(:,:,1);g=I(:,:,2);b=I(:,:,3);
nI=size(r);
im = single(I) / 255;

	yfilter = fspecial('sobel'); % sobel
	xfilter = yfilter';
	
	rx = imfilter(im(:,:,1), xfilter);
	gx = imfilter(im(:,:,2), xfilter);
	bx = imfilter(im(:,:,3), xfilter);
	
	ry = imfilter(im(:,:,1), yfilter);
	gy = imfilter(im(:,:,2), yfilter);
	by = imfilter(im(:,:,3), yfilter);
	
	Jx = rx.^2 + gx.^2 + bx.^2;
	Jy = ry.^2 + gy.^2 + by.^2;
	Jxy = rx.*ry + gx.*gy + bx.*by;

	D = sqrt(abs(Jx.^2 - 2*Jx.*Jy + Jy.^2 + 4*Jxy.^2)); 		% 2x2 matrix J'*J的第一个特征值
	e1 = (Jx + Jy + D) / 2;
	%  e2 = (Jx + Jy - D) / 2;   						%第二个特征值

edge_magnitude = sqrt(e1);
edge_orientation = atan2(-Jxy, e1 - Jy);
% figure,
% subplot(121),imshow(edge_magnitude)  		% 梯度
% subplot(122),imshow(edge_orientation)  		% 方向

sob=edge(edge_magnitude,'sobel',0.29);
% sob=bwareaopen(sob,100);  				% 剔除小块
% figure,imshow(y),title('Sobel Edge Detection')

% 3*3 sobel
f=edge_magnitude;
sx=[-1 0 1;-2 0 2;-1 0 1]; 			% 卷积模板convolution mask
sy=[-1 -2 -1;0 0 0;1 2 1]; 			% 卷积模板convolution mask
for x=2:1:nI(1,1)-1
    for y=2:1:nI(1,2)-1
        mod=[f(x-1,y-1),2*f(x-1,y),f(x-1,y+1);
            f(x,y-1),2*f(x,y),f(x,y+1);
            f(x+1,y-1),2*f(x+1,y),f(x+1,y+1)];
        mod=double(mod);
        fsx=sx.*mod;
        fsy=sy.*mod;
        ftemp(x,y)=sqrt((sum(fsx(:)))^2+(sum(fsy(:)))^2);
    end
end
fs=im2bw(ftemp); % fs=im2uint8(ftemp);
fs=bwareaopen(fs,500);

axes(handles.axes1);
imshow(fs)

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
global I
set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 0);
set(handles.radiobutton3, 'Value', 1);
set(handles.radiobutton4, 'Value', 0);

im=im2double(I);
r=im(:,:,1);g=im(:,:,2);b=im(:,:,3);
% 滤波器平滑系数
filter= [2 4 5 4 2;
         4 9 12 9 4;
         5 12 15 12 5;
         4 9 12 9 4;
         2 4 5 4 2];
filter=filter/115;
% N-dimensional convolution
smim= convn(im,filter); 
% imshow(smim);title('Smoothened image');

% 计算梯度
gradXfilt=[-1 0 1;    		% 卷积模板convolution mask
           -2 0 2; 
           -1 0 1];
gradYfilt=[1  2   1; 		% 卷积模板 convolution mask
           0  0   0; 
          -1  -2  -1];
GradX= convn(smim,gradXfilt);  			% 卷积
GradY= convn(smim,gradYfilt);  			% 卷积
absgrad=abs(GradX)+abs(GradY); 			% 绝对梯度值
% 计算梯度角
[a,b]=size(GradX);
theta=zeros([a b]);
for i=1:a
      for j=1:b
            if(GradX(i,j)==0)
               theta(i,j)=atan(GradY(i,j)/0.000000000001);   % 避免字母为0情况
            else
                theta(i,j)=atan(GradY(i,j)/GradX(i,j));
            end
      end
 end
  theta=theta*(180/3.14);
  for i=1:a
      for j=1:b
            if(theta(i,j)<0)
                theta(i,j)= theta(i,j)-90;
                theta(i,j)=abs(theta(i,j));
            end
      end
 end
  for i=1:a
      for j=1:b
          if ((0<theta(i,j))&&(theta(i,j)<22.5))||((157.5<theta(i,j))&&(theta(i,j)<181))
                theta(i,j)=0;
          elseif (22.5<theta(i,j))&&(theta(i,j)<67.5)
                 theta(i,j)=45;
          elseif (67.5<theta(i,j))&&(theta(i,j)<112.5)  
                  theta(i,j)=90;
          elseif (112.5<theta(i,j))&&(theta(i,j)<157.5)
                  theta(i,j)=135;
          end
      end
  end 

% non-maximum suppression非极大值抑制
nmx = padarray(absgrad, [1 1]);
[a,b]=size(theta);
for i=2:a-2
    for j=2:b-2
           if (theta(i,j)==135)   % 角度135度
                 if ((nmx(i-1,j+1)>nmx(i,j))||(nmx(i+1,j-1)>nmx(i,j)))
                      nmx(i,j)=0;
                  end
           elseif (theta(i,j)==45)   
                  if ((nmx(i+1,j+1)>nmx(i,j))||(nmx(i-1,j-1)>nmx(i,j)))
                       nmx(i,j)=0;
                  end
           elseif (theta(i,j)==90)   
                  if ((nmx(i,j+1)>nmx(i,j))||(nmx(i,j-1)>nmx(i,j)))
                      nmx(i,j)=0;
                  end
           elseif (theta(i,j)==0)   
                  if ((nmx(i+1,j)>nmx(i,j))||(nmx(i-1,j)>nmx(i,j)))
                      nmx(i,j)=0;
                  end
           end
    end
end

nmx1=im2uint8(nmx); 			% 图像数据类型转换
tl=85;  						% 阈值下限lower threshold
th=100; 						% 阈值上限upper threshold

% 基于阈值的边界提取
[a,b]=size(nmx1);
gedge=zeros([a,b]);
for i=1:a
    for j=1:b
        if(nmx1(i,j)>th)
             gedge(i,j)=nmx1(i,j);
        elseif (tl<nmx1(i,j))&&(nmx1(i,j)<th)
             gedge(i,j)=nmx1(i,j);
        end
    end
end

[a,b]= size(gedge);
finaledge=zeros([a b]);
for i=1:a
    for j=1:b
        if (gedge(i,j)>th)
            finaledge(i,j)=gedge(i,j);
             for i2=(i-1):(i+1)
                 for j2= (j-1):(j+1)
                     if (gedge(i2,j2)>tl)&&(gedge(i2,j2)<th)
                         finaledge(i2,j2)=gedge(i,j);
                     end
                 end
              end
        end
   end
end

% 去除边界border
finaledge= im2uint8(finaledge(10:end-10,10:end-10));

axes(handles.axes1);
imshow(finaledge(:,1:452-10))



% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
global I
set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 0);
set(handles.radiobutton3, 'Value', 0);
set(handles.radiobutton4, 'Value', 1);

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

axes(handles.axes1);
imshow(fs)
