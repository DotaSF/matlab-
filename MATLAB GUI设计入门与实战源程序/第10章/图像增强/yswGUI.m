function varargout = yswGUI(varargin)
% YSWGUI MATLAB code for yswGUI.fig
%      YSWGUI, by itself, creates a new YSWGUI or raises the existing
%      singleton*.
%
%      H = YSWGUI returns the handle to a new YSWGUI or the handle to
%      the existing singleton*.
%
%      YSWGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in YSWGUI.M with the given input arguments.
%
%      YSWGUI('Property','Value',...) creates a new YSWGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before yswGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to yswGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help yswGUI

% Last Modified by GUIDE v2.5 09-Jun-2015 21:10:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @yswGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @yswGUI_OutputFcn, ...
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


% --- Executes just before yswGUI is made visible.
function yswGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to yswGUI (see VARARGIN)

% Choose default command line output for yswGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes yswGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = yswGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[I,map]=imread('gray.bmp');
noisy=imnoise(I,'gaussian',0.01);
[M N]=size(I);
F=fft2(noisy);
fftshift(F);
Dcut=100;
D0=250;
D1=150;
for u=1:M
    for v=1:N
        D(u,v)=sqrt(u^2+v^2);
        BUTTERH(u,v)=1/(1+(sqrt(2)-1)*(Dcut/D(u,v))^2);
        EXPOTH(u,v)=exp(log(1/sqrt(2))*(Dcut/D(u,v))^2);
        if D(u,v)<D1
            THPFH(u,v)=0;
        else if D(u,v)<=D0
                THPFH(u,v)=(D(u,v)-D1)/(D0-D1);
            else THPFH(u,v)=1;
            end
        end
    end
end
    BUTTERG=BUTTERH.*F;
    BUTTERfiltered=ifft2(BUTTERG);
    EXPOTG=EXPOTH.*F;
    EXPOTfiltered=ifft2(EXPOTG);
    THPFG=THPFH.*F;
    THPFfiltered=ifft(THPFG);
    axes(handles.axes7)
    imshow(noisy);title('加入高斯噪声的灰度图像');
    axes(handles.axes8)
    imshow(BUTTERfiltered);title('经过巴特沃斯高通滤波器后的图像');
    axes(handles.axes9)
    imshow(EXPOTfiltered);title('经过指数高通滤波器后的图像');
    axes(handles.axes10)
    imshow(THPFfiltered);title('经过梯形高通滤波器后的图像');


% --------------------------------------------------------------------
function Untitled_12_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% clc
% clear
A=imread('gray.bmp')
I=double(A)/255;
%load woman2
%I=ind2gray(X,map)
noisy=imnoise(I,'gaussian',0.06);
[M N]=size(I);
F=fft2(noisy);
fftshift(F);
Dcut=100;
D0=150;
D1=250;
for u=1:M
    for v=1:N
        D(u,v)=sqrt(u^2+v^2);
        BUTTERH(u,v)=1/(1+(sqrt(2)-1)*(D(u,v)/Dcut)^2);
        EXPOTH(u,v)=exp(log(1/sqrt(2))*(D(u,v)/Dcut)^2);
        if D(u,v)<D0
            TRAPEH(u,v)=1;
        else if D(u,v)<=D1
                TRAPEH(u,v)=(D(u,v)-D1)/(D0-D1);
            else TRAPEH(u,v)=0;
            end
        end
    end
end
BUTTERG=BUTTERH.*F;
BUTTERfiltered=ifft2(BUTTERG);
EXPOTG=EXPOTH.*F;
EXPOTfiltered=ifft2(EXPOTG);
TRAPEG=TRAPEH.*F;
TRAPEfiltered=ifft2(TRAPEG);
axes(handles.axes7)
imshow(noisy);title('加入高斯噪声的灰度图像');
axes(handles.axes8)
imshow(BUTTERfiltered);title('经过巴特沃斯低通滤波器后的图像');
axes(handles.axes9)
imshow(EXPOTfiltered);title('经过指数低通滤波器后的图像');
axes(handles.axes10)
imshow(TRAPEfiltered);title('经过梯形低通滤波器后的图像');


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=imread('gray.bmp');
no=imnoise(I,'salt & pepper',0.01);
%no=double(no); 
prompt={'输入参数x:','输入参数y:'};   
defans={'0','0'};       
p=inputdlg(prompt,'input',2,defans); %创建数据输入窗口          
M=str2num(p{1}); 
N=str2num(p{2});
h = fspecial('average',[M N]); %生成一3×3邻域平均窗函数
f=conv2(no,h,'same');%求邻域平均
axes(handles.axes7)
imshow(no);title('加椒盐噪声后的图像')
axes(handles.axes8)
imshow(mat2gray(f));title('均值滤波后的图像')

% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=imread('gray.bmp');
I1=imnoise(I,'salt & pepper',0.06);
I2=double(I1)/255;
prompt={'输入参数x:','输入参数y:'};   
defans={'0','0'};       
p=inputdlg(prompt,'input',2,defans); %创建数据输入窗口          
M=str2num(p{1}); 
N=str2num(p{2});
J2=medfilt2(I2,[M N]);
axes(handles.axes7)
imshow(I1);title('加椒盐噪声后的图像')
axes(handles.axes8)
imshow(J2);title('中值滤波后的图像')

% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=imread('gray.bmp');
noisy=imnoise(I,'gaussian',0.01);
[M N]=size(I);
I=double(I); 
prompt={'xuanzhuanjiaodu:'};
	defans={'0'};
	 p=inputdlg(prompt,'input',1,defans);
	p1=str2num(p{1});
for i=1:M
for j=1:N
    b(i,j)=p1*noisy(i,j); 
    if (b(i,j)>=255) 
        b(i,j)=255; 
    end 
  end 
end  
b=uint8(b); 
axes(handles.axes7)
imshow(noisy);title('加高斯噪声后的图像')
axes(handles.axes8)
imshow(b);title('对比度增强后的图像')


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

	[filename,pathname]=uigetfile({'*.jpg';'*.bmp';'*tif';'*.*'},'openfile');
	if isequal(filename,0)||isequal(pathname,0)
	    errordlg('no file','error');
	    return;
	else
	    file=[pathname,filename];
	    global S
	    S=file;
	    x=imread(file);
	   % set(handles.axes1,'HandleVisibility','ON');
	    %axes(handles.axes1);
	    gray=rgb2gray(x);
        imwrite(gray,'gray.bmp');
        axes(handles.axes7)
        imshow(x);
	end
% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear
%I=imread('1.bmp');
x=imread('gray.bmp');
bw=im2bw(x,0.5);
imwrite(bw,'bw.bmp');
[ind,map]=gray2ind(gray,64);
save ind
msgbox('已保存为灰度图像gray.bmp、索引图像ind.mat、二值图像bw.bmp！','提示信息');
% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
close(gcf);


% --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% clear
I=imread('gray.bmp');
I=double(I);
axes(handles.axes7)
imshow(I,[]);title('原始灰度图像');
h=[0 1 0,1 -4 1,0 1 0];
J=conv2(I,h,'same');
K=I-J;
axes(handles.axes8)
imshow(K,[]);title('拉氏算子对模糊图像进行增强')

% --------------------------------------------------------------------
function Untitled_14_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% clear
I=imread('gray.bmp');
J=im2double(I);
axes(handles.axes7)
imshow(J,[]);title('原始灰度图像');
h2=[-1 -1 -1,-1 9 -1,-1 -1 -1];
h3=[1 -2 1,-2 5 -2,1 -2 1];
h4=1/7.*[-1 -2 -1, -2 19 -2,-1 -2 -1];
A=conv2(J,h2,'same');
axes(handles.axes7)
imshow(A,[]);title('H2算子滤波结果');
B=conv2(J,h3,'same');
axes(handles.axes9)
imshow(B,[]);title('H3算子滤波结果');
C=conv2(J,h4,'same');
axes(handles.axes10)
imshow(C,[]);title('H4算子滤波结果');
