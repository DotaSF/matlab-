function varargout = ysw9_1(varargin)
% YSW9_1 MATLAB code for ysw9_1.fig
%      YSW9_1, by itself, creates a new YSW9_1 or raises the existing
%      singleton*.
%
%      H = YSW9_1 returns the handle to a new YSW9_1 or the handle to
%      the existing singleton*.
%
%      YSW9_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in YSW9_1.M with the given input arguments.
%
%      YSW9_1('Property','Value',...) creates a new YSW9_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ysw9_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ysw9_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ysw9_1

% Last Modified by GUIDE v2.5 05-Jun-2015 10:31:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ysw9_1_OpeningFcn, ...
                   'gui_OutputFcn',  @ysw9_1_OutputFcn, ...
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


% --- Executes just before ysw9_1 is made visible.
function ysw9_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ysw9_1 (see VARARGIN)

% Choose default command line output for ysw9_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ysw9_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ysw9_1_OutputFcn(hObject, eventdata, handles) 
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
h = waitbar(0.1,'Please wait, check hardware......');
global vid
vid = videoinput('winvideo',1);
vid_src=getselectedsource(vid);
data = (getsnapshot(vid)); % 初始化
waitbar(0.5,h,'Please wait, initialize the window');
set(vid,'TriggerRepeat',Inf);
set(vid,'FramesPerTrigger',1);
set(vid,'FrameGrabInterval',1);
vidRes = get(vid, 'VideoResolution');
nBands = get(vid, 'NumberOfBands');
axes(handles.axes1);
% waitbar(0.8,h,'Please wait, initialize the window');
% preview(vid)  % 不能采用该函数，不然无法在GUI上显示场景
for i=1:30
    data = (getsnapshot(vid));
    imshow(data)
    drawnow;
end



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc,clear,close all
