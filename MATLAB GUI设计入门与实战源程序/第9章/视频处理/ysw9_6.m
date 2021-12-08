function varargout = ysw9_6(varargin)
% YSW9_6 MATLAB code for ysw9_6.fig
%      YSW9_6, by itself, creates a new YSW9_6 or raises the existing
%      singleton*.
%
%      H = YSW9_6 returns the handle to a new YSW9_6 or the handle to
%      the existing singleton*.
%
%      YSW9_6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in YSW9_6.M with the given input arguments.
%
%      YSW9_6('Property','Value',...) creates a new YSW9_6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ysw9_6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ysw9_6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ysw9_6

% Last Modified by GUIDE v2.5 06-Jun-2015 15:53:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ysw9_6_OpeningFcn, ...
                   'gui_OutputFcn',  @ysw9_6_OutputFcn, ...
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


% --- Executes just before ysw9_6 is made visible.
function ysw9_6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ysw9_6 (see VARARGIN)

% Choose default command line output for ysw9_6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ysw9_6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ysw9_6_OutputFcn(hObject, eventdata, handles) 
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
warning off 
feature jit off
videoObject = VideoReader('ysw.avi'); % 读取视频
numFrames = get(videoObject, 'numberOfFrames');
fileName = get(videoObject, 'Name');
axes(handles.axes1)
for i=1:numFrames
    im = read(videoObject, i);
    imshow(im)
    drawnow;
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc,clear,close all


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
geshi = { '*.jpg','JPEG image (*.jpg)';...
       '*.bmp','Bitmap image (*.bmp)';...
       '*.*','All Files (*.*)'};
[FileName,FilePath] = uigetfile(geshi,'导入外部数据',...
'*.jpg','MultiSelect','on');% 选中所有的图片
% 如果选择了图片文件，生成图片文件的完整路径，否则退出程序，不再运行后面命令
if ~isequal([FileName,FilePath],[0,0]);
    FileFullName = strcat(FilePath,FileName);
else
    return;
end
n = length(FileFullName);  % 选择的图片文件个数 ，全选
for i=1:n
    im = imread(FileFullName{1,i});
    imshow(im)
    drawnow;
end
