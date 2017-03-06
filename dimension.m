function varargout = dimension(varargin)
% DIMENSION MATLAB code for dimension.fig
%      DIMENSION, by itself, creates a new DIMENSION or raises the existing
%      singleton*.
%
%      H = DIMENSION returns the handle to a new DIMENSION or the handle to
%      the existing singleton*.
%
%      DIMENSION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIMENSION.M with the given input arguments.
%
%      DIMENSION('Property','Value',...) creates a new DIMENSION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dimension_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dimension_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dimension

% Last Modified by GUIDE v2.5 12-Apr-2015 23:34:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dimension_OpeningFcn, ...
                   'gui_OutputFcn',  @dimension_OutputFcn, ...
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


% --- Executes just before dimension is made visible.
function dimension_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command sline arguments to dimension (see VARARGIN)

% Choose default command sline output for dimension
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dimension wait for user response (see UIRESUME)
% uiwait(handles.figure1);

 set(handles.sline,'Min',-30);
 set(handles.sline,'Max',30);
 set(handles.sline,'Value',20);
 set(handles.line,'String',num2str(20));
 set(handles.sangle,'Min',-pi/9);
 set(handles.sangle,'Max',pi/9);
 set(handles.sangle,'Value',pi/10);
 set(handles.angle,'String',num2str(pi/10));
 set(handles.sl1,'Min',10);
 set(handles.sl1,'Max',20);
 set(handles.sl1,'Value',11);
 set(handles.l1,'String',num2str(11));
 set(handles.sl2,'Min',10);
 set(handles.sl2,'Max',20);
 set(handles.sl2,'Value',14);
 set(handles.l2,'String',num2str(14));
 set(handles.sk1,'Min',100);
 set(handles.sk1,'Max',500);
 set(handles.sk1,'Value',200);
 set(handles.k1,'String',num2str(200));
 set(handles.sk2,'Min',100);
 set(handles.sk2,'Max',500);
 set(handles.sk2,'Value',300);
 set(handles.k2,'String',num2str(300));
 set(handles.sm,'Min',1);
 set(handles.sm,'Max',100);
 set(handles.sm,'Value',20);
 set(handles.m,'String',num2str(20));
 set(handles.sj,'Min',500);
 set(handles.sj,'Max',5000);
 set(handles.sj,'Value',1000);
 set(handles.j,'String',num2str(1000));

% --- Outputs from this function are returned to the command sline.
function varargout = dimension_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command sline output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in proceed.
function proceed_Callback(hObject, eventdata, handles)
% hObject    handle to proceed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
line=str2num(get(handles.line,'String'));
angle=str2num(get(handles.angle,'String'));
l1=str2num(get(handles.l1,'String'));
l2=str2num(get(handles.l2,'String'));
k1=str2num(get(handles.k1,'String'));
k2=str2num(get(handles.k2,'String'));
m=str2num(get(handles.m,'String'));
j=str2num(get(handles.j,'String'));
simw(line,angle,l1,l2,k1,k2,m,j);
close(handles.figure1);

% --- Executes on slider movement.
function sline_Callback(hObject, eventdata, handles)
% hObject    handle to sline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
n = get(handles.sline,'Value');
set(handles.line,'String',num2str(n));
l1=str2num(get(handles.l1,'String'));
l2=str2num(get(handles.l2,'String'));
y=str2num(get(handles.line,'String'));
theta=str2num(get(handles.angle,'String'));
generate(l1,l2,y,theta);

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function sline_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sangle_Callback(hObject, eventdata, handles)
% hObject    handle to sangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
n = get(handles.sangle,'Value');
set(handles.angle,'String',num2str(n));
l1=str2num(get(handles.l1,'String'));
l2=str2num(get(handles.l2,'String'));
y=str2num(get(handles.line,'String'));
theta=str2num(get(handles.angle,'String'));
generate(l1,l2,y,theta);

guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function sangle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sl1_Callback(hObject, eventdata, handles)
% hObject    handle to sl1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
n = get(handles.sl1,'Value');
set(handles.l1,'String',num2str(n));
l1=str2num(get(handles.l1,'String'));
l2=str2num(get(handles.l2,'String'));
y=str2num(get(handles.line,'String'));
theta=str2num(get(handles.angle,'String'));
generate(l1,l2,y,theta);

guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function sl1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sl1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sl2_Callback(hObject, eventdata, handles)
% hObject    handle to sl2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
n = get(handles.sl2,'Value');
set(handles.l2,'String',num2str(n));
l1=str2num(get(handles.l1,'String'));
l2=str2num(get(handles.l2,'String'));
y=str2num(get(handles.line,'String'));
theta=str2num(get(handles.angle,'String'));
generate(l1,l2,y,theta);

guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function sl2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sl2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sk1_Callback(hObject, eventdata, handles)
% hObject    handle to sk1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
n = get(handles.sk1,'Value');
set(handles.k1,'String',num2str(n));
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function sk1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sk1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sk2_Callback(hObject, eventdata, handles)
% hObject    handle to sk2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
n = get(handles.sk2,'Value');
set(handles.k2,'String',num2str(n));
guidata(hObject, handles);




% --- Executes during object creation, after setting all properties.
function sk2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sk2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sm_Callback(hObject, eventdata, handles)
% hObject    handle to sm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
n = get(handles.sm,'Value');
set(handles.m,'String',num2str(n));
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function sm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sj_Callback(hObject, eventdata, handles)
% hObject    handle to sj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

n = get(handles.sj,'Value');
set(handles.j,'String',num2str(n));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function sj_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in default1.
function default1_Callback(hObject, eventdata, handles)
% hObject    handle to default1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.line,'String',num2str(20));
set(handles.angle,'String',num2str(pi/12));
set(handles.l1,'String',num2str(10));
set(handles.l2,'String',num2str(14));
set(handles.k1,'String',num2str(200));
set(handles.k2,'String',num2str(300));
set(handles.m,'String',num2str(20));
set(handles.j,'String',num2str(1000));
l1=str2num(get(handles.l1,'String'));
l2=str2num(get(handles.l2,'String'));
y=str2num(get(handles.line,'String'));
theta=str2num(get(handles.angle,'String'));
generate(l1,l2,y,theta);
guidata(hObject, handles);

% --- Executes on button press in default2.
function default2_Callback(hObject, eventdata, handles)
% hObject    handle to default2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.line,'String',num2str(-10));
set(handles.angle,'String',num2str(-pi/12));
set(handles.l1,'String',num2str(12));
set(handles.l2,'String',num2str(15));
set(handles.k1,'String',num2str(300));
set(handles.k2,'String',num2str(200));
set(handles.m,'String',num2str(15));
set(handles.j,'String',num2str(2000));
l1=str2num(get(handles.l1,'String'));
l2=str2num(get(handles.l2,'String'));
y=str2num(get(handles.line,'String'));
theta=str2num(get(handles.angle,'String'));
generate(l1,l2,y,theta);
guidata(hObject, handles);


% --- Executes on button press in default3.
function default3_Callback(hObject, eventdata, handles)
% hObject    handle to default3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.line,'String',num2str(-10));
set(handles.angle,'String',num2str(pi/10));
set(handles.l1,'String',num2str(18));
set(handles.l2,'String',num2str(12));
set(handles.k1,'String',num2str(250));
set(handles.k2,'String',num2str(250));
set(handles.m,'String',num2str(40));
set(handles.j,'String',num2str(4000));
l1=str2num(get(handles.l1,'String'));
l2=str2num(get(handles.l2,'String'));
y=str2num(get(handles.line,'String'));
theta=str2num(get(handles.angle,'String'));
generate(l1,l2,y,theta);
guidata(hObject, handles);


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure1);