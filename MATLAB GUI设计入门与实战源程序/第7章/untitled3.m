function varargout = untitled3(varargin)
% UNTITLED3 MATLAB code for untitled3.fig
%      UNTITLED3, by itself, creates a new UNTITLED3 or raises the existing
%      singleton*.
%
%      H = UNTITLED3 returns the handle to a new UNTITLED3 or the handle to
%      the existing singleton*.
%
%      UNTITLED3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED3.M with the given input arguments.
%
%      UNTITLED3('Property','Value',...) creates a new UNTITLED3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled3

% Last Modified by GUIDE v2.5 01-Jun-2015 21:31:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled3_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled3_OutputFcn, ...
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


% --- Executes just before untitled3 is made visible.
function untitled3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled3 (see VARARGIN)

% Choose default command line output for untitled3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled3_OutputFcn(hObject, eventdata, handles) 
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
im1 = imread('a.jpg');
im2 = imread('5.bmp');
% clear axes
arrayfun(@cla, findall(0, 'type', 'axes'));
% axes(handles.axes1)
% subplot(121),imshow(im1)
% subplot(122),imshow(im2)
% subplot(121),imshow(im1)
% subplot(322),imshow(im2)

% positionVector1 = [0.1, 0.2, 0.3, 0.3];
% subplot('Position',positionVector1)
% imshow(im1)
% positionVector2 = [0.5, 0.1, 0.4, 0.7];
% subplot('Position',positionVector2)
% imshow(im2)

positionVector1 = [0.1, 0.2, 0.3, 0.3];
subplot('Position',positionVector1)
Z = peaks;
plot(Z(1:20,:))
positionVector2 = [0.5, 0.1, 0.4, 0.5];
subplot('Position',positionVector2)
plot(Z);
