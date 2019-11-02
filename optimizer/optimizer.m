function varargout = optimizer(varargin)
% OPTIMIZER MATLAB code for optimizer.fig
%      OPTIMIZER, by itself, creates a new OPTIMIZER or raises the existing
%      singleton*.
%
%      H = OPTIMIZER returns the handle to a new OPTIMIZER or the handle to
%      the existing singleton*.
%
%      OPTIMIZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPTIMIZER.M with the given input arguments.
%
%      OPTIMIZER('Property','Value',...) creates a new OPTIMIZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before optimizer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to optimizer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help optimizer

% Last Modified by GUIDE v2.5 01-Nov-2019 19:16:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @optimizer_OpeningFcn, ...
                   'gui_OutputFcn',  @optimizer_OutputFcn, ...
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


% --- Executes just before optimizer is made visible.
function optimizer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to optimizer (see VARARGIN)

% Choose default command line output for optimizer
handles.output = hObject;

guidata(hObject, handles);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes optimizer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = optimizer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function input2_Callback(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input2 as text
%        str2double(get(hObject,'String')) returns contents of input2 as a double


% --- Executes during object creation, after setting all properties.
function input2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input1_Callback(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input1 as text
%        str2double(get(hObject,'String')) returns contents of input1 as a double


% --- Executes during object creation, after setting all properties.
function input1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input0_Callback(hObject, eventdata, handles)
% hObject    handle to input0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input0 as text
%        str2double(get(hObject,'String')) returns contents of input0 as a double


% --- Executes during object creation, after setting all properties.
function input0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in make_function_push.
function make_function_push_Callback(hObject, eventdata, handles)
a = get(handles.input3,'String');
b = get(handles.input2,'String');
c = get(handles.input1,'String');
d = get(handles.input0,'String');
e=string('x^3');
f=string('x^2');
g=string('x^1');
h=strcat(a,e,b,f,c,g,d);
set(handles.fun_static,'String',h);
x=1:10;
aa=str2num(a);
bb=str2num(b);
cc=str2num(c);
dd=str2num(d);
%h=strcat(a,e,b,f,c,g,d);
%set(handles.fun_static,'String',h);
k=@(x) aa*x.^3+bb*x.^2+cc*x+dd;

plot(x,k(x));
guidata(hObject, handles);
% hObject    handle to make_function_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function input3_Callback(hObject, eventdata, handles)
% hObject    handle to input3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input3 as text
%        str2double(get(hObject,'String')) returns contents of input3 as a double


% --- Executes during object creation, after setting all properties.
function input3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ch_SGD.
function ch_SGD_Callback(hObject, eventdata, handles)
switch get(handles.SGD_uipanel,'visible')
    case 'on'     % The text is visible, make it invisible.
        set(handles.SGD_uipanel,'visible','off')
    case 'off'    % The text is invisible, make it visible.
        set(handles.SGD_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
% hObject    handle to ch_SGD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_SGD


% --- Executes on button press in ch_Momentum.
function ch_Momentum_Callback(hObject, eventdata, handles)
switch get(handles.Momentum_uipanel,'visible')
    case 'on'     % The text is visible, make it invisible.
        set(handles.Momentum_uipanel,'visible','off')
    case 'off'    % The text is invisible, make it visible.
        set(handles.Momentum_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
% hObject    handle to ch_Momentum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_Momentum


% --- Executes on button press in ch_NAG.
function ch_NAG_Callback(hObject, eventdata, handles)
switch get(handles.NAG_uipanel,'visible')
    case 'on'     % The text is visible, make it invisible.
        set(handles.NAG_uipanel,'visible','off')
    case 'off'    % The text is invisible, make it visible.
        set(handles.NAG_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
% hObject    handle to ch_NAG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_NAG


% --- Executes on button press in ch_Adagrad.
function ch_Adagrad_Callback(hObject, eventdata, handles)
switch get(handles.Adagrad_uipanel,'visible')
    case 'on'     % The text is visible, make it invisible.
        set(handles.Adagrad_uipanel,'visible','off')
    case 'off'    % The text is invisible, make it visible.
        set(handles.Adagrad_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
% hObject    handle to ch_Adagrad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_Adagrad


% --- Executes on button press in ch_Adadelta.
function ch_Adadelta_Callback(hObject, eventdata, handles)
switch get(handles.Adadelta_uipanel,'visible')
    case 'on'     % The text is visible, make it invisible.
        set(handles.Adadelta_uipanel,'visible','off')
    case 'off'    % The text is invisible, make it visible.
        set(handles.Adadelta_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
% hObject    handle to ch_Adadelta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_Adadelta


% --- Executes on button press in ch_Rmsprop.
function ch_Rmsprop_Callback(hObject, eventdata, handles)
switch get(handles.Rmsprop_uipanel,'visible')
    case 'on'     % The text is visible, make it invisible.
        set(handles.Rmsprop_uipanel,'visible','off')
    case 'off'    % The text is invisible, make it visible.
        set(handles.Rmsprop_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
% hObject    handle to ch_Rmsprop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_Rmsprop


% --- Executes on button press in ch_GD.
function ch_GD_Callback(hObject, eventdata, handles)
switch get(handles.GD_uipanel,'visible')
    case 'on'     % The text is visible, make it invisible.
        set(handles.GD_uipanel,'visible','off')
    case 'off'    % The text is invisible, make it visible.
        set(handles.GD_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
% hObject    handle to ch_GD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_GD
