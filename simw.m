function varargout = simw(varargin)
% SIMW MATLAB code for simw.fig
%      SIMW, by itself, creates a new SIMW or raises the existing
%      singleton*.
%
%      H = SIMW returns the handle to a new SIMW or the handle to
%      the existing singleton*.
%
%      SIMW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMW.M with the given input arguments.
%
%      SIMW('Property','Value',...) creates a new SIMW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before simw_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to simw_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help simw

% Last Modified by GUIDE v2.5 13-Apr-2015 00:04:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @simw_OpeningFcn, ...
                   'gui_OutputFcn',  @simw_OutputFcn, ...
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


% --- Executes just before simw is made visible.
function simw_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simw (see VARARGIN)

% Choose default command line output for simw
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes simw wait for user response (see UIRESUME)
% uiwait(handles.figure1);

line = cell2mat(varargin(1));
angle = cell2mat(varargin(2));
l1 = cell2mat(varargin(3));
l2 = cell2mat(varargin(4));
k1 = cell2mat(varargin(1));
k2 = cell2mat(varargin(2));
m = cell2mat(varargin(3));
j = cell2mat(varargin(4));
set(handles.play,'String','Simulation Paused. Select to play.');


% --- Outputs from this function are returned to the command line.
function varargout = simw_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of play

if(get(handles.play,'Value')==1)
       set(handles.play,'String','Simulation being played. Unselect to pause.');
end
if(get(handles.play,'Value')==0)
       set(handles.play,'String','Simulation paused. Select to play.');
end

% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(handles.figure1);

% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

dimension;
close(handles.figure1);

