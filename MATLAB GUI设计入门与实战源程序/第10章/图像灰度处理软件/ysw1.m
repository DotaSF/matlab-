function varargout = ysw1(varargin)
% YSW1 MATLAB code for ysw1.fig
%      YSW1, by itself, creates a new YSW1 or raises the existing
%      singleton*.
%
%      H = YSW1 returns the handle to a new YSW1 or the handle to
%      the existing singleton*.
%
%      YSW1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in YSW1.M with the given input arguments.
%
%      YSW1('Property','Value',...) creates a new YSW1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ysw1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ysw1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ysw1

% Last Modified by GUIDE v2.5 08-Jun-2015 14:24:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ysw1_OpeningFcn, ...
                   'gui_OutputFcn',  @ysw1_OutputFcn, ...
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


% --- Executes just before ysw1 is made visible.
function ysw1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ysw1 (see VARARGIN)

% Choose default command line output for ysw1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ysw1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ysw1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
[filename,pathname]=uigetfile({'*.jpg';'*.bmp';'*.tif'},'????????');
str=[pathname,filename];
im=imread(str);
axes(handles.axes1);
imshow(im)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
im1 = imcrop();
axes(handles.axes2);
imshow(im1)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc,clear,close all


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
im2 = im(end:-1:1,:,:);

axes(handles.axes2);
imshow(im2)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
im3 = im(:,end:-1:1,:);

axes(handles.axes2);
imshow(im3)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
im4 = im(end:-1:1,end:-1:1,:);

axes(handles.axes2);
imshow(im4)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
if size(im,3)==1
    im5 = medfilt2(im,[3,2]);
else
    im51=medfilt2(im(:,:,1),[3,2]);
    im52=medfilt2(im(:,:,2),[3,2]);
    im53=medfilt2(im(:,:,3),[3,2]);
    im5 = cat(3,im51,im52,im53);
end

axes(handles.axes2);
imshow(im5)

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
img = im;
img_1=img(:,:,1);  % R
img_2=img(:,:,2);  % G
img_3=img(:,:,3);  % B
Y=0.299*img_1+0.587*img_2+0.114*img_3;  % ??????????
[m,n]=size(Y);
k=Y(1,1);
for i=1:m
    for j=1:n
        if Y(i,j)>=k    % ????????
            k=Y(i,j);
            k1=i;    % ????????
            k2=j;    % ????????
        end
    end
end
[m1,n1]=find(Y==k);
Rave=sum(sum(img_1));    % ????
Rave=Rave/(m*n);         % ????????
Gave=sum(sum(img_2));    % ????
Gave=Gave/(m*n);
Bave=sum(sum(img_3));    % ????
Bave=Bave/(m*n);
Kave=(Rave+Gave+Bave)/3;   % ??????
img_1=(Kave/Rave)*img_1;    % ????R????
img_2=(Kave/Gave)*img_2;    % ????G????
img_3=(Kave/Bave)*img_3;    % ????B????
imgysw=cat(3,img_1,img_2,img_3);

axes(handles.axes2);
imshow(imgysw)
