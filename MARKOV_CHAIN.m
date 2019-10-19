function varargout = MARKOV_CHAIN(varargin)
% MARKOV_CHAIN MATLAB code for MARKOV_CHAIN.fig
%      MARKOV_CHAIN, by itself, creates a new MARKOV_CHAIN or raises the existing
%      singleton*.
%
%      H = MARKOV_CHAIN returns the handle to a new MARKOV_CHAIN or the handle to
%      the existing singleton*.
%
%      MARKOV_CHAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MARKOV_CHAIN.M with the given input arguments.
%
%      MARKOV_CHAIN('Property','Value',...) creates a new MARKOV_CHAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MARKOV_CHAIN_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MARKOV_CHAIN_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MARKOV_CHAIN

% Last Modified by GUIDE v2.5 08-Nov-2018 00:04:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MARKOV_CHAIN_OpeningFcn, ...
                   'gui_OutputFcn',  @MARKOV_CHAIN_OutputFcn, ...
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


% --- Executes just before MARKOV_CHAIN is made visible.
function MARKOV_CHAIN_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MARKOV_CHAIN (see VARARGIN)

% Choose default command line output for MARKOV_CHAIN
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.axes2)
imshow('its.png')
axes(handles.axes3)
imshow('mat.png')
set(handles.menu1,'visible', 'on')
set(handles.menu2,'visible', 'off')
set(handles.menu3,'visible', 'off')

% UIWAIT makes MARKOV_CHAIN wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MARKOV_CHAIN_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function tx_filename_Callback(hObject, eventdata, handles)
% hObject    handle to tx_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tx_filename as text
%        str2double(get(hObject,'String')) returns contents of tx_filename as a double


% --- Executes during object creation, after setting all properties.
function tx_filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tx_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_browse.
function bt_browse_Callback(hObject, eventdata, handles)
[filename,name_path1] = uigetfile( ...
    {'*.xlsx','Files of type (*.xlsx)';
    '*.*','All Files (*.*)'},...
    'Open File Excel');
set(handles.tx_filename,'string',filename);
data=xlsread(filename, 'Sheet2', 'C3:E260');
handles.data_close=data(:,1);
handles.data_diff=data(:,2);
handles.data_status=data(:,3);
[~, judul]=xlsread(filename, 'Sheet1', 'A1');
[~, tanggal]=xlsread(filename, 'Sheet1', ['B3:B260']); 
n=size(data);
set(handles.tx_tglawal, 'string', tanggal(1));
set(handles.tx_tglakhir, 'string', tanggal(n(1)));
axes(handles.axes4)
x = 1:n(1);
plot(x, handles.data_close, 'LineWidth', 1.0)
xlabel('Hari Ke-');
ylabel('Nilai Penutupan Saham');
title(judul);
guidata(hObject, handles);




% hObject    handle to bt_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bt_browse



function tx_pangkat_Callback(hObject, eventdata, handles)
% hObject    handle to tx_pangkat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tx_pangkat as text
%        str2double(get(hObject,'String')) returns contents of tx_pangkat as a double


% --- Executes during object creation, after setting all properties.
function tx_pangkat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tx_pangkat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton4.
%pushbutton proses pada menu matriks transisi
function togglebutton4_Callback(hObject, eventdata, handles)
pangkat=str2num(get(handles.tx_pangkat, 'string'));
arr=handles.peluang;
arr=arr^pangkat;
set(handles.tabel2, 'DATA', arr);
% hObject    handle to togglebutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton4


% --- Executes on selection change in popupmenu_kondisi.
function popupmenu_kondisi_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_kondisi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_kondisi contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_kondisi


% --- Executes during object creation, after setting all properties.
function popupmenu_kondisi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_kondisi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tx_harike_Callback(hObject, eventdata, handles)
% hObject    handle to tx_harike (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tx_harike as text
%        str2double(get(hObject,'String')) returns contents of tx_harike as a double


% --- Executes during object creation, after setting all properties.
function tx_harike_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tx_harike (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_harike.
function bt_harike_Callback(hObject, eventdata, handles)
cla(handles.axes14,'reset');
kondisi = get(handles.popupmenu_kondisi, 'Value');
hari = str2num(get(handles.tx_harike, 'string'));
if(kondisi==1)
   cla(handles.axes14,'reset'); 
else
    arr=handles.peluang;
    arr=arr^hari;
    y = arr(kondisi-1,:);
    x=1:5;
    axes(handles.axes14)
    plot(x,y,'b-o', 'LineWidth', 1)
    set(gca,'XTickLabel', {'Naik Drastis',' ', 'Naik',' ','Tetap',' ','Turun',' ','Turun Drastis'})
    xlabel(['Kondisi Hari Ke' num2str(hari)]);
    ylabel('Nilai Peluang')
    for i=1:length(y)
        text(i,y(i), num2str(y(i)));
        hold on
    end
end
% hObject    handle to bt_harike (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_1_Callback(hObject, eventdata, handles)
set(handles.menu1,'visible', 'on')
set(handles.menu2,'visible', 'off')
set(handles.menu3,'visible', 'off')
% hObject    handle to menu_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_2_Callback(hObject, eventdata, handles)
set(handles.menu1,'visible', 'off')
set(handles.menu2,'visible', 'on')
set(handles.menu3,'visible', 'off')


% hObject    handle to menu_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_3_Callback(hObject, eventdata, handles)
set(handles.menu1,'visible', 'off')
set(handles.menu2,'visible', 'off')
set(handles.menu3,'visible', 'on')
% hObject    handle to menu_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
m = size(handles.data_status);
arr=handles.data_status;
transisi=zeros(5);
handles.peluang=[];
for i=2:(m-1)
   a=arr(i);
   b=arr(i+1);
   transisi(a,b)=transisi(a,b)+1;
end
transisi;
jumlah = sum(transisi);
hasil = [transisi jumlah'];
axes(handles.axes15)
b=bar(transisi, 'FaceColor', 'flat');
set(gca,'XTickLabel', {'Naik Drastis','Naik','Tetap','Turun','Turun Drastis'})
legend('Naik Drastis','Naik','Tetap','Turun','Turun Drastis')
for i=1:5
    P(i,:)=transisi(i,:)/jumlah(i);
end
handles.peluang=P;
set(handles.tabel1,'Data',hasil);
set(handles.tabel2,'Data',P);
set(handles.tx_jumlah, 'string', sum(jumlah));
set(handles.tx_pangkat, 'string', 1);
guidata(hObject, handles);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
