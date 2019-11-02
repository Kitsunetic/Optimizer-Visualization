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

% Last Modified by GUIDE v2.5 03-Nov-2019 00:23:32

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

function varargout = optimizer_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function input22_Callback(hObject, eventdata, handles)

function input22_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function input21_Callback(hObject, eventdata, handles)

function input21_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input20_Callback(hObject, eventdata, handles)

function input20_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function input12_Callback(hObject, eventdata, handles)

function input12_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function input11_Callback(hObject, eventdata, handles)

function input11_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function input10_Callback(hObject, eventdata, handles)

function input10_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input02_Callback(hObject, eventdata, handles)

function input02_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input01_Callback(hObject, eventdata, handles)

function input01_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input00_Callback(hObject, eventdata, handles)

function input00_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






% --- Executes on button press in make_function_push.
function make_function_push_Callback(hObject, eventdata, handles)
a = get(handles.input22,'String');
b = get(handles.input21,'String');
c = get(handles.input20,'String');
d = get(handles.input12,'String');
e = get(handles.input11,'String');
f = get(handles.input10,'String');
g = get(handles.input02,'String');
h = get(handles.input01,'String');
i = get(handles.input00,'String');
%h=strcat(a,e,b,f,c,g,d);
%set(handles.fun_static,'String',h);
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






% --- check box start
function ch_SGD_Callback(hObject, eventdata, handles)


function ch_Momentum_Callback(hObject, eventdata, handles)


function ch_NAG_Callback(hObject, eventdata, handles)


function ch_Adagrad_Callback(hObject, eventdata, handles)


function ch_Adadelta_Callback(hObject, eventdata, handles)


function ch_Rmsprop_Callback(hObject, eventdata, handles)


function ch_GD_Callback(hObject, eventdata, handles)

function ch_NAdam_Callback(hObject, eventdata, handles)

function ch_RAdam_Callback(hObject, eventdata, handles)

function ch_Adamax_Callback(hObject, eventdata, handles)

%check box end


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

%chang parameter end


%GD PARAMETER
function GD_a_Callback(hObject, eventdata, handles)

function GD_a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%SGD PARAMETER
function SGD_a_Callback(hObject, eventdata, handles)

function SGD_a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SGD_lambda_Callback(hObject, eventdata, handles)

function SGD_lambda_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%MOMENTUM PARAMETER


function Momentum_a_Callback(hObject, eventdata, handles)

function Momentum_a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Momentum_lambda_Callback(hObject, eventdata, handles)

function Momentum_lambda_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Momentum_gamma_Callback(hObject, eventdata, handles)

function Momentum_gamma_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%NAG PARAMETER

function NAG_a_Callback(hObject, eventdata, handles)

function NAG_a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NAG_lambda_Callback(hObject, eventdata, handles)

function NAG_lambda_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NAG_gamma_Callback(hObject, eventdata, handles)

function NAG_gamma_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%ADAGRAD PARAMETER

function Adagrad_a_Callback(hObject, eventdata, handles)

function Adagrad_a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adagrad_eps_Callback(hObject, eventdata, handles)

function Adagrad_eps_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Adadelta parameter

function Adadelta_a_Callback(hObject, eventdata, handles)

function Adadelta_a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adadelta_eps_Callback(hObject, eventdata, handles)

function Adadelta_eps_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adadelta_gamma_Callback(hObject, eventdata, handles)

function Adadelta_gamma_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Rmsprop parameter


function Rmsprop_a_Callback(hObject, eventdata, handles)

function Rmsprop_a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rmsprop_eps_Callback(hObject, eventdata, handles)

function Rmsprop_eps_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%NAdam parameter

function NAdam_a_Callback(hObject, eventdata, handles)

function NAdam_a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NAdam_eps_Callback(hObject, eventdata, handles)

function NAdam_eps_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NAdam_beta1_Callback(hObject, eventdata, handles)

function NAdam_beta1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NAdam_beta2_Callback(hObject, eventdata, handles)

function NAdam_beta2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%RAdam parameter

function RAdam_a_Callback(hObject, eventdata, handles)

function RAdam_a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RAdam_eps_Callback(hObject, eventdata, handles)

function RAdam_eps_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RAdam_beta1_Callback(hObject, eventdata, handles)

function RAdam_beta1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RAdam_beta2_Callback(hObject, eventdata, handles)

function RAdam_beta2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%Adamax parameter

function Adamax_a_Callback(hObject, eventdata, handles)

function Adamax_a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adamax_beta1_Callback(hObject, eventdata, handles)

function Adamax_beta1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adamax_beta2_Callback(hObject, eventdata, handles)

function Adamax_beta2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
