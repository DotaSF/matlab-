function varargout = nidaq(varargin)
% NIDAQ MATLAB code for nidaq.fig
%      NIDAQ, by itself, creates a new NIDAQ or raises the existing
%      singleton*.
%
%      H = NIDAQ returns the handle to a new NIDAQ or the handle to
%      the existing singleton*.
%
%      NIDAQ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NIDAQ.M with the given input arguments.
%
%      NIDAQ('Property','Value',...) creates a new NIDAQ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before nidaq_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to nidaq_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help nidaq

% Last Modified by GUIDE v2.5 29-Apr-2015 16:25:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @nidaq_OpeningFcn, ...
                   'gui_OutputFcn',  @nidaq_OutputFcn, ...
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


% --- Executes just before nidaq is made visible.
function nidaq_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to nidaq (see VARARGIN)
openDAQ=daqfind;
for i=1:length(openDAQ);
    stop(openDAQ(i));
    delete(openDAQ(i));
end
% Choose default command line output for nidaq
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes nidaq wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = nidaq_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global aud RecordLength ShowLength FrequencyWindow1 FrequencyWindow2 fs nBits
global mag idx_last recObj
aud = audiodevinfo;   % 声音设备
% 初始化
RecordLength = 5;  % 录音时间 s
ShowLength = 5;    % 显示的时间长度 s
FrequencyWindow1 = 0;
FrequencyWindow2 = 3000;
fs = 44100;   % 采样频率
nBits = 16;
mag = 1.05;
idx_last = 1;
recObj = audiorecorder(fs,nBits,1);  % 录音设备
if isempty(recObj)
    ;
else
    msgbox('语音设备已检测到！！！');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global aud RecordLength ShowLength FrequencyWindow1 FrequencyWindow2 fs nBits
global mag idx_last recObj myRecording bit x3
% 初始化
x1 = myRecording(max(1,size(myRecording,1)-fs*ShowLength):(2^bit):end);
N=length(x1);              %设置短时傅里叶变换的长度，同时也是汉明窗的长度
x2 = x1-mean(x1); % 零均值化
x3 = smooth(x2);  % 平滑滤波
axes(handles.axes1)
plot(x3,'b-','linewidth',2)
axis tight
title('零均值化--平滑滤波')

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global aud RecordLength ShowLength FrequencyWindow1 FrequencyWindow2 fs nBits
global mag idx_last recObj myRecording bit
record(recObj,RecordLength);         % 录音
tic
while toc<.1
end
bit = 2;
while toc<RecordLength
    
    myRecording = getaudiodata(recObj);
    idx = round(toc*fs);
    while idx-idx_last<.1*fs
        idx = round(toc*fs);
    end

    axes(handles.axes1);
    plot((max(1,size(myRecording,1)-fs*ShowLength):(2^bit):size(myRecording,1))./fs,myRecording(max(1,size(myRecording,1)-fs*ShowLength):(2^bit):end))
    mag = max(abs(myRecording));
    ylim([-1.2 1.2]*mag)
    xlim([max(0,size(myRecording,1)/fs-ShowLength) max(size(myRecording,1)/fs,ShowLength)])
    
    title('声音信号的波形显示');
    ylabel('Signal level(volts) ');
    xlabel('Samples');

    drawnow
    idx_last = idx;
    
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global aud RecordLength ShowLength FrequencyWindow1 FrequencyWindow2 fs nBits
global mag idx_last recObj myRecording
save data.mat aud RecordLength ShowLength FrequencyWindow1 FrequencyWindow2 fs nBits mag idx_last recObj myRecording

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global aud RecordLength ShowLength FrequencyWindow1 FrequencyWindow2 fs nBits
global mag idx_last recObj myRecording bit x3
x4=abs(fft(x3));     % 进行fft变换
axes(handles.axes1)
plot(x4(1:floor(length(x3)/2)),'b-','linewidth',2)
axis tight
title('幅频特性曲线')

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fs
load('data.mat')
% 录音声音 重放
sound(myRecording, fs);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc,clear,
close all force;
