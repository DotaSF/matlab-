function varargout = zuoye(varargin)
% ZUOYE MATLAB code for zuoye.fig
%      ZUOYE, by itself, creates a new ZUOYE or raises the existing
%      singleton*.
%
%      H = ZUOYE returns the handle to a new ZUOYE or the handle to
%      the existing singleton*.
%
%      ZUOYE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZUOYE.M with the given input arguments.
%
%      ZUOYE('Property','Value',...) creates a new ZUOYE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zuoye_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zuoye_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zuoye

% Last Modified by GUIDE v2.5 25-Jun-2019 10:01:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zuoye_OpeningFcn, ...
                   'gui_OutputFcn',  @zuoye_OutputFcn, ...
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


% --- Executes just before zuoye is made visible.
function zuoye_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zuoye (see VARARGIN)

mainHandle=zuoyefigure1();
pause(3);
close(mainHandle);

% Choose default command line output for zuoye
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zuoye wait for user response (see UIRESUME)
% uiwait(handles.figure);


% --- Outputs from this function are returned to the command line.
function varargout = zuoye_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ziyouhua.
function ziyouhua_Callback(hObject, eventdata, handles)
% hObject    handle to ziyouhua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%这里实现Kp的调参，由小到大，直到临界震荡
%目前的传递函数：
%[433.72]
%[0.0063 0.907 1 0]
load_system('pidsss');
%temp = get_param('pidsss/Transfer Fcn','DialogParameters')%获取模块参数和名称
% Transfer Fcn的模块参数和名称
%                     Numerator: [1x1 struct]
%                   Denominator: [1x1 struct]
%             AbsoluteTolerance: [1x1 struct]
%     ContinuousStateAttributes: [1x1 struct]

num = get(handles.edit4,'string');
den = get(handles.edit5,'String');%传递函数分母，需要中括号
set_param('pidsss/Transfer Fcn','Denominator',den);%设定传递函数参数
set_param('pidsss/Transfer Fcn','Numerator',num);
set_param('pidsss/Subsystem','Ki','0');%Ki和Kd都设置为零
set_param('pidsss/Subsystem','Kd','0');
set(handles.Ki,'String','0');
set(handles.Kd,'String','0');
% sim('pidsss');%调用simulink
% tt = ScopeData(:,1);
% y1 = ScopeData(:,2);
% y2 = ScopeData(:,3);
kp = str2num(get(handles.Kp,'string'));
global flag
flag =1;
while flag    %对Kp进行迭代优化
    kp = kp+0.01;   %增长率
    set_param('pidsss/Subsystem','Kp',num2str(kp));
    set(handles.Kp,'String',kp);
    sim('pidsss');
    tt = ScopeData(:,1);
    tt = tt';
    y1 = ScopeData(:,2);
    y1 = y1';
    y2 = ScopeData(:,3);
    y2 = y2';
    for i=2:length(y2)-1%直接从数据的角度找峰值
        if(y2(i)>y2(i-1)&&y2(i)>y2(i+1))
            top1 = tt(i); %第一个波峰时间
            Y1 = y2(i);  %第一个波峰
            a = i+1;
            break;
        end
    end
    for i=a:length(y2)-1
        if(y2(i)<y2(i-1)&&y2(i)<y2(i+1))
            G1 = y2(i);  %第一个波谷
            a = i+1;
            break;
        end
    end
    for i=a:length(y2)-1
        if(y2(i)>y2(i-1)&&y2(i)>y2(i+1))
            top2 = tt(i); %第二个波峰时间
            Y2 = y2(i);  %第一个波峰
            break;
        end
    end

    plot(tt,y1,'b',tt,y2,'r');%先把图画出来
    legend('y(t)','e(t)');
    title('step response');xlabel('time');ylabel('response');
    pause(0.1)
    YS = get_param('pidsss/Step','After');
    YS = str2num(YS);%注意，从simulink那边获取来的全是字符
    %阶跃的参数名
%                   Time: [1x1 struct]
%             Before: [1x1 struct]
%              After: [1x1 struct]
%         SampleTime: [1x1 struct]
%     VectorParams1D: [1x1 struct]
%          ZeroCross: [1x1 struct]
    if (Y1>YS)&&(G1<YS)
        if abs(1-(Y1-YS)/(Y2-YS))<0.01  %YS为阶跃终值
            %当两个波峰高度之比接近一时认为震荡
            pause(2)
            Tc = top2 - top1;%Tc是震荡周期
            Kc = kp
            break
        end
    end
end
if flag == 1
    kp = Kc*0.6
    ki = Tc*0.5
    kd = Tc*0.125
    set(handles.Ki,'String',ki);
    set(handles.Kd,'String',kd);
    set_param('pidsss/Subsystem','Kp',num2str(kp));%Ki和Kd都设置为零
    set_param('pidsss/Subsystem','Ki',num2str(ki));%Ki和Kd都设置为零
    set_param('pidsss/Subsystem','Kd',num2str(kd));
    sim('pidsss')
    tt = ScopeData(:,1);
    y1 = ScopeData(:,2);
    y2 = ScopeData(:,3);

    plot(tt,y1,'b',tt,y2,'r');
    legend('y(t)','e(t)');
    title('step response');xlabel('time');ylabel('response');
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in xianshi.
function xianshi_Callback(hObject, eventdata, handles)
% hObject    handle to xianshi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load_system('pidsss');
%temp = get_param('pidsss/Zero-Pole','DialogParameters')%获取模块参数和名称
kp = str2num(get(handles.Kp,'string'))
ki = str2num(get(handles.Ki,'string'))
kd = str2num(get(handles.Kd,'string'))
num = get(handles.edit4,'string')
den = get(handles.edit5,'String')%传递函数分母，需要中括号
set_param('pidsss/Transfer Fcn','Denominator',den);%设定传递函数参数
set_param('pidsss/Transfer Fcn','Numerator',num);
set_param('pidsss/Subsystem','Kp',num2str(kp));%设定仿真中的PID参数
set_param('pidsss/Subsystem','Ki',num2str(ki));
set_param('pidsss/Subsystem','Kd',num2str(kd));
sim('pidsss');%调用simulink
tt = ScopeData(:,1);
y1 = ScopeData(:,2);
y2 = ScopeData(:,3);

plot(tt,y1,'b',tt,y2,'r');
legend('y(t)','e(t)');
title('step response');xlabel('time');ylabel('response');


function Kp_Callback(hObject, eventdata, handles)
% hObject    handle to Kp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Kp as text
%        str2double(get(hObject,'String')) returns contents of Kp as a double


% --- Executes during object creation, after setting all properties.
function Kp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Kp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ki_Callback(hObject, eventdata, handles)
% hObject    handle to Ki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ki as text
%        str2double(get(hObject,'String')) returns contents of Ki as a double


% --- Executes during object creation, after setting all properties.
function Ki_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Kd_Callback(hObject, eventdata, handles)
% hObject    handle to Kd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Kd as text
%        str2double(get(hObject,'String')) returns contents of Kd as a double


% --- Executes during object creation, after setting all properties.
function Kd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Kd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double




% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Kp1.
function Kp1_Callback(hObject, eventdata, handles)
% hObject    handle to Kp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Kp优化，这里需要找到系统临界震荡的值，需要自己定义大概多少算震荡
%可以把相邻两个波峰做比较，如果比例上小于80%，判定不震荡


% --- Executes on button press in Ki1.
function Ki1_Callback(hObject, eventdata, handles)
% hObject    handle to Ki1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Kd1.
function Kd1_Callback(hObject, eventdata, handles)
% hObject    handle to Kd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on key press with focus on figure or any of its controls.
function figure_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
a = eventdata.Key;
%set(handles.edit5,'string',a)%显示按键的响应值
if a == 'return'
    xianshi_Callback(hObject, eventdata, handles);
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit4.
function edit4_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'String', '', 'Enable', 'on','ForegroundColor','black');
uicontrol(hObject);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit5.
function edit5_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'String', '', 'Enable', 'on','ForegroundColor','black');
uicontrol(hObject);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag
if flag == 1
    flag = 0;
    set(handles.pushbutton10,'String','继续');
else
    set(handles.pushbutton10,'String','停止');
    ziyouhua_Callback(hObject, eventdata, handles)
end
