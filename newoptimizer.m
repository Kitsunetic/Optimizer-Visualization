function varargout = newoptimizer(varargin)
% NEWOPTIMIZER MATLAB code for newoptimizer.fig
%      NEWOPTIMIZER, by itself, creates a new NEWOPTIMIZER or raises the existing
%      singleton*.
%
%      H = NEWOPTIMIZER returns the handle to a new NEWOPTIMIZER or the handle to
%      the existing singleton*.
%
%      NEWOPTIMIZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWOPTIMIZER.M with the given input arguments.
%
%      NEWOPTIMIZER('Property','Value',...) creates a new NEWOPTIMIZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before newoptimizer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to newoptimizer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help newoptimizer

% Last Modified by GUIDE v2.5 03-Nov-2019 18:02:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newoptimizer_OpeningFcn, ...
                   'gui_OutputFcn',  @newoptimizer_OutputFcn, ...
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


% --- Executes just before newoptimizer is made visible.
function newoptimizer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to newoptimizer (see VARARGIN)

% Choose default command line output for newoptimizer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes newoptimizer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = newoptimizer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in make_function_push.
function make_function_push_Callback(hObject, eventdata, handles)
% hObject    handle to make_function_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

addpath('./utils');

clear x;
clear y;
clear z;

%% read hyper parameters
params = zeros(11, 6);
% alpha
params(1 , 1) = str2num(get(handles.GD_a           , 'String'));
params(2 , 1) = str2num(get(handles.SGD_a          , 'String'));
params(3 , 1) = str2num(get(handles.Momentum_a     , 'String'));
params(4 , 1) = str2num(get(handles.NAG_a          , 'String'));
params(5 , 1) = str2num(get(handles.Adagrad_a      , 'String'));
params(6 , 1) = str2num(get(handles.Adadelta_a     , 'String'));
params(7 , 1) = str2num(get(handles.Rmsprop_a      , 'String'));
params(8 , 1) = str2num(get(handles.Adam_a         , 'String'));
params(9 , 1) = str2num(get(handles.Adamax_a       , 'String'));
params(10, 1) = str2num(get(handles.NAdam_a        , 'String'));
params(11, 1) = str2num(get(handles.RAdam_a        , 'String'));
% lambda
params(1 , 2) = 0;
params(2 , 2) = str2num(get(handles.SGD_lambda     , 'String'));
params(3 , 2) = str2num(get(handles.Momentum_lambda, 'String'));
params(4 , 2) = str2num(get(handles.NAG_lambda     , 'String'));
params(5 , 2) = 0;
params(6 , 2) = 0;
params(7 , 2) = 0;
params(8 , 2) = 0;
params(9 , 2) = 0;
params(10, 2) = 0;
params(11, 2) = 0;
% gamma
params(1 , 3) = 0;
params(2 , 3) = 0;
params(3 , 3) = str2num(get(handles.Momentum_gamma , 'String'));
params(4 , 3) = str2num(get(handles.NAG_gamma      , 'String'));
params(5 , 3) = 0;
params(6 , 3) = str2num(get(handles.Adadelta_gamma , 'String'));
params(7 , 3) = 0;
params(8 , 3) = 0;
params(9 , 3) = 0;
params(10, 3) = 0;
params(11, 3) = 0;
% eps
params(1 , 4) = 0;
params(2 , 4) = 0;
params(3 , 4) = 0;
params(4 , 4) = 0;
params(5 , 4) = str2num(get(handles.Adagrad_eps    , 'String'));
params(6 , 4) = str2num(get(handles.Adadelta_eps   , 'String'));
params(7 , 4) = str2num(get(handles.Rmsprop_eps    , 'String'));
params(8 , 4) = str2num(get(handles.Adam_eps       , 'String'));
params(9 , 4) = 0;
params(10, 4) = str2num(get(handles.NAdam_eps      , 'String'));
params(11, 4) = str2num(get(handles.RAdam_eps      , 'String'));
% beta1
params(1 , 5) = 0;
params(2 , 5) = 0;
params(3 , 5) = 0;
params(4 , 5) = 0;
params(5 , 5) = 0;
params(6 , 5) = 0;
params(7 , 5) = 0;
params(8 , 5) = str2num(get(handles.Adam_beta1     , 'String'));
params(9 , 5) = str2num(get(handles.Adamax_beta1   , 'String'));
params(10, 5) = str2num(get(handles.NAdam_beta1    , 'String'));
params(11, 5) = str2num(get(handles.RAdam_beta1    , 'String'));
% beta2
params(1 , 6) = 0;
params(2 , 6) = 0;
params(3 , 6) = 0;
params(4 , 6) = 0;
params(5 , 6) = 0;
params(6 , 6) = 0;
params(7 , 6) = 0;
params(8 , 6) = str2num(get(handles.Adam_beta2     , 'String'));
params(9 , 6) = str2num(get(handles.Adamax_beta2   , 'String'));
params(10, 6) = str2num(get(handles.NAdam_beta2    , 'String'));
params(11, 6) = str2num(get(handles.RAdam_beta2    , 'String'));

% enabled
enabled(1 ) = get(handles.ch_GD,         'Value');
enabled(2 ) = get(handles.ch_SGD,        'Value');
enabled(3 ) = get(handles.ch_Momentum,   'Value');
enabled(4 ) = get(handles.ch_NAG,        'Value');
enabled(5 ) = get(handles.ch_Adagrad,    'Value');
enabled(6 ) = get(handles.ch_Adadelta,   'Value');
enabled(7 ) = get(handles.ch_Rmsprop,    'Value');
enabled(8 ) = get(handles.ch_Adam,       'Value');
enabled(9 ) = get(handles.ch_Adamax,     'Value');
enabled(10) = get(handles.ch_NAdam,      'Value');
enabled(11) = get(handles.ch_RAdam,      'Value');

f = eval(strcat('@(x,y)', get(handles.function_input, 'String'), ';'));
axis_limit = [
    str2num(get(handles.xmin, 'String')),
    str2num(get(handles.xmax, 'String')),
    str2num(get(handles.ymin, 'String')),
    str2num(get(handles.ymax, 'String')),
    str2num(get(handles.zmin, 'String')),
    str2num(get(handles.zmax, 'String'))
];
x = ones(1, 11) .* str2num(get(handles.init_x, 'String'));
y = ones(1, 11) .* str2num(get(handles.init_y, 'String'));
%f = @(x, y) x.^2 + y.^3;
%axis_limit = [-2, 2, -2, 2, -12, 12];
%x = ones(1, 11) .* 1;
%y = ones(1, 11) .* 1;

cla reset;
draw_batch(handles.graph, f, axis_limit, x, y, params, enabled, 100);


function xmin_Callback(hObject, eventdata, handles)
% hObject    handle to xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmin as text
%        str2double(get(hObject,'String')) returns contents of xmin as a double


% --- Executes during object creation, after setting all properties.
function xmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xmax_Callback(hObject, eventdata, handles)
% hObject    handle to xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmax as text
%        str2double(get(hObject,'String')) returns contents of xmax as a double


% --- Executes during object creation, after setting all properties.
function xmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ymin_Callback(hObject, eventdata, handles)
% hObject    handle to ymin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ymin as text
%        str2double(get(hObject,'String')) returns contents of ymin as a double


% --- Executes during object creation, after setting all properties.
function ymin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ymin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ymax_Callback(hObject, eventdata, handles)
% hObject    handle to ymax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ymax as text
%        str2double(get(hObject,'String')) returns contents of ymax as a double


% --- Executes during object creation, after setting all properties.
function ymax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ymax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zmin_Callback(hObject, eventdata, handles)
% hObject    handle to zmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zmin as text
%        str2double(get(hObject,'String')) returns contents of zmin as a double


% --- Executes during object creation, after setting all properties.
function zmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zmax_Callback(hObject, eventdata, handles)
% hObject    handle to zmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zmax as text
%        str2double(get(hObject,'String')) returns contents of zmax as a double


% --- Executes during object creation, after setting all properties.
function zmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function init_x_Callback(hObject, eventdata, handles)
% hObject    handle to init_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of init_x as text
%        str2double(get(hObject,'String')) returns contents of init_x as a double


% --- Executes during object creation, after setting all properties.
function init_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to init_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function function_input_Callback(hObject, eventdata, handles)
% hObject    handle to function_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of function_input as text
%        str2double(get(hObject,'String')) returns contents of function_input as a double


% --- Executes during object creation, after setting all properties.
function function_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to function_input (see GCBO)
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

%set(handles.graph, 'toolbar', 'newoptimizer');


% --- Executes on button press in ch_Adam.
function ch_Adam_Callback(hObject, eventdata, handles)
% hObject    handle to ch_Adam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch_Adam



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



function Adam_a_Callback(hObject, eventdata, handles)
% hObject    handle to Adam_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Adam_a as text
%        str2double(get(hObject,'String')) returns contents of Adam_a as a double


% --- Executes during object creation, after setting all properties.
function Adam_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Adam_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adam_eps_Callback(hObject, eventdata, handles)
% hObject    handle to Adam_eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Adam_eps as text
%        str2double(get(hObject,'String')) returns contents of Adam_eps as a double


% --- Executes during object creation, after setting all properties.
function Adam_eps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Adam_eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adam_beta1_Callback(hObject, eventdata, handles)
% hObject    handle to Adam_beta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Adam_beta1 as text
%        str2double(get(hObject,'String')) returns contents of Adam_beta1 as a double


% --- Executes during object creation, after setting all properties.
function Adam_beta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Adam_beta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Adam_beta2_Callback(hObject, eventdata, handles)
% hObject    handle to Adam_beta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Adam_beta2 as text
%        str2double(get(hObject,'String')) returns contents of Adam_beta2 as a double


% --- Executes during object creation, after setting all properties.
function Adam_beta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Adam_beta2 (see GCBO)
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



function init_y_Callback(hObject, eventdata, handles)
% hObject    handle to init_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of init_y as text
%        str2double(get(hObject,'String')) returns contents of init_y as a double


% --- Executes during object creation, after setting all properties.
function init_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to init_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in list.
function list_Callback(hObject, eventdata, handles)
switch get(handles.list,'value')
    case 1     
       set(handles.function_input,'string','x.^2+y.^3')
    case 2   
        set(handles.function_input,'string','4*x.^2-4*x.*y+2*y.^2')
    case 3
        set(handles.function_input,'string','x.^3+y.^3')
    otherwise  % This should never happen!
        disp('Matlab entered the twilight zone, aborting.')
        close(handles.optimizer)
        quit
end

% hObject    handle to list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list


% --- Executes during object creation, after setting all properties.
function list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
