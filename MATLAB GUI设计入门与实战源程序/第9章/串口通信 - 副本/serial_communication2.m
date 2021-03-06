function varargout = serial_communication2(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @serial_communication2_OpeningFcn, ...
                   'gui_OutputFcn',  @serial_communication2_OutputFcn, ...
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

function serial_communication2_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
warning('off');
guidata(hObject, handles);

function varargout = serial_communication2_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function com_Callback(hObject, ~, handles)

function com_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function rate_Callback(hObject, eventdata, handles)

function rate_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function start_serial_Callback(hObject, eventdata, handles)
%   【打开/关闭串口】按钮的回调函数
%    打开串口，并初始化相关参数

%% 若按下【打开串口】按钮，打开串口
if get(hObject, 'value')
    %% 获取串口的端口名
    com_n = sprintf('com%d', get(handles.com, 'value'));
    %% 获取波特率
    baud_rate = 9600;
    %% 获取校验位设置
    jiaoyan = 'none';
    %% 获取数据位个数
    data_bits = 8;
    %% 获取停止位个数
    stop_bits = 1;
    %% 创建串口对象
    scom = serial(com_n);
    %% 配置串口属性，指定其回调函数
    set(scom, 'BaudRate', baud_rate, 'Parity', jiaoyan, 'DataBits',...
        data_bits, 'StopBits', stop_bits, 'BytesAvailableFcnCount', 10,...
        'BytesAvailableFcnMode', 'byte', 'BytesAvailableFcn', {@bytes, handles},...
        'TimerPeriod', 0.05);
    %% 将串口对象的句柄作为用户数据，存入窗口对象
    set(handles.figure1, 'UserData', scom);
    %% 尝试打开串口
    try
        fopen(scom);  %打开串口
    catch   % 若串口打开失败，提示“串口不可获得！”
        msgbox('串口不可获得！');
        set(hObject, 'value', 0);  %弹起本按钮 
        return;
    end
    %% 并更改本按钮文本为“关闭串口”
    set(hObject, 'String', '关闭串口');  %设置本按钮文本为“关闭串口”
else  %若关闭串口
    %% 停止并删除定时器
    t = timerfind;
    if ~isempty(t)
        stop(t);
        delete(t);
    end
    %% 停止并删除串口对象
    scoms = instrfind;
    stopasync(scoms);
    fclose(scoms);
    delete(scoms);
end

% function dataDisp(obj, event, handles)
% global value
% %	串口的TimerFcn回调函数
% %   串口数据显示
% %% 获取参数
% hasData = getappdata(handles.figure1, 'hasData'); %串口是否收到数据
% strRec = getappdata(handles.figure1, 'strRec');   %串口数据的字符串形式，定时显示该数据
% numRec = getappdata(handles.figure1, 'numRec');   %串口接收到的数据个数
% %% 若串口没有接收到数据，先尝试接收串口数据
% if ~hasData
%     bytes(obj, event, handles);
% end
% %% 若串口有数据，显示串口数据
% if hasData
%     %% 给数据显示模块加互斥锁
%     %% 在执行显示数据模块时，不接受串口数据，即不执行BytesAvailableFcn回调函数
%     setappdata(handles.figure1, 'isShow', true); 
%     %% 若要显示的字符串长度超过10000，清空显示区
%     if length(strRec) > 10000
%         strRec = '';
%         setappdata(handles.figure1, 'strRec', strRec);
%     end
%     %% 显示数据
%     set(handles.xianshi, 'string', strRec);
%     %%
%     value=get(handles.xianshi,'string');
%     value=textscan(value,'%s'); %读取其中的数据
%     value=value{1};%得到数据，存储到value中
%     
%     value=hex2dec(value);
%     
%   %  value=cellfun(@str2double,value);%把得到的字符转换成数字
%     figure(1),plot(value)
%     
%     %% 更新接收计数
%     set(handles.rec,'string', numRec);
%     %% 更新hasData标志，表明串口数据已经显示
%     setappdata(handles.figure1, 'hasData', false);
%     %% 给数据显示模块解锁
%     setappdata(handles.figure1, 'isShow', false);
% end
 
% function bytes(obj, ~, handles)
% %   串口的BytesAvailableFcn回调函数
% %   串口接收数据
% %% 获取参数
% strRec = getappdata(handles.figure1, 'strRec'); %获取串口要显示的数据
% numRec = getappdata(handles.figure1, 'numRec'); %获取串口已接收数据的个数
% isStopDisp = getappdata(handles.figure1, 'isStopDisp'); %是否按下了【停止显示】按钮
% isHexDisp = getappdata(handles.figure1, 'isHexDisp'); %是否十六进制显示
% isShow = getappdata(handles.figure1, 'isShow');  %是否正在执行显示数据操作
% %% 若正在执行数据显示操作，暂不接收串口数据
% if isShow
%     return;
% end
% %% 获取串口可获取的数据个数
% n = get(obj, 'BytesAvailable');
% %% 若串口有数据，接收所有数据
% if n
%     %% 更新hasData参数，表明串口有数据需要显示
%     setappdata(handles.figure1, 'hasData', true);
%     %% 读取串口数据
%     a = fread(obj, n, 'uchar');
%     %% 若没有停止显示，将接收到的数据解算出来，准备显示
%     if ~isStopDisp 
%         %% 根据进制显示的状态，解析数据为要显示的字符串
%         if ~isHexDisp 
%             c = char(a');
%         else
%             strHex = dec2hex(a')';
%             strHex2 = [strHex; blanks(size(a, 1))];
%             c = strHex2(:)';
%         end
%         %% 更新已接收的数据个数
%         numRec = numRec + size(a, 1);
%         %% 更新要显示的字符串
%         strRec = [strRec c];
%     end
%     %% 更新参数
%     setappdata(handles.figure1, 'numRec', numRec); %更新已接收的数据个数
%     setappdata(handles.figure1, 'strRec', strRec); %更新要显示的字符串
% end


% function qingkong_Callback(hObject, eventdata, handles)
% %% 清空要显示的字符串
% setappdata(handles.figure1, 'strRec', '');
% %% 清空显示
% set(handles.xianshi, 'String', '');

% function stop_disp_Callback(hObject, eventdata, handles)
% %% 根据【停止显示】按钮的状态，更新isStopDisp参数
% if get(hObject, 'Value')
%     isStopDisp = true;
% else
%     isStopDisp = false;
% end
% setappdata(handles.figure1, 'isStopDisp', isStopDisp);

function radiobutton1_Callback(hObject, eventdata, handles)

function radiobutton2_Callback(hObject, eventdata, handles)

function togglebutton4_Callback(hObject, eventdata, handles)

% function hex_disp_Callback(hObject, eventdata, handles)
% %% 根据【十六进制显示】复选框的状态，更新isHexDisp参数
% if get(hObject, 'Value')
%     isHexDisp = true;
% else
%     isHexDisp = false;
% end
% setappdata(handles.figure1, 'isHexDisp', isHexDisp);

function manual_send_Callback(hObject, eventdata, handles)
%%定时发送数据函数
scom = get(handles.figure1, 'UserData');
numSend = getappdata(handles.figure1, 'numSend');
val = get(handles.sends, 'UserData');
numSend = numSend + length(val);
setappdata(handles.figure1, 'numSend', numSend);
%% 若要发送的数据不为空，发送数据
if ~isempty(val)
    %% 设置倒计数的初值
    n = 1000;
    while n
        %% 获取串口的传输状态，若串口没有正在写数据，写入数据
        str = get(scom, 'TransferStatus');
        if ~(strcmp(str, 'write') || strcmp(str, 'read&write'))
            fwrite(scom, val, 'uint8', 'async'); %数据写入串口
            break;
        end
        n = n - 1; %倒计数
    end
end


% function clear_send_Callback(hObject, eventdata, handles)
% %% 清空发送区
% set(handles.sends, 'string', '')
% %% 更新要发送的数据
% set(handles.sends, 'UserData', []);

function checkbox2_Callback(hObject, eventdata, handles)


% function period_send_Callback(hObject, eventdata, handles)
% %   【自动发送】按钮的Callback回调函数
% %% 若按下【自动发送】按钮，启动定时器；否则，停止并删除定时器
% if get(hObject, 'value')
%     t1 = 0.001 * str2double(get(handles.period1, 'string'));%获取定时器周期
%     t = timer('ExecutionMode','fixedrate', 'Period', t1, 'TimerFcn',...
%         {@manual_send_Callback, handles}); %创建定时器
%     set(handles.period1, 'Enable', 'off'); %禁用设置定时器周期的Edit Text对象
%     set(handles.sends, 'Enable', 'inactive'); %禁用数据发送编辑区
%     start(t);  %启动定时器
% else
%     set(handles.period1, 'Enable', 'on'); %启用设置定时器周期的Edit Text对象
%     set(handles.sends, 'Enable', 'on');   %启用数据发送编辑区
%     t = timerfind; %查找定时器
%     stop(t); %停止定时器
%     delete(t); %删除定时器
% end

function period1_Callback(hObject, eventdata, handles)

function period1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% function clear_count_Callback(hObject, eventdata, handles)
% %% 计数清零，并更新参数numRec和numSend
% set([handles.rec, handles.trans], 'string', '0')
% setappdata(handles.figure1, 'numRec', 0);
% setappdata(handles.figure1, 'numSend', 0);
% 
% function copy_data_Callback(hObject, eventdata, handles)
% %% 设置是否允许复制接收数据显示区内的数据
% if get(hObject,'value')
%     set(handles.xianshi, 'enable', 'on');
% else
%     set(handles.xianshi, 'enable', 'inactive');
% end

function figure1_CloseRequestFcn(hObject, eventdata, handles)
%   关闭窗口时，检查定时器和串口是否已关闭
%   若没有关闭，则先关闭
%% 查找定时器
t = timerfind;
%% 若存在定时器对象，停止并关闭
if ~isempty(t)
    stop(t);  %若定时器没有停止，则停止定时器
    delete(t);
end
%% 查找串口对象
scoms = instrfind;
%% 尝试停止、关闭删除串口对象
try
    stopasync(scoms);
    fclose(scoms);
    delete(scoms);
end
%% 关闭窗口
delete(hObject);

% function hex_send_Callback(hObject, eventdata, handles)
% %% 根据【十六进制发送】复选框的状态，更新isHexSend参数
% if get(hObject,'value')
%     isHexSend = true;
% else
%     isHexSend = false;
% end
% setappdata(handles.figure1, 'isHexSend', isHexSend);
% %% 更新要发送的数据
% sends_Callback(handles.sends, eventdata, handles);


function sends_Callback(hObject, eventdata, handles)
%   数据发送编辑区的Callback回调函数
%   更新要发送的数据
%% 获取数据发送编辑区的字符串
str = get(hObject, 'string');
%% 获取参数isHexSend的值
% isHexSend = getappdata(handles.figure1, 'isHexSend');
% if ~isHexSend %若为ASCII值形式发送，直接将字符串转化为对应的数值
    val = double(str);
% else  %若为十六进制发送，获取要发送的数据
%     n = find(str == ' ');   %查找空格
%     n =[0 n length(str)+1]; %空格的索引值
%     %% 每两个相邻空格之间的字符串为数值的十六进制形式，将其转化为数值
%     for i = 1 : length(n)-1 
%         temp = str(n(i)+1 : n(i+1)-1);  %获得每段数据的长度，为数据转换为十进制做准备
%         if ~rem(length(temp), 2)
%             b{i} = reshape(temp, 2, [])'; %将每段十六进制字符串转化为单元数组
%         else
%             break;
%         end
%     end
%     val = hex2dec(b)';     %将十六进制字符串转化为十进制数，等待写入串口
% end
%% 更新要显示的数据
set(hObject, 'UserData', val); 


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global value
h_temp=findobj('tag','edit2');
outpath=get(h_temp,'String');
outpath=[outpath '\'];
str_img=strcat('data','.txt');

value=get(handles.xianshi,'string');
value=textscan(value,'%s'); %读取其中的数据
value=value{1};%得到数据，存储到value中
value=hex2dec(value);
% value=cellfun(@str2double,value);%把得到的字符转换成数字

save([outpath str_img],'value','-ascii');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc,clear,close all


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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directory_name = uigetdir;
set(handles.edit2,'string',directory_name);


function xianshi_Callback(hObject, eventdata, handles)
% hObject    handle to xianshi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xianshi as text
%        str2double(get(hObject,'String')) returns contents of xianshi as a double
