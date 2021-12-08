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

% Last Modified by GUIDE v2.5 08-Jun-2015 13:14:02

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
[filename,pathname]=uigetfile({'*.jpg';'*.bmp';'*.tif'},'ѡ��ͼƬ');
str=[pathname,filename];
im=imread(str);
axes(handles.axes1);
imshow(im)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im1
im1 = rgb2hsv(im);    % RGBת��ΪHSV
axes(handles.axes2);
imshow(im1)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im1
im2 = hsv2rgb(im1);    % HSVת��ΪRGB
axes(handles.axes2);
imshow(im2)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im3
im3 = rgb2ycbcr(im);    % RGBת��ΪYCbCr
axes(handles.axes2);
imshow(im3)

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im3
im4 = ycbcr2rgb(im3);    % YCbCrת��ΪRGB
axes(handles.axes2);
imshow(im4)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc,clear,close all
