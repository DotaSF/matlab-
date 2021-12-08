function varargout = plot_ysw(varargin)
% PLOT_YSW MATLAB code for plot_ysw.fig
%      PLOT_YSW, by itself, creates a new PLOT_YSW or raises the existing
%      singleton*.
%
%      H = PLOT_YSW returns the handle to a new PLOT_YSW or the handle to
%      the existing singleton*.
%
%      PLOT_YSW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOT_YSW.M with the given input arguments.
%
%      PLOT_YSW('Property','Value',...) creates a new PLOT_YSW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before plot_ysw_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to plot_ysw_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help plot_ysw

% Last Modified by GUIDE v2.5 06-Jun-2015 16:05:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plot_ysw_OpeningFcn, ...
                   'gui_OutputFcn',  @plot_ysw_OutputFcn, ...
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


% --- Executes just before plot_ysw is made visible.
function plot_ysw_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to plot_ysw (see VARARGIN)

% Choose default command line output for plot_ysw
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes plot_ysw wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = plot_ysw_OutputFcn(hObject, eventdata, handles) 
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
axes(handles.axes1)
plot(data)


    


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global data
index1 = get(handles.popupmenu1, 'Value');  % 线型
lx = ['-','--','.','o',':','*','s','h','p'];
index2 = get(handles.popupmenu2, 'Value');  % 颜色
colors = ['r','g','b','c','m','y','k'];
index3 = get(handles.popupmenu3, 'Value');  % 线宽
lw =[0.5,1,1.5,2,2.5,3,3.5,4];

axes(handles.axes1)
plot(data,lx(index1),'color',colors(index2),'linewidth',lw(index3));



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global data
index1 = get(handles.popupmenu1, 'Value');  % 线型
lx = ['-','--','.','o',':','*','s','h','p'];
index2 = get(handles.popupmenu2, 'Value');  % 颜色
colors = ['r','g','b','c','m','y','k'];
index3 = get(handles.popupmenu3, 'Value');  % 线宽
lw =[0.5,1,1.5,2,2.5,3,3.5,4];

axes(handles.axes1)
plot(data,lx(index1),'color',colors(index2),'linewidth',lw(index3));

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc,clear,close all

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
global data
index1 = get(handles.popupmenu1, 'Value');  % 线型
lx = ['-','--','.','o',':','*','s','h','p'];
index2 = get(handles.popupmenu2, 'Value');  % 颜色
colors = ['r','g','b','c','m','y','k'];
index3 = get(handles.popupmenu3, 'Value');  % 线宽
lw =[0.5,1,1.5,2,2.5,3,3.5,4];

axes(handles.axes1)
plot(data,lx(index1),'color',colors(index2),'linewidth',lw(index3));

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
