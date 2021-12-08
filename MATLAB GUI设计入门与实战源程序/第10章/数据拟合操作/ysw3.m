function varargout = ysw3(varargin)
% YSW3 MATLAB code for ysw3.fig
%      YSW3, by itself, creates a new YSW3 or raises the existing
%      singleton*.
%
%      H = YSW3 returns the handle to a new YSW3 or the handle to
%      the existing singleton*.
%
%      YSW3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in YSW3.M with the given input arguments.
%
%      YSW3('Property','Value',...) creates a new YSW3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ysw3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ysw3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ysw3

% Last Modified by GUIDE v2.5 10-Jun-2015 15:33:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ysw3_OpeningFcn, ...
                   'gui_OutputFcn',  @ysw3_OutputFcn, ...
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


% --- Executes just before ysw3 is made visible.
function ysw3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ysw3 (see VARARGIN)

% Choose default command line output for ysw3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ysw3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ysw3_OutputFcn(hObject, eventdata, handles) 
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
global data
geshi = { '*.mat','数组 (*.mat)';...
       '*.txt','文本文件 (*.txt)';...
       '*.*','All Files (*.*)'};
[FileName,FilePath] = uigetfile(geshi,'导入外部数据',...
'*.mat','MultiSelect','on');% 选中数组
% 生成文件的完整路径，否则退出程序
FileFullName = strcat(FilePath,FileName);
% data = load(FileFullName);
data=importfile1(FileFullName);
if size(data,1)>1
    data=data';
end
axes(handles.axes1)
plot(data,'m.--')


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off
feature jit off
global data
%% 线性拟合
t = 1:length(data);
t1 = 1:0.1:length(data);
fitResults1 = polyfit(t, data, 1);
% 计算多项式
yp = polyval(fitResults1, t1);
axes(handles.axes1)
plot(t,data,'b.--')
hold on
plot(t1,yp,'r-','linewidth',2)
hold off

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off
feature jit off
global data
%% 线性拟合
t = 1:length(data);
t1 = 1:0.1:length(data);
fitResults1 = polyfit(t, data, 2);
% 计算多项式
yp = polyval(fitResults1, t1);
axes(handles.axes1)
plot(t,data,'b.--')
hold on
plot(t1,yp,'r-','linewidth',2)
hold off


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off
feature jit off
global data
%% 3次拟合
t = 1:length(data);
t1 = 1:0.1:length(data);
fitResults1 = polyfit(t, data, 3);
% 计算多项式
yp = polyval(fitResults1, t1);
axes(handles.axes1)
plot(t,data,'b.--')
hold on
plot(t1,yp,'r-','linewidth',2)
hold off

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off
feature jit off
global data
%% 4次拟合
t = 1:length(data);
t1 = 1:0.1:length(data);
fitResults1 = polyfit(t, data, 4);
% 计算多项式
yp = polyval(fitResults1, t1);
axes(handles.axes1)
plot(t,data,'b.--')
hold on
plot(t1,yp,'r-','linewidth',2)
hold off

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off
feature jit off
global data
%% 5次拟合
t = 1:length(data);
t1 = 1:0.1:length(data);
fitResults1 = polyfit(t, data, 5);
% 计算多项式
yp = polyval(fitResults1, t1);
axes(handles.axes1)
plot(t,data,'b.--')
hold on
plot(t1,yp,'r-','linewidth',2)
hold off

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off
feature jit off
global data
%% 6次拟合
t = 1:length(data);
t1 = 1:0.1:length(data);
fitResults1 = polyfit(t, data, 6);
% 计算多项式
yp = polyval(fitResults1, t1);
axes(handles.axes1)
plot(t,data,'b.--')
hold on
plot(t1,yp,'r-','linewidth',2)
hold off

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off
feature jit off
global data
%% 7次拟合
t = 1:length(data);
t1 = 1:0.1:length(data);
fitResults1 = polyfit(t, data, 7);
% 计算多项式
yp = polyval(fitResults1, t1);
axes(handles.axes1)
plot(t,data,'b.--')
hold on
plot(t1,yp,'r-','linewidth',2)
hold off

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off
feature jit off
global data
%% 8次拟合
t = 1:length(data);
t1 = 1:0.1:length(data);
fitResults1 = polyfit(t, data, 8);
% 计算多项式
yp = polyval(fitResults1, t1);
axes(handles.axes1)
plot(t,data,'b.--')
hold on
plot(t1,yp,'r-','linewidth',2)
hold off

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc,clear,close all
