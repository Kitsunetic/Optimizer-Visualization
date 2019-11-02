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

% Last Modified by GUIDE v2.5 02-Nov-2019 23:54:38

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



function input21_Callback(hObject, eventdata, handles)
% hObject    handle to input21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input21 as text
%        str2double(get(hObject,'String')) returns contents of input21 as a double


% --- Executes during object creation, after setting all properties.
function input21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input20_Callback(hObject, eventdata, handles)
% hObject    handle to input20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input20 as text
%        str2double(get(hObject,'String')) returns contents of input20 as a double


% --- Executes during object creation, after setting all properties.
function input20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input11_Callback(hObject, eventdata, handles)
% hObject    handle to input11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input11 as text
%        str2double(get(hObject,'String')) returns contents of input11 as a double


% --- Executes during object creation, after setting all properties.
function input11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in make_function_push.
function make_function_push_Callback(hObject, eventdata, handles)
a = get(handles.input22,'String');
b = get(handles.input21,'String');
c = get(handles.input20,'String');
d = get(handles.input11,'String');
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
switch get(handles.ch_GD,'Value')
    case 1     % GD그래프 출력
        
    case 0    % 그래프 없음
        
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(S.fh)
        quit
end
switch get(handles.ch_SGD,'Value')
    case 1     % SGD그래프 출력
        
    case 0    % 그래프 없음
        
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(S.fh)
        quit
end
switch get(handles.ch_Momentum,'Value')
    case 1     % Momentum그래프 출력
        
    case 0    % 그래프 없음
        
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(S.fh)
        quit
end
switch get(handles.ch_NAG,'Value')
    case 1     % NAG그래프 출력
        
    case 0    % 그래프 없음
        
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(S.fh)
        quit
end
switch get(handles.ch_Adagrad,'Value')
    case 1     % Adagrad그래프 출력
        
    case 0    % 그래프 없음
        
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(S.fh)
        quit
end
switch get(handles.ch_Adadelta,'Value')
    case 1     % Adadelta 그래프 출력
        
    case 0    % 그래프 없음
        
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(S.fh)
        quit
end
switch get(handles.ch_Rmsprop,'Value')
    case 1     % Rmsprop그래프 출력
        
    case 0    % 그패프 없음
        
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(S.fh)
        quit
end
guidata(hObject, handles);
% hObject    handle to make_function_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function input22_Callback(hObject, eventdata, handles)
% hObject    handle to input22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input22 as text
%        str2double(get(hObject,'String')) returns contents of input22 as a double


% --- Executes during object creation, after setting all properties.
function input22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ch_SGD.
function ch_SGD_Callback(hObject, eventdata, handles)

% hObject    handle to ch_SGD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_SGD


% --- Executes on button press in ch_Momentum.
function ch_Momentum_Callback(hObject, eventdata, handles)

% hObject    handle to ch_Momentum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_Momentum


% --- Executes on button press in ch_NAG.
function ch_NAG_Callback(hObject, eventdata, handles)

% hObject    handle to ch_NAG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_NAG


% --- Executes on button press in ch_Adagrad.
function ch_Adagrad_Callback(hObject, eventdata, handles)

% hObject    handle to ch_Adagrad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_Adagrad


% --- Executes on button press in ch_Adadelta.
function ch_Adadelta_Callback(hObject, eventdata, handles)

% hObject    handle to ch_Adadelta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_Adadelta


% --- Executes on button press in ch_Rmsprop.
function ch_Rmsprop_Callback(hObject, eventdata, handles)

% hObject    handle to ch_Rmsprop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_Rmsprop


% --- Executes on button press in ch_GD.
function ch_GD_Callback(hObject, eventdata, handles)

% hObject    handle to ch_GD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_GD



function step_size_Callback(hObject, eventdata, handles)
% hObject    handle to step_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of step_size as text
%        str2double(get(hObject,'String')) returns contents of step_size as a double


% --- Executes during object creation, after setting all properties.
function step_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function epsilon_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epsilon as text
%        str2double(get(hObject,'String')) returns contents of epsilon as a double


% --- Executes during object creation, after setting all properties.
function epsilon_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsilon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Momentum_lambda_Callback(hObject, eventdata, handles)
% hObject    handle to Momentum_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Momentum_lambda as text
%        str2double(get(hObject,'String')) returns contents of Momentum_lambda as a double


% --- Executes during object creation, after setting all properties.
function Momentum_lambda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Momentum_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Momentum_gamma_Callback(hObject, eventdata, handles)
% hObject    handle to Momentum_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Momentum_gamma as text
%        str2double(get(hObject,'String')) returns contents of Momentum_gamma as a double


% --- Executes during object creation, after setting all properties.
function Momentum_gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Momentum_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SGD_lambda_Callback(hObject, eventdata, handles)
% hObject    handle to SGD_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SGD_lambda as text
%        str2double(get(hObject,'String')) returns contents of SGD_lambda as a double


% --- Executes during object creation, after setting all properties.
function SGD_lambda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SGD_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input10_Callback(hObject, eventdata, handles)
% hObject    handle to input10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input10 as text
%        str2double(get(hObject,'String')) returns contents of input10 as a double


% --- Executes during object creation, after setting all properties.
function input10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input02_Callback(hObject, eventdata, handles)
% hObject    handle to input02 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input02 as text
%        str2double(get(hObject,'String')) returns contents of input02 as a double


% --- Executes during object creation, after setting all properties.
function input02_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input02 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input01_Callback(hObject, eventdata, handles)
% hObject    handle to input01 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input01 as text
%        str2double(get(hObject,'String')) returns contents of input01 as a double


% --- Executes during object creation, after setting all properties.
function input01_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input01 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input00_Callback(hObject, eventdata, handles)
% hObject    handle to input00 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input00 as text
%        str2double(get(hObject,'String')) returns contents of input00 as a double


% --- Executes during object creation, after setting all properties.
function input00_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input00 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input12_Callback(hObject, eventdata, handles)
% hObject    handle to input12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input12 as text
%        str2double(get(hObject,'String')) returns contents of input12 as a double


% --- Executes during object creation, after setting all properties.
function input12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ch_NAdam.
function ch_NAdam_Callback(hObject, eventdata, handles)
% hObject    handle to ch_NAdam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_NAdam


% --- Executes on button press in ch_RAdam.
function ch_RAdam_Callback(hObject, eventdata, handles)
% hObject    handle to ch_RAdam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_RAdam


% --- Executes on button press in ch_Adamax.
function ch_Adamax_Callback(hObject, eventdata, handles)
% hObject    handle to ch_Adamax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_Adamax


% --- Executes on button press in change_para.
function change_para_Callback(hObject, eventdata, handles)
switch get(handles.ch_GD,'value')
    case 0     % The text is visible, make it invisible.
        set(handles.GD_uipanel,'visible','off')
    case 1    % The text is invisible, make it visible.
        set(handles.GD_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
switch get(handles.ch_Rmsprop,'value')
    case 0     % The text is visible, make it invisible.
        set(handles.Rmsprop_uipanel,'visible','off')
    case 1    % The text is invisible, make it visible.
        set(handles.Rmsprop_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
switch get(handles.ch_Adadelta,'value')
    case 0     % The text is visible, make it invisible.
        set(handles.Adadelta_uipanel,'visible','off')
    case 1    % The text is invisible, make it visible.
        set(handles.Adadelta_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
switch get(handles.ch_Adagrad,'value')
    case 0     % The text is visible, make it invisible.
        set(handles.Adagrad_uipanel,'visible','off')
    case 1    % The text is invisible, make it visible.
        set(handles.Adagrad_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
switch get(handles.ch_NAG,'value')
    case 0     % The text is visible, make it invisible.
        set(handles.NAG_uipanel,'visible','off')
    case 1    % The text is invisible, make it visible.
        set(handles.NAG_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
switch get(handles.ch_Momentum,'value')
    case 0     % The text is visible, make it invisible.
        set(handles.Momentum_uipanel,'visible','off')
    case 1    % The text is invisible, make it visible.
        set(handles.Momentum_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
switch get(handles.ch_SGD,'value') %
    case 0     % The text is visible, make it invisible.
        set(handles.SGD_uipanel,'visible','off')
    case 1    % The text is invisible, make it visible.
        set(handles.SGD_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
switch get(handles.ch_RAdam,'value')
    case 0     % The text is visible, make it invisible.
        set(handles.RAdam_uipanel,'visible','off')
    case 1    % The text is invisible, make it visible.
        set(handles.RAdam_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
switch get(handles.ch_Adamax,'value')
    case 0     % The text is visible, make it invisible.
        set(handles.Adamax_uipanel,'visible','off')
    case 1    % The text is invisible, make it visible.
        set(handles.Adamax_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end
switch get(handles.ch_NAdam,'value')
    case 0     % The text is visible, make it invisible.
        set(handles.NAdam_uipanel,'visible','off')
    case 1    % The text is invisible, make it visible.
        set(handles.NAdam_uipanel,'visible','on')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end


% hObject    handle to change_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function GD_a_Callback(hObject, eventdata, handles)
% hObject    handle to GD_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GD_a as text
%        str2double(get(hObject,'String')) returns contents of GD_a as a double


% --- Executes during object creation, after setting all properties.
function GD_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GD_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adamax_a_Callback(hObject, eventdata, handles)
% hObject    handle to Adamax_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Adamax_a as text
%        str2double(get(hObject,'String')) returns contents of Adamax_a as a double


% --- Executes during object creation, after setting all properties.
function Adamax_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Adamax_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adamax_beta1_Callback(hObject, eventdata, handles)
% hObject    handle to Adamax_beta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Adamax_beta1 as text
%        str2double(get(hObject,'String')) returns contents of Adamax_beta1 as a double


% --- Executes during object creation, after setting all properties.
function Adamax_beta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Adamax_beta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adamax_beta2_Callback(hObject, eventdata, handles)
% hObject    handle to Adamax_beta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Adamax_beta2 as text
%        str2double(get(hObject,'String')) returns contents of Adamax_beta2 as a double


% --- Executes during object creation, after setting all properties.
function Adamax_beta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Adamax_beta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RAdam_a_Callback(hObject, eventdata, handles)
% hObject    handle to RAdam_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RAdam_a as text
%        str2double(get(hObject,'String')) returns contents of RAdam_a as a double


% --- Executes during object creation, after setting all properties.
function RAdam_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RAdam_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RAdam_eps_Callback(hObject, eventdata, handles)
% hObject    handle to RAdam_eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RAdam_eps as text
%        str2double(get(hObject,'String')) returns contents of RAdam_eps as a double


% --- Executes during object creation, after setting all properties.
function RAdam_eps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RAdam_eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RAdam_beta1_Callback(hObject, eventdata, handles)
% hObject    handle to RAdam_beta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RAdam_beta1 as text
%        str2double(get(hObject,'String')) returns contents of RAdam_beta1 as a double


% --- Executes during object creation, after setting all properties.
function RAdam_beta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RAdam_beta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RAdam_beta2_Callback(hObject, eventdata, handles)
% hObject    handle to RAdam_beta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RAdam_beta2 as text
%        str2double(get(hObject,'String')) returns contents of RAdam_beta2 as a double


% --- Executes during object creation, after setting all properties.
function RAdam_beta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RAdam_beta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NAdam_a_Callback(hObject, eventdata, handles)
% hObject    handle to NAdam_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NAdam_a as text
%        str2double(get(hObject,'String')) returns contents of NAdam_a as a double


% --- Executes during object creation, after setting all properties.
function NAdam_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NAdam_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NAdam_eps_Callback(hObject, eventdata, handles)
% hObject    handle to NAdam_eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NAdam_eps as text
%        str2double(get(hObject,'String')) returns contents of NAdam_eps as a double


% --- Executes during object creation, after setting all properties.
function NAdam_eps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NAdam_eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NAdam_beta1_Callback(hObject, eventdata, handles)
% hObject    handle to NAdam_beta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NAdam_beta1 as text
%        str2double(get(hObject,'String')) returns contents of NAdam_beta1 as a double


% --- Executes during object creation, after setting all properties.
function NAdam_beta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NAdam_beta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NAdam_beta2_Callback(hObject, eventdata, handles)
% hObject    handle to NAdam_beta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NAdam_beta2 as text
%        str2double(get(hObject,'String')) returns contents of NAdam_beta2 as a double


% --- Executes during object creation, after setting all properties.
function NAdam_beta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NAdam_beta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rmsprop_a_Callback(hObject, eventdata, handles)
% hObject    handle to Rmsprop_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rmsprop_a as text
%        str2double(get(hObject,'String')) returns contents of Rmsprop_a as a double


% --- Executes during object creation, after setting all properties.
function Rmsprop_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rmsprop_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rmsprop_eps_Callback(hObject, eventdata, handles)
% hObject    handle to Rmsprop_eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rmsprop_eps as text
%        str2double(get(hObject,'String')) returns contents of Rmsprop_eps as a double


% --- Executes during object creation, after setting all properties.
function Rmsprop_eps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rmsprop_eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adadelta_a_Callback(hObject, eventdata, handles)
% hObject    handle to Adadelta_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Adadelta_a as text
%        str2double(get(hObject,'String')) returns contents of Adadelta_a as a double


% --- Executes during object creation, after setting all properties.
function Adadelta_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Adadelta_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adadelta_eps_Callback(hObject, eventdata, handles)
% hObject    handle to Adadelta_eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Adadelta_eps as text
%        str2double(get(hObject,'String')) returns contents of Adadelta_eps as a double


% --- Executes during object creation, after setting all properties.
function Adadelta_eps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Adadelta_eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adadelta_gamma_Callback(hObject, eventdata, handles)
% hObject    handle to Adadelta_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Adadelta_gamma as text
%        str2double(get(hObject,'String')) returns contents of Adadelta_gamma as a double


% --- Executes during object creation, after setting all properties.
function Adadelta_gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Adadelta_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adagrad_a_Callback(hObject, eventdata, handles)
% hObject    handle to Adagrad_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Adagrad_a as text
%        str2double(get(hObject,'String')) returns contents of Adagrad_a as a double


% --- Executes during object creation, after setting all properties.
function Adagrad_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Adagrad_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adagrad_eps_Callback(hObject, eventdata, handles)
% hObject    handle to Adagrad_eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Adagrad_eps as text
%        str2double(get(hObject,'String')) returns contents of Adagrad_eps as a double


% --- Executes during object creation, after setting all properties.
function Adagrad_eps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Adagrad_eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NAG_a_Callback(hObject, eventdata, handles)
% hObject    handle to NAG_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NAG_a as text
%        str2double(get(hObject,'String')) returns contents of NAG_a as a double


% --- Executes during object creation, after setting all properties.
function NAG_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NAG_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NAG_lambda_Callback(hObject, eventdata, handles)
% hObject    handle to NAG_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NAG_lambda as text
%        str2double(get(hObject,'String')) returns contents of NAG_lambda as a double


% --- Executes during object creation, after setting all properties.
function NAG_lambda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NAG_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NAG_gamma_Callback(hObject, eventdata, handles)
% hObject    handle to NAG_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NAG_gamma as text
%        str2double(get(hObject,'String')) returns contents of NAG_gamma as a double


% --- Executes during object creation, after setting all properties.
function NAG_gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NAG_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Momentum_a_Callback(hObject, eventdata, handles)
% hObject    handle to Momentum_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Momentum_a as text
%        str2double(get(hObject,'String')) returns contents of Momentum_a as a double


% --- Executes during object creation, after setting all properties.
function Momentum_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Momentum_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SGD_a_Callback(hObject, eventdata, handles)
% hObject    handle to SGD_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SGD_a as text
%        str2double(get(hObject,'String')) returns contents of SGD_a as a double


% --- Executes during object creation, after setting all properties.
function SGD_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SGD_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
