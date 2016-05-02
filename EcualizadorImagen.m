function varargout = EcualizadorImagen(varargin)
% ECUALIZADORIMAGEN MATLAB code for EcualizadorImagen.fig
%      ECUALIZADORIMAGEN, by itself, creates a new ECUALIZADORIMAGEN or raises the existing
%      singleton*.
%
%      H = ECUALIZADORIMAGEN returns the handle to a new ECUALIZADORIMAGEN or the handle to
%      the existing singleton*.
%
%      ECUALIZADORIMAGEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ECUALIZADORIMAGEN.M with the given input arguments.
%
%      ECUALIZADORIMAGEN('Property','Value',...) creates a new ECUALIZADORIMAGEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EcualizadorImagen_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EcualizadorImagen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EcualizadorImagen

<<<<<<< HEAD
% Last Modified by GUIDE v2.5 01-May-2016 20:10:34
=======
% Last Modified by GUIDE v2.5 01-May-2016 21:54:37
>>>>>>> origin/master

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EcualizadorImagen_OpeningFcn, ...
                   'gui_OutputFcn',  @EcualizadorImagen_OutputFcn, ...
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


% --- Executes just before EcualizadorImagen is made visible.
function EcualizadorImagen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EcualizadorImagen (see VARARGIN)

% Choose default command line output for EcualizadorImagen
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global K2 K3 K4 K5 K6
find_system('Name','Eq_1');
open_system('Eq_1');
a=0;
im2=imread('played.png');
set(handles.repro,'CData',im2);
video=videoinput('macvideo',1,'YCbCr422_1280x720');
Fuente=getselectedsource(video);
c=1;
preview(video)
while c<=1000
imaggen=getsnapshot(video);
imaggen=imresize(imaggen,0.5);
s=ycbcr2rgb(imaggen);
s=fliplr(s);


gris=rgb2gray(s);
binari=im2bw(gris,0.2);
%<<<<<<< Updated upstream
binari=1-binari;
binari=imfill(binari,'holes');
[L Ne]=bwlabel(binari);
prop=regionprops(L,'Area','Extrema');
axes(handles.axes4)
imshow(binari);

for n=1:size(prop,1) %For 1 to Total number of coins
    cent=prop(n).Extrema;
    X=cent(8,1);Y=cent(8,2);
    
  
    if prop(n).Area>2500
        text(X,Y,'ø','Color','red')
    end
end
%%cambios sin probrar
if Y>=0 && Y<=240
valorSlider=2-(Y/110);

    if X<=128
        valorSlider1=valorSlider;
    set(handles.slider2,'Value',valorSlider1);
    elseif X>128 && X<=256
        valorSlider2=valorSlider;
    set(handles.slider3,'Value',valorSlider2);
    elseif X>256 && X<=384
        valorSlider3=valorSlider;
    set(handles.slider4,'Value',valorSlider3);
    elseif X>384 && X<=512
        valorSlider4=valorSlider;
    set(handles.slider5,'Value',valorSlider4);
    elseif X>512 
        valorSlider5=valorSlider;
    set(handles.slider6,'Value',valorSlider5);
    end
    %%Cambios
elseif Y>260
    
    if X>128 && X<=256
        set(handles.play,'Value',1);
    elseif X>384 && X<=512
        set(handles.stop,'Value',1);
    end
end



%=======
    K2=get(handles.slider2,'Value')
    K3=get(handles.slider3,'Value')
    K4=get(handles.slider4,'Value')
    K5=get(handles.slider5,'Value')
    K6=get(handles.slider6,'Value')

    set_param('Eq_1/Gain0','Gain',num2str(K2));
    set_param('Eq_1/Gain1','Gain',num2str(K3));
    set_param('Eq_1/Gain2','Gain',num2str(K4));
    set_param('Eq_1/Gain3','Gain',num2str(K5));
    set_param('Eq_1/Gain4','Gain',num2str(K6));
%>>>>>>> Stashed changes
c=c+1;
if a==0
set_param(gcs,'SimulationCommand','Start')
a=1;
end
pause(1/20);
end
% UIWAIT makes EcualizadorImagen wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EcualizadorImagen_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% global K2
% K2=get(hObject,'Value');
% set_param('Eq_1/Gain0','Gain',num2str(K2));
% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% global K3
% K3=get(hObject,'Value');
% set_param('Eq_1/Gain0','Gain',num2str(K3));

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% global K4
% K4=get(hObject,'Value');
% set_param('Eq_1/Gain0','Gain',num2str(K4));
% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global K5
K5=get(hObject,'Value');
set_param('Eq_1/Gain0','Gain',num2str(K5));
% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% global K6
% K6=get(hObject,'Value');
% set_param('Eq_1/Gain0','Gain',num2str(K6));

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


<<<<<<< HEAD
% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over play.
function play_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
=======
% --- Executes on button press in repro.
function repro_Callback(hObject, eventdata, handles)
% hObject    handle to repro (see GCBO)
>>>>>>> origin/master
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
