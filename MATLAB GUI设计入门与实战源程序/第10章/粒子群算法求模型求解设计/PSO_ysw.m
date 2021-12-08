function varargout = PSO_ysw(varargin)
% PSO_YSW MATLAB code for PSO_ysw.fig
%      PSO_YSW, by itself, creates a new PSO_YSW or raises the existing
%      singleton*.
%
%      H = PSO_YSW returns the handle to a new PSO_YSW or the handle to
%      the existing singleton*.
%
%      PSO_YSW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PSO_YSW.M with the given input arguments.
%
%      PSO_YSW('Property','Value',...) creates a new PSO_YSW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PSO_ysw_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PSO_ysw_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PSO_ysw

% Last Modified by GUIDE v2.5 08-Jun-2015 15:52:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PSO_ysw_OpeningFcn, ...
                   'gui_OutputFcn',  @PSO_ysw_OutputFcn, ...
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


% --- Executes just before PSO_ysw is made visible.
function PSO_ysw_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PSO_ysw (see VARARGIN)

% Choose default command line output for PSO_ysw
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PSO_ysw wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PSO_ysw_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1

set(handles.radiobutton1, 'Value', 1);
set(handles.radiobutton2, 'Value', 0);
set(handles.radiobutton3, 'Value', 0);
set(handles.radiobutton4, 'Value', 0);

%����Ackley����ͼ��
x=[-8:0.1:8];
y=x;
[X,Y]=meshgrid(x,y);
[row,col]=size(X);
for l=1:col
    for h=1:row
        z(h,l)=Ackley([X(h,l),Y(h,l)]);
    end
end
axes(handles.axes1)
mesh(X,Y,z);
shading interp


function y=Ackley(x)
%Ackley ����
%����x,������Ӧ��yֵ,��x=(0,0,��,0)?����ȫ�ּ�С��0,Ϊ�õ����ֵ������ֵȡ�෴��??
[row,col]=size(x);
if row>1
    error('����Ĳ�������');
end
y=-20*exp(-0.2*sqrt((1/col)*(sum(x.^2))))-exp((1/col)*sum(cos(2*pi.*x)))+exp(1)+20;


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 1);
set(handles.radiobutton3, 'Value', 0);
set(handles.radiobutton4, 'Value', 0);
% ����Griewank����ͼ��
x = [-20 : 0.3 : 20];
y = x;
[X,Y] = meshgrid(x,y);
[row,col] = size(X);
for l = 1 :col
    for h = 1 :row
        z(h,l) = Griewank([X(h,l),Y(h,l)]);
    end
end
axes(handles.axes1)
mesh(X,Y,z);
view([-15.5 30]);
shading interp



function y=Griewank(x)
% Griewan����
% ����x,������Ӧ��yֵ,��x = ( 0 , 0 ,��, 0 )����ȫ�ּ�С��0.
[row,col] = size(x);
if  row > 1
    error( ' ����Ĳ������� ' );
end
y1 = 1 / 4000 * sum(x.^2 );
y2 = 1 ;
for  h = 1 :col
    y2 = y2 * cos(x(h) / sqrt(h));
end
y = y1 - y2 + 1 ;
y =- y;


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 0);
set(handles.radiobutton3, 'Value', 1);
set(handles.radiobutton4, 'Value', 0);

% ����Rastrigin����ͼ��
x = [-5 : 0.05 : 5 ];
y = x;
[X,Y] = meshgrid(x,y);
[row,col] = size(X);
for  l = 1 :col
     for  h = 1 :row
        z(h,l) = Rastrigin([X(h,l),Y(h,l)]);
    end
end
axes(handles.axes1)
mesh(X,Y,z);
shading interp


function y = Rastrigin(x)
% Rastrigin����
% ����x,������Ӧ��yֵ,��x = ( 0 , 0 ,��, 0 )����ȫ�ּ�С��0.
[row,col] = size(x);
if  row > 1 
    error( ' ����Ĳ������� ' );
end
y = sum(x.^2 - 10 * cos( 2 * pi * x) + 10 );
y =y;


% --- Executes on button press in radiobutton3.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 0);
set(handles.radiobutton3, 'Value', 0);
set(handles.radiobutton4, 'Value', 1);
% Schaffer����
x=[-5:0.05:5];
y=x;
[X,Y]=meshgrid(x,y);
[row,col]=size(X);
for l=1:col
    for h=1:row
        z(h,l)=Schaffer([X(h,l),Y(h,l)]);
    end
end
axes(handles.axes1)
mesh(X,Y,z);
shading interp


function result=Schaffer(x1)
% Schaffer����
% ����x,������Ӧ��yֵ,��x=(0,0,��,0)����ȫ�ּ����
[row,col]=size(x1);
if row>1
    error('����Ĳ�������');
end
x=x1(1,1);
y=x1(1,2);
temp=x^2+y^2;
result=0.5-(sin(sqrt(temp))^2-0.5)/(1+0.001*temp)^2;


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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc,clear,close all



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



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����Ⱥ�㷨�е���������
c1 = str2num( get(handles.edit1,'string') );
c2 = str2num( get(handles.edit2,'string') );
maxg=str2num( get(handles.edit5,'string') );          %��������  
sizepop=str2num( get(handles.edit6,'string') );         %��Ⱥ��ģ
% ��ʼ�ٶȺ���Ⱥ���±߽�ֵ
Vmax=str2num( get(handles.edit4,'string') );
Vmin=str2num( get(handles.edit3,'string') );
popmax=5;
popmin=-5;

f1 = get(handles.radiobutton1, 'Value');
if f1==1
    fun=@Ackley_Fun;
end
f2 = get(handles.radiobutton2, 'Value');
if f2==1
    fun=@griewank_func;
end
f3 = get(handles.radiobutton3, 'Value');
if f3==1
    fun=@rastrigin_func;
end
f4 = get(handles.radiobutton4, 'Value');
if f4==1
    fun=@Shaffer_Fun;
end

%% ������ʼ���Ӻ��ٶ�
for i=1:sizepop
    %�������һ����Ⱥ
    pop(i,:)=5*rands(1,2);    %��ʼ��Ⱥ
    V(i,:)=rands(1,2);        %��ʼ���ٶ�
    %������Ӧ��
    fitness(i)=fun(pop(i,:));   %Ⱦɫ�����Ӧ��
end

%����õ�Ⱦɫ��
[bestfitness bestindex]=min(fitness);
zbest=pop(bestindex,:);   	%ȫ�����
gbest=pop;              	%�������
fitnessgbest=fitness;     		%���������Ӧ��ֵ
fitnesszbest=bestfitness; 		%ȫ�������Ӧ��ֵ

%% ����Ѱ��
for i=1:maxg
    for j=1:sizepop
        
        %�ٶȸ���
        V(j,:) = V(j,:) + c1*rand*(gbest(j,:) - pop(j,:)) + c2*rand*(zbest - pop(j,:));
        V(j,find(V(j,:)>Vmax))=Vmax;
        V(j,find(V(j,:)<Vmin))=Vmin;
        
        %��Ⱥ����
        pop(j,:)=pop(j,:)+0.5*V(j,:);
        pop(j,find(pop(j,:)>popmax))=popmax;
        pop(j,find(pop(j,:)<popmin))=popmin;
        
        %����Ӧ����
        if rand>0.8
            k=ceil(2*rand);
            pop(j,k)=rand;
        end
      
        %��Ӧ��ֵ
        fitness(j)=fun(pop(j,:));
        
        
        %�������Ÿ���
        if fitness(j) < fitnessgbest(j)
            gbest(j,:) = pop(j,:);
            fitnessgbest(j) = fitness(j);
        end
        
        %Ⱥ�����Ÿ���
        if fitness(j) < fitnesszbest
            zbest = pop(j,:);
            fitnesszbest = fitness(j);
        end
        
    end
    yy(i)=fitnesszbest;    
        
end
%% �������
axes(handles.axes2)
plot(yy,'Linewidth',2)
title(['��Ӧ������  ' '��ֹ������' num2str(maxg)]);
grid on
xlabel('��������');ylabel('��Ӧ��');
% ������
zbest; %��Ѹ���ֵ

set(handles.edit7,'string',zbest(1));
set(handles.edit8,'string',zbest(2));
