function varargout = untitled11(varargin)
% UNTITLED11 MATLAB code for untitled11.fig
%      UNTITLED11, by itself, creates a new UNTITLED11 or raises the existing
%      singleton*.
%
%      H = UNTITLED11 returns the handle to a new UNTITLED11 or the handle to
%      the existing singleton*.
%
%      UNTITLED11('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED11.M with the given input arguments.
%
%      UNTITLED11('Property','Value',...) creates a new UNTITLED11 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled11_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled11_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled11

% Last Modified by GUIDE v2.5 24-May-2015 19:43:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled11_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled11_OutputFcn, ...
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


% --- Executes just before untitled11 is made visible.
function untitled11_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled11 (see VARARGIN)

% Choose default command line output for untitled11
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled11 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled11_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
