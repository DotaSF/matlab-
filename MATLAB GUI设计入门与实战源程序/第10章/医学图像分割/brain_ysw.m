function varargout = brain_ysw(varargin)
% BRAIN_YSW MATLAB code for brain_ysw.fig
%      BRAIN_YSW, by itself, creates a new BRAIN_YSW or raises the existing
%      singleton*.
%
%      H = BRAIN_YSW returns the handle to a new BRAIN_YSW or the handle to
%      the existing singleton*.
%
%      BRAIN_YSW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BRAIN_YSW.M with the given input arguments.
%
%      BRAIN_YSW('Property','Value',...) creates a new BRAIN_YSW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before brain_ysw_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to brain_ysw_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help brain_ysw

% Last Modified by GUIDE v2.5 10-Jun-2015 13:34:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @brain_ysw_OpeningFcn, ...
                   'gui_OutputFcn',  @brain_ysw_OutputFcn, ...
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


% --- Executes just before brain_ysw is made visible.
function brain_ysw_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to brain_ysw (see VARARGIN)

% Choose default command line output for brain_ysw
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes brain_ysw wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = brain_ysw_OutputFcn(hObject, eventdata, handles) 
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
global im_org data
load('data.mat');       % ����MRIͼ������,����ͷ­ͼ��
num = str2num(get(handles.edit1,'string'));
% ��13 - 31   ��32-44ȡ����
if num <13 || num>31
    msgbox('num���ֲ��ԣ�num��13-31֮�䣡����');
end
im_org = data(:,:,num);  % �� i ֡ͼ��
axes(handles.axes1)
imshow(im_org);title('ԭʼͼ��');  % ��ʾԭͼ��


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off
global im_org data bw

max_level = double(max(data(:))); 
if size(im_org,3)==1
    im = im_org;
else
    im = rgb2gray(im_org);
end

im = permute(im,[3 2 1]); % ���þ����ά��
for i=1:3
    im = flipdim(im,i);
end
im(im<=40/255) = 0;       % �޳��Ҷ�ֵ�͵Ĳ��֣��Դ��ͱ�����
im(im>=100/255) = 0;      % �޳��Ҷ�ֵ�ߵĲ��֣�­�Ǻ���������֯��
im(:,:,1) = 0;            % �޳����ԻҰ�������Ĳ��ֻҶȲ���
blk = ones([1 7 7]);      % �����
% im = imerode(im,blk);   % ��ʴ
% �����������֯
lev = graythresh(double(im)/max_level) * max_level;  % ��ֵ
bw = (im>=lev);                % ��ֵ��
bw = imrotate(squeeze(bw),90); % ���츴ԭ

axes(handles.axes2)
imshow(bw);title('��ֵ��ͼ��');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off
global im_org data bw
blk = ones([1 7 7]);      % �����
% ȥ��С��
cc=bwconncomp(bw);                          % ��ͨ�����
s  = regionprops(bw, {'centroid','area'});  % �������
[A, id] = max([s.Area]);
bw(labelmatrix(cc)~=id)=0;
bw = imdilate(bw,blk);     % ����
% figure,imshow(bw);
im_sep = immultiply(im_org,bw);
% figure,imshow(im_sep);title('������ԻҰ���')

%% ���ԻҰ�����ȡ
lev2 = 50/255;  % ��ֵ
L = zeros(size(im_sep));          %0=����
L(im_sep<lev2 & im_sep>0) = 2;    %2=����
L(im_sep>=lev2) = 3;              %3=����
L = mat2gray(L);

axes(handles.axes2)
imshow(L);title('�Ұ��ʷָ�ͼ')

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc,clear,close all


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
