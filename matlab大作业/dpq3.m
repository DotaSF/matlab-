function dpq3
global GUI
GUI.fh = figure('units','pixels',...
    'position',[1 1 300 380],...
    'menubar','none',...
   'numbertitle','off','name','Caculator');
A=imread('asad.PNG');   
B=imread('keyshot.png');
C=imread('QT.PNG');
D=imread('UG.PNG');
E=imread('c4d.png');
javaImage = im2java(A);
newIcon = javax.swing.ImageIcon(javaImage);
figFrame = get(GUI.fh,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标

GUI.Panel1=uipanel(GUI.fh,'units','pixels','position',[1 1 300 335]);
GUI.Panel2=uipanel(GUI.fh,'units','pixels','position',[1 1 300 335],'backgroundcolor',[0 0 0]);
set(GUI.Panel2,'visible','on');
set(GUI.Panel1,'visible','off');
GUI.home1= uicontrol('Parent',GUI.fh,'Style','pushbutton',...
   'fontsize',12,'Position',[5 335 35 40],'CData',C,'callback',@home1);
GUI.home2= uicontrol('Parent',GUI.fh,'Style','pushbutton',...
  'fontsize',12,'Position',[50 335 35 40],'CData',D,'callback',@home2);
GUI.home3= uicontrol('Parent',GUI.fh,'Style','pushbutton',...
  'fontsize',12,'Position',[95 335 36 40],'CData',E,'callback',@home3);
GUI.clock = uicontrol('Parent',GUI.fh,'Style','edit',...
    'String',datestr(now),'fontsize',10,'Position',[135 335 165 40],'horizontalalignment','right');
%定时器
t = timer('TimerFcn',@timefcn, 'Period',1, 'ExecutionMode', 'fixedSpacing', 'TasksToExecute',1e10);
start(t);
%开机动画
for i=1:55
ax1=axes('Parent',GUI.Panel2,'units','pixels','position',[i i 100 100]);
ax2=axes('Parent',GUI.Panel2,'units','pixels','position',[201-i  201-i 100 100]);
ax3=axes('Parent',GUI.Panel2,'units','pixels','position',[i  200-i 100 100]);
ax4=axes('Parent',GUI.Panel2,'units','pixels','position',[201-i i 100 100]);
axes(ax1)
axis off
imshow(B);
axes(ax2)
axis off
imshow(B);
axes(ax3)
axis off
imshow(B);
axes(ax4)
axis off
imshow(B);
pause(0.001)
end
set(GUI.Panel1,'visible','on');
set(GUI.Panel2,'visible','off');
set(gcf,'defaultuicontrolfontname','隶书');
GUI.Button1 = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','1','fontsize',12,'Position',[5 50 50 30],'callback',@callbackfcn1);
GUI.Button2 = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','2','fontsize',12,'Position',[65 50 50 30],'callback',@callbackfcn2);
GUI.Button3 = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','3','fontsize',12,'Position',[125 50 50 30],'callback',@callbackfcn3);
GUI.Button4 = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','4','fontsize',12,'Position',[5 90 50 30],'callback',@callbackfcn4);
GUI.Button5 = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','5','fontsize',12,'Position',[65 90 50 30],'callback',@callbackfcn5);
GUI.Button6 = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','6','fontsize',12,'Position',[125 90 50 30],'callback',@callbackfcn6);
GUI.Button7 = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','7','fontsize',12,'Position',[5 130 50 30],'callback',@callbackfcn7);
GUI.Button8 = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','8','fontsize',12,'Position',[65 130 50 30],'callback',@callbackfcn8);
GUI.Button9 = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','9','fontsize',12,'Position',[125 130 50 30],'callback',@callbackfcn9);
GUI.Button_del = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','←','fontsize',12,'Position',[5 170 50 30],'callback',@del);
GUI.Button_ce = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','CE','fontsize',12,'Position',[65 170 50 30],'callback',@ce);
GUI.Button_c = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','C','fontsize',12,'Position',[125 170 50 30],'callback',@c);
GUI.Button_add_minus = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','±','fontsize',12,'Position',[185 170 50 30],'callback',@add_minus);
GUI.Button_add = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','+','fontsize',12,'Position',[185 10 50 30],'callback',@add);
GUI.Button_minus = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','-','fontsize',12,'Position',[185 50 50 30],'callback',@minus_);
GUI.Button_mul = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','*','fontsize',12,'Position',[185 90 50 30],'callback',@mul);
GUI.Button_dvi = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','/','fontsize',12,'Position',[185 130 50 30],'callback',@dvi);
GUI.Button_percent = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','%','fontsize',12,'Position',[245 130 50 30],'callback',@percent);
GUI.Button_root2 = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','√','fontsize',12,'Position',[245 170 50 30],'callback',@root2);
GUI.Button_der = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','1/x','fontsize',12,'Position',[245 90 50 30],'callback',@der);
GUI.Button_equal = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','=','fontsize',12,'Position',[245 10 50 70],'callback',@equals);
GUI.Button_point = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','.','fontsize',12,'Position',[125 10 50 30],'callback',@point);
GUI.Button_zero = uicontrol('Parent',GUI.Panel1,'Style','pushbutton',...
    'String','0','fontsize',12,'Position',[5 10 110 30],'callback',@zero);
%set(GUI.Button,'BackgroundColor',[1,0,0])
GUI.Edit = uicontrol('Parent',GUI.Panel1,'Style','edit',...
    'String','0','fontsize',12,'Position',[5 250 290 50],'horizontalalignment','right');
uicontrol(GUI.Edit);%将其函数句柄传递给 uicontrol 函数使其具有焦点,使光标在可编辑文本字段中变为活动状态并闪烁
GUI.radiobutton1 = uicontrol('Parent',GUI.Panel1,'Style','radiobutton',...
    'String','度','fontsize',12,'Position',[10 210 60 40],'callback',@radiobutton1);
GUI.radiobutton2 = uicontrol('Parent',GUI.Panel1,'Style','radiobutton',...
    'String','弧度','fontsize',12,'Position',[120 210 60 40],'callback',@radiobutton2);
GUI.radiobutton3 = uicontrol('Parent',GUI.Panel1,'Style','radiobutton',...
    'String','梯度','fontsize',12,'Position',[230 210 60 40],'callback',@radiobutton3);
setappdata(GUI.Edit,'symbol',0);
end
function timefcn(~,~)
global GUI
date=datestr(now);
set(GUI.clock,'String',date)
end
function home1(~,~)
global GUI
%切换界面
set(GUI.Panel1,'visible','off');
set(GUI.Panel2,'visible','on');
end
function home2(~,~)
global GUI
%切换界面
set(GUI.Panel2,'visible','off');
set(GUI.Panel1,'visible','on');
end
function home3(~,~)
global GUI
close(GUI.fh)
end
function callbackfcn1(~,~)
global GUI
str=get(GUI.Edit,'string')
if(strcmp(str,'0')==1)
   set(GUI.Edit,'String','1') ;
else
   set(GUI.Edit,'String',strcat(str,'1'))
end
end
function callbackfcn2(~,~)
global GUI
str=get(GUI.Edit,'string')
if(strcmp(str,'0')==1)
   set(GUI.Edit,'String','2') ;
else
   set(GUI.Edit,'String',strcat(str,'2'))
end
end
function callbackfcn3(~,~)
global GUI
str=get(GUI.Edit,'string')
if(strcmp(str,'0')==1)
   set(GUI.Edit,'String','3') ;
else
   set(GUI.Edit,'String',strcat(str,'3'))
end
end
function callbackfcn4(~,~)
global GUI
str=get(GUI.Edit,'string')
if(strcmp(str,'0')==1)
   set(GUI.Edit,'String','4') ;
else
   set(GUI.Edit,'String',strcat(str,'4'))
end
end
function callbackfcn5(~,~)
global GUI
str=get(GUI.Edit,'string')
if(strcmp(str,'0')==1)
   set(GUI.Edit,'String','5') ;
else
   set(GUI.Edit,'String',strcat(str,'5'))
end
end
function callbackfcn6(~,~)
global GUI
str=get(GUI.Edit,'string')
if(strcmp(str,'0')==1)
   set(GUI.Edit,'String','6') ;
else
   set(GUI.Edit,'String',strcat(str,'6'))
end
 
end
function callbackfcn7(~,~)
global GUI
str=get(GUI.Edit,'string')
if(strcmp(str,'0')==1)
   set(GUI.Edit,'String','7') ;
else
   set(GUI.Edit,'String',strcat(str,'7'))
end
end
function callbackfcn8(~,~)
global GUI
str=get(GUI.Edit,'string')
if(strcmp(str,'0')==1)
   set(GUI.Edit,'String','8') ;
else
   set(GUI.Edit,'String',strcat(str,'8'))
end
end
function callbackfcn9(~,~)
global GUI
str=get(GUI.Edit,'string')
if(strcmp(str,'0')==1)
   set(GUI.Edit,'String','9') ;
else
   set(GUI.Edit,'String',strcat(str,'9'))
end
end
function add(~,~)
global GUI
str=get(GUI.Edit,'string')
set(GUI.Edit,'String',strcat(str,'+'))
setappdata(GUI.Edit,'symbol',0) 
end
function minus_(~,~)
global GUI
str=get(GUI.Edit,'string')
set(GUI.Edit,'String',strcat(str,'-'))
setappdata(GUI.Edit,'symbol',0) 
end
function mul(~,~)
global GUI
str=get(GUI.Edit,'string')
set(GUI.Edit,'String',strcat(str,'*'))
setappdata(GUI.Edit,'symbol',0) 
end
function dvi(~,~)
global GUI
str=get(GUI.Edit,'string')
set(GUI.Edit,'String',strcat(str,'/'))
setappdata(GUI.Edit,'symbol',0) 
end
function der(~,~)
global GUI
str=get(GUI.Edit,'string')
set(GUI.Edit,'String',strcat(str,'^-1'))
end
function root2(~,~)
global GUI
str=get(GUI.Edit,'string')
set(GUI.Edit,'String',strcat(str,'^0.5'))
end
function percent(~,~)
global GUI
str=get(GUI.Edit,'string')
set(GUI.Edit,'String',strcat(str,'%'))
end
function point(~,~)
global GUI
str=get(GUI.Edit,'string')
symbol=getappdata(GUI.Edit,'symbol')
if   (symbol==0)
    set(GUI.Edit,'String',strcat(str,'.'))
    setappdata(GUI.Edit,'symbol',1) ;
else
    set(GUI.Edit,'String',str)
end
setappdata(GUI.Edit,'symbol',1) 
end
function zero(~,~)
global GUI
str=get(GUI.Edit,'string')
symbol=getappdata(GUI.Edit,'symbol')
if(strcmp(str,'0')==1)
   set(GUI.Edit,'String','0') ;
else
   set(GUI.Edit,'String',strcat(str,'0'))
end
end
function del(~,~)
global GUI
str=get(GUI.Edit,'string')
n=length(str)-1
set(GUI.Edit,'String',str(1:n))
end
function c(~,~)
global GUI
set(GUI.Edit,'String','')
end
function ce(~,~)
global GUI
str=get(GUI.Edit,'string')
a=strfind(str,'+')
b=strfind(str,'-')
c=strfind(str,'*')
d=strfind(str,'/')
n=max([a,b,c,d])
set(GUI.Edit,'String',str(1:n))
end
function add_minus(~,~)
global GUI
str=get(GUI.Edit,'string')
if(strcmp(str,'0')==1)
   set(GUI.Edit,'String','0') ;
else
   set(GUI.Edit,'String',strcat(str,'*(-1)'))
end
end
function radiobutton1(~,~)
global GUI
set(GUI.radiobutton1,'value',1);
set(GUI.radiobutton2,'value',0);
set(GUI.radiobutton3,'value',0);
end
function radiobutton2(~,~)
global GUI
set(GUI.radiobutton2,'value',1);
set(GUI.radiobutton1,'value',0);
set(GUI.radiobutton3,'value',0);
end
function radiobutton3(~,~)
global GUI
set(GUI.radiobutton3,'value',1);
set(GUI.radiobutton2,'value',0);
set(GUI.radiobutton1,'value',0);
end
function equals(~,~)
global GUI
str=get(GUI.Edit,'string')
str=strrep(str,'%','/100')
set(GUI.Edit,'String',eval(str))
end