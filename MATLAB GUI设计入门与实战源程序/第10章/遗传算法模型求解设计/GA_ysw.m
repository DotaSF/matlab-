function varargout = GA_ysw(varargin)
% GA_YSW MATLAB code for GA_ysw.fig
%      GA_YSW, by itself, creates a new GA_YSW or raises the existing
%      singleton*.
%
%      H = GA_YSW returns the handle to a new GA_YSW or the handle to
%      the existing singleton*.
%
%      GA_YSW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GA_YSW.M with the given input arguments.
%
%      GA_YSW('Property','Value',...) creates a new GA_YSW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GA_ysw_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GA_ysw_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GA_ysw

% Last Modified by GUIDE v2.5 08-Jun-2015 19:44:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GA_ysw_OpeningFcn, ...
                   'gui_OutputFcn',  @GA_ysw_OutputFcn, ...
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


% --- Executes just before GA_ysw is made visible.
function GA_ysw_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GA_ysw (see VARARGIN)

% Choose default command line output for GA_ysw
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GA_ysw wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GA_ysw_OutputFcn(hObject, eventdata, handles) 
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

%绘制Ackley函数图形
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
%Ackley?函数??
%输入x,给出相应的y值,在x=(0,0,…,0)?处有全局极小点0,为得到最大值，返回值取相反数??
[row,col]=size(x);
if row>1
    error('输入的参数错误');
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
% 绘制Griewank函数图形
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
% Griewan函数
% 输入x,给出相应的y值,在x = ( 0 , 0 ,…, 0 )处有全局极小点0.
[row,col] = size(x);
if  row > 1
    error( ' 输入的参数错误 ' );
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
% Schaffer函数
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
% Schaffer函数
% 输入x,给出相应的y值,在x=(0,0,…,0)处有全局极大点
[row,col]=size(x1);
if row>1
    error('输入的参数错误');
end
x=x1(1,1);
y=x1(1,2);
temp=x^2+y^2;
result=0.5-(sin(sqrt(temp))^2-0.5)/(1+0.001*temp)^2;


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 0);
set(handles.radiobutton3, 'Value', 0);
set(handles.radiobutton4, 'Value', 1);

% 绘制Rastrigin函数图形
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
% Rastrigin函数
% 输入x,给出相应的y值,在x = ( 0 , 0 ,…, 0 )处有全局极小点0.
[row,col] = size(x);
if  row > 1 
    error( ' 输入的参数错误 ' );
end
y = sum(x.^2 - 10 * cos( 2 * pi * x) + 10 );
y =y;


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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%GA算法中的两个参数
pc = str2num( get(handles.edit1,'string') );
pm = str2num( get(handles.edit2,'string') );
maxgen=str2num( get(handles.edit3,'string') );          %进化次数  
sizepop=str2num( get(handles.edit4,'string') );         %种群规模

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
    fun=@Shaffer_Fun;
end
f4 = get(handles.radiobutton4, 'Value');
if f4==1
    fun=@rastrigin_func;
end

% 初始速度和种群上下边界值
popmax=5;    popmin=-5;
% 遗传算法参数设置
lenchrom = 2;    % 染色体编码长度 ，2个变量
% 上下边界
bound=[popmin*ones(lenchrom,1),popmax*ones(lenchrom,1)];
%% 产生初始个体和速度
for i=1:sizepop
    %随机产生一个种群
 % 随机产生一个种群
    individuals.chrom(i,:)=Code(lenchrom,bound); % 编码（binary和grey的编码结果为一个实数，float的编码结果为一个实数向量）
    x=individuals.chrom(i,:);
    % 计算适应度
    individuals.fitness(i)=fun(x);   % 染色体的适应度 
end
%% 找最好的染色体
[bestfitness,bestindex] = min(individuals.fitness);
bestchrom = individuals.chrom(bestindex,:);    % 最好的染色体
% 记录每一代进化中最好的适应度和平均适应度
trace = [bestfitness]; 

%% 迭代寻优
fun_y = zeros(1,maxgen);
for i=1:maxgen
%     disp(['当前迭代次数：',num2str(i)]) % 迭代次数
    % 种群更新
    % 选择
    individuals=GA_Select(individuals,sizepop); 
    % 交叉
    individuals.chrom=GA_Cross(pc,lenchrom,individuals.chrom,sizepop,bound);
    % 变异
    individuals.chrom=GA_Mutation(pm,lenchrom,individuals.chrom,sizepop,i,maxgen,bound);

    % 计算适应度
    for j=1:sizepop
        individuals.chrom(j,:)= individuals.chrom(j,:);
        x=individuals.chrom(j,:);        % 解码
        individuals.fitness(j)=fun(x);   % 染色体的适应度 
    end
    % 找到最小适应度的染色体及它们在种群中的位置
    [newbestfitness,newbestindex]=min(individuals.fitness);
    [worestfitness,worestindex]=max(individuals.fitness);
    % 代替上一次进化中最好的染色体
    if bestfitness>newbestfitness
        bestfitness=newbestfitness;
        bestchrom=individuals.chrom(newbestindex,:);
    end
    individuals.chrom(worestindex,:)=bestchrom; % 剔除最差个体
    trace=[trace;bestfitness]; %记录每一代进化中最好的适应度
end

axes(handles.axes2)
plot(1:length(trace),trace(:,1),'b--','linewidth',2);
title(['适应度曲线  ' '终止代数＝' num2str(maxgen)]);
xlabel('进化代数');   ylabel('适应度');
legend('最佳适应度');

%% 结果
% disp '最优解';
bestchrom;
% disp '最优解对应的最优函数值'
bestfitness;

set(handles.edit5,'string',bestchrom(1));
set(handles.edit6,'string',bestchrom(2));
