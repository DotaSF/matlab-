function varargout = ACO_ysw(varargin)
% ACO_YSW MATLAB code for ACO_ysw.fig
%      ACO_YSW, by itself, creates a new ACO_YSW or raises the existing
%      singleton*.
%
%      H = ACO_YSW returns the handle to a new ACO_YSW or the handle to
%      the existing singleton*.
%
%      ACO_YSW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ACO_YSW.M with the given input arguments.
%
%      ACO_YSW('Property','Value',...) creates a new ACO_YSW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ACO_ysw_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ACO_ysw_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ACO_ysw

% Last Modified by GUIDE v2.5 08-Jun-2015 20:55:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ACO_ysw_OpeningFcn, ...
                   'gui_OutputFcn',  @ACO_ysw_OutputFcn, ...
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


% --- Executes just before ACO_ysw is made visible.
function ACO_ysw_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ACO_ysw (see VARARGIN)

% Choose default command line output for ACO_ysw
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ACO_ysw wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ACO_ysw_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc,clear,close all

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y
n = str2num( get(handles.edit1,'string') ); % n表示城市数目
r = str2num( get(handles.edit2,'string') ); % r表示轨迹持久性
a = str2num( get(handles.edit3,'string') );  % a表示轨迹相对重要性
b = str2num( get(handles.edit4,'string') );  % b表示能见度相对重要性
maxgen = str2num( get(handles.edit5,'string') );  % 迭代次数
sizepop = str2num( get(handles.edit6,'string') ); % 蚂蚁种群数
c=100;     % 轨迹信息素强度，常数
q=10^(+6); % 较大的常数

% 距离求解
for i=1:n
    for j=1:n
        dij(i,j)=sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);%距离
    end
end
for i=1:n
    dij(i,i)=0.01;
end
% 初始化
min10=10^5;
t=ones(n)*c;

axes(handles.axes2)
% 进入迭代寻优
for nc=1:maxgen 
    
    tabu=ones(sizepop,n);%禁忌表
    tabu(:,1)=0;
    % 产生路径，即1-n的一个随机序列，当然也可以直接用randperm(n)实现
    path=ones(sizepop,n);
    for k=1:sizepop
        for step=1:n-1
            ta=t.^a;
            tb=dij.^(-b);
            td=ta.*tb;
            pd=tabu(k,:).*td(path(k,step),:);
            pk=pd/sum(pd);%概率
            rk=rand;
            spk=0;
            j=1;
            while j<=n;
                if rk<spk+pk(j)
                    break;
                else 
                    spk=spk+pk(j);
                    j=j+1;
                end
            end
            tabu(k,j)=0;
            path(k,step+1)=j;
        end
    end
    % 路径产生完毕
    
    dt=zeros(n);
    for i=1:sizepop
        ltsp(i)=ca_tsp(n,path(i,:),dij);  % 计算TSP距离
        for k=1:n-1
            dt(path(i,k),path(i,k+1))=dt(path(i,k),path(i,k+1))+q/ltsp(i);
            dt(path(i,k+1),path(i,k))=dt(path(i,k),path(i,k+1));
        end
        dt(path(i,n),path(i,1))=dt(path(i,n),path(i,1));
        dt(path(i,1),path(i,n))=dt(path(i,n),path(i,1)); 
    end
    
    [min1,i]=min(ltsp);
    if min1<min10;
        min10=min1;
        c0=path(i,:);  % 最短路径
        
        % 实时画图
        axes(handles.axes2)
        for i=1:n
            plot(x(i),y(i),'bo')
            hold on
            text(x(i)+1,y(i)+1,num2str(i))
        end
        for i=1:n
            if i<n
                plot([x(c0(i)),x(c0(i+1))],[y(c0(i)),y(c0(i+1))],'r-')
                hold on
            else
                plot([x(c0(1)),x(c0(i))],[y(c0(1)),y(c0(i))],'r-')
            end
        end
        hold off
    
    end
    
    t=r*t+dt;
end

% axes(handles.axes2)
% for i=1:n
%     if i<n
%         plot([x(c0(i)),x(c0(i+1))],[y(c0(i)),y(c0(i+1))],'ro-')
%     else
%         plot([x(c0(1)),x(c0(i))],[y(c0(1)),y(c0(i))],'ro-')
%     end
% end

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global x y
set(handles.radiobutton1, 'Value', 1);
set(handles.radiobutton2, 'Value', 0);
x=[41,37,54,25,7,2,68,71,54,83,64,18,22,83,91,...
    25,24,58,71,74,87,18,13,82,62,58,45,41,44,4];
y=[94,84,67,62,64,99,58,44,62,69,60,54,60,46,38,...
    38,42,69,71,78,76,40,40,7,32,35,21,26,35,50];
n = str2num( get(handles.edit1,'string') );
axes(handles.axes1)
for i=1:length(x)
    plot(x(i),y(i),'bo')
    hold on
    text(x(i)+1,y(i)+1,num2str(i))
end
hold off

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global x y
set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 1);
n = str2num( get(handles.edit1,'string') );
axes(handles.axes1)
for i=1:n
    x(i)=100*rand;
    y(i)=100*rand;
    plot(x(i),y(i),'bo')
    hold on
    text(x(i)+1,y(i)+1,num2str(i))
end
hold off
