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
%   ����/�رմ��ڡ���ť�Ļص�����
%    �򿪴��ڣ�����ʼ����ز���

%% �����¡��򿪴��ڡ���ť���򿪴���
if get(hObject, 'value')
    %% ��ȡ���ڵĶ˿���
    com_n = sprintf('com%d', get(handles.com, 'value'));
    %% ��ȡ������
    baud_rate = 9600;
    %% ��ȡУ��λ����
    jiaoyan = 'none';
    %% ��ȡ����λ����
    data_bits = 8;
    %% ��ȡֹͣλ����
    stop_bits = 1;
    %% �������ڶ���
    scom = serial(com_n);
    %% ���ô������ԣ�ָ����ص�����
    set(scom, 'BaudRate', baud_rate, 'Parity', jiaoyan, 'DataBits',...
        data_bits, 'StopBits', stop_bits, 'BytesAvailableFcnCount', 10,...
        'BytesAvailableFcnMode', 'byte', 'BytesAvailableFcn', {@bytes, handles},...
        'TimerPeriod', 0.05);
    %% �����ڶ���ľ����Ϊ�û����ݣ����봰�ڶ���
    set(handles.figure1, 'UserData', scom);
    %% ���Դ򿪴���
    try
        fopen(scom);  %�򿪴���
    catch   % �����ڴ�ʧ�ܣ���ʾ�����ڲ��ɻ�ã���
        msgbox('���ڲ��ɻ�ã�');
        set(hObject, 'value', 0);  %���𱾰�ť 
        return;
    end
    %% �����ı���ť�ı�Ϊ���رմ��ڡ�
    set(hObject, 'String', '�رմ���');  %���ñ���ť�ı�Ϊ���رմ��ڡ�
else  %���رմ���
    %% ֹͣ��ɾ����ʱ��
    t = timerfind;
    if ~isempty(t)
        stop(t);
        delete(t);
    end
    %% ֹͣ��ɾ�����ڶ���
    scoms = instrfind;
    stopasync(scoms);
    fclose(scoms);
    delete(scoms);
end

% function dataDisp(obj, event, handles)
% global value
% %	���ڵ�TimerFcn�ص�����
% %   ����������ʾ
% %% ��ȡ����
% hasData = getappdata(handles.figure1, 'hasData'); %�����Ƿ��յ�����
% strRec = getappdata(handles.figure1, 'strRec');   %�������ݵ��ַ�����ʽ����ʱ��ʾ������
% numRec = getappdata(handles.figure1, 'numRec');   %���ڽ��յ������ݸ���
% %% ������û�н��յ����ݣ��ȳ��Խ��մ�������
% if ~hasData
%     bytes(obj, event, handles);
% end
% %% �����������ݣ���ʾ��������
% if hasData
%     %% ��������ʾģ��ӻ�����
%     %% ��ִ����ʾ����ģ��ʱ�������ܴ������ݣ�����ִ��BytesAvailableFcn�ص�����
%     setappdata(handles.figure1, 'isShow', true); 
%     %% ��Ҫ��ʾ���ַ������ȳ���10000�������ʾ��
%     if length(strRec) > 10000
%         strRec = '';
%         setappdata(handles.figure1, 'strRec', strRec);
%     end
%     %% ��ʾ����
%     set(handles.xianshi, 'string', strRec);
%     %%
%     value=get(handles.xianshi,'string');
%     value=textscan(value,'%s'); %��ȡ���е�����
%     value=value{1};%�õ����ݣ��洢��value��
%     
%     value=hex2dec(value);
%     
%   %  value=cellfun(@str2double,value);%�ѵõ����ַ�ת��������
%     figure(1),plot(value)
%     
%     %% ���½��ռ���
%     set(handles.rec,'string', numRec);
%     %% ����hasData��־���������������Ѿ���ʾ
%     setappdata(handles.figure1, 'hasData', false);
%     %% ��������ʾģ�����
%     setappdata(handles.figure1, 'isShow', false);
% end
 
% function bytes(obj, ~, handles)
% %   ���ڵ�BytesAvailableFcn�ص�����
% %   ���ڽ�������
% %% ��ȡ����
% strRec = getappdata(handles.figure1, 'strRec'); %��ȡ����Ҫ��ʾ������
% numRec = getappdata(handles.figure1, 'numRec'); %��ȡ�����ѽ������ݵĸ���
% isStopDisp = getappdata(handles.figure1, 'isStopDisp'); %�Ƿ����ˡ�ֹͣ��ʾ����ť
% isHexDisp = getappdata(handles.figure1, 'isHexDisp'); %�Ƿ�ʮ��������ʾ
% isShow = getappdata(handles.figure1, 'isShow');  %�Ƿ�����ִ����ʾ���ݲ���
% %% ������ִ��������ʾ�������ݲ����մ�������
% if isShow
%     return;
% end
% %% ��ȡ���ڿɻ�ȡ�����ݸ���
% n = get(obj, 'BytesAvailable');
% %% �����������ݣ�������������
% if n
%     %% ����hasData����������������������Ҫ��ʾ
%     setappdata(handles.figure1, 'hasData', true);
%     %% ��ȡ��������
%     a = fread(obj, n, 'uchar');
%     %% ��û��ֹͣ��ʾ�������յ������ݽ��������׼����ʾ
%     if ~isStopDisp 
%         %% ���ݽ�����ʾ��״̬����������ΪҪ��ʾ���ַ���
%         if ~isHexDisp 
%             c = char(a');
%         else
%             strHex = dec2hex(a')';
%             strHex2 = [strHex; blanks(size(a, 1))];
%             c = strHex2(:)';
%         end
%         %% �����ѽ��յ����ݸ���
%         numRec = numRec + size(a, 1);
%         %% ����Ҫ��ʾ���ַ���
%         strRec = [strRec c];
%     end
%     %% ���²���
%     setappdata(handles.figure1, 'numRec', numRec); %�����ѽ��յ����ݸ���
%     setappdata(handles.figure1, 'strRec', strRec); %����Ҫ��ʾ���ַ���
% end


% function qingkong_Callback(hObject, eventdata, handles)
% %% ���Ҫ��ʾ���ַ���
% setappdata(handles.figure1, 'strRec', '');
% %% �����ʾ
% set(handles.xianshi, 'String', '');

% function stop_disp_Callback(hObject, eventdata, handles)
% %% ���ݡ�ֹͣ��ʾ����ť��״̬������isStopDisp����
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
% %% ���ݡ�ʮ��������ʾ����ѡ���״̬������isHexDisp����
% if get(hObject, 'Value')
%     isHexDisp = true;
% else
%     isHexDisp = false;
% end
% setappdata(handles.figure1, 'isHexDisp', isHexDisp);

function manual_send_Callback(hObject, eventdata, handles)
%%��ʱ�������ݺ���
scom = get(handles.figure1, 'UserData');
numSend = getappdata(handles.figure1, 'numSend');
val = get(handles.sends, 'UserData');
numSend = numSend + length(val);
setappdata(handles.figure1, 'numSend', numSend);
%% ��Ҫ���͵����ݲ�Ϊ�գ���������
if ~isempty(val)
    %% ���õ������ĳ�ֵ
    n = 1000;
    while n
        %% ��ȡ���ڵĴ���״̬��������û������д���ݣ�д������
        str = get(scom, 'TransferStatus');
        if ~(strcmp(str, 'write') || strcmp(str, 'read&write'))
            fwrite(scom, val, 'uint8', 'async'); %����д�봮��
            break;
        end
        n = n - 1; %������
    end
end


% function clear_send_Callback(hObject, eventdata, handles)
% %% ��շ�����
% set(handles.sends, 'string', '')
% %% ����Ҫ���͵�����
% set(handles.sends, 'UserData', []);

function checkbox2_Callback(hObject, eventdata, handles)


% function period_send_Callback(hObject, eventdata, handles)
% %   ���Զ����͡���ť��Callback�ص�����
% %% �����¡��Զ����͡���ť��������ʱ��������ֹͣ��ɾ����ʱ��
% if get(hObject, 'value')
%     t1 = 0.001 * str2double(get(handles.period1, 'string'));%��ȡ��ʱ������
%     t = timer('ExecutionMode','fixedrate', 'Period', t1, 'TimerFcn',...
%         {@manual_send_Callback, handles}); %������ʱ��
%     set(handles.period1, 'Enable', 'off'); %�������ö�ʱ�����ڵ�Edit Text����
%     set(handles.sends, 'Enable', 'inactive'); %�������ݷ��ͱ༭��
%     start(t);  %������ʱ��
% else
%     set(handles.period1, 'Enable', 'on'); %�������ö�ʱ�����ڵ�Edit Text����
%     set(handles.sends, 'Enable', 'on');   %�������ݷ��ͱ༭��
%     t = timerfind; %���Ҷ�ʱ��
%     stop(t); %ֹͣ��ʱ��
%     delete(t); %ɾ����ʱ��
% end

function period1_Callback(hObject, eventdata, handles)

function period1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% function clear_count_Callback(hObject, eventdata, handles)
% %% �������㣬�����²���numRec��numSend
% set([handles.rec, handles.trans], 'string', '0')
% setappdata(handles.figure1, 'numRec', 0);
% setappdata(handles.figure1, 'numSend', 0);
% 
% function copy_data_Callback(hObject, eventdata, handles)
% %% �����Ƿ������ƽ���������ʾ���ڵ�����
% if get(hObject,'value')
%     set(handles.xianshi, 'enable', 'on');
% else
%     set(handles.xianshi, 'enable', 'inactive');
% end

function figure1_CloseRequestFcn(hObject, eventdata, handles)
%   �رմ���ʱ����鶨ʱ���ʹ����Ƿ��ѹر�
%   ��û�йرգ����ȹر�
%% ���Ҷ�ʱ��
t = timerfind;
%% �����ڶ�ʱ������ֹͣ���ر�
if ~isempty(t)
    stop(t);  %����ʱ��û��ֹͣ����ֹͣ��ʱ��
    delete(t);
end
%% ���Ҵ��ڶ���
scoms = instrfind;
%% ����ֹͣ���ر�ɾ�����ڶ���
try
    stopasync(scoms);
    fclose(scoms);
    delete(scoms);
end
%% �رմ���
delete(hObject);

% function hex_send_Callback(hObject, eventdata, handles)
% %% ���ݡ�ʮ�����Ʒ��͡���ѡ���״̬������isHexSend����
% if get(hObject,'value')
%     isHexSend = true;
% else
%     isHexSend = false;
% end
% setappdata(handles.figure1, 'isHexSend', isHexSend);
% %% ����Ҫ���͵�����
% sends_Callback(handles.sends, eventdata, handles);


function sends_Callback(hObject, eventdata, handles)
%   ���ݷ��ͱ༭����Callback�ص�����
%   ����Ҫ���͵�����
%% ��ȡ���ݷ��ͱ༭�����ַ���
str = get(hObject, 'string');
%% ��ȡ����isHexSend��ֵ
% isHexSend = getappdata(handles.figure1, 'isHexSend');
% if ~isHexSend %��ΪASCIIֵ��ʽ���ͣ�ֱ�ӽ��ַ���ת��Ϊ��Ӧ����ֵ
    val = double(str);
% else  %��Ϊʮ�����Ʒ��ͣ���ȡҪ���͵�����
%     n = find(str == ' ');   %���ҿո�
%     n =[0 n length(str)+1]; %�ո������ֵ
%     %% ÿ�������ڿո�֮����ַ���Ϊ��ֵ��ʮ��������ʽ������ת��Ϊ��ֵ
%     for i = 1 : length(n)-1 
%         temp = str(n(i)+1 : n(i+1)-1);  %���ÿ�����ݵĳ��ȣ�Ϊ����ת��Ϊʮ������׼��
%         if ~rem(length(temp), 2)
%             b{i} = reshape(temp, 2, [])'; %��ÿ��ʮ�������ַ���ת��Ϊ��Ԫ����
%         else
%             break;
%         end
%     end
%     val = hex2dec(b)';     %��ʮ�������ַ���ת��Ϊʮ���������ȴ�д�봮��
% end
%% ����Ҫ��ʾ������
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
value=textscan(value,'%s'); %��ȡ���е�����
value=value{1};%�õ����ݣ��洢��value��
value=hex2dec(value);
% value=cellfun(@str2double,value);%�ѵõ����ַ�ת��������

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
