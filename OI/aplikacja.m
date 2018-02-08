function varargout = aplikacja(varargin)
% APLIKACJA MATLAB code for aplikacja.fig
%      APLIKACJA, by itself, creates a new APLIKACJA or raises the existing
%      singleton*.
%
%      H = APLIKACJA returns the handle to a new APLIKACJA or the handle to
%      the existing singleton*.
%
%      APLIKACJA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APLIKACJA.M with the given input arguments.
%
%      APLIKACJA('Property','Value',...) creates a new APLIKACJA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before aplikacja_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to aplikacja_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help aplikacja

% Last Modified by GUIDE v2.5 28-Dec-2017 21:39:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @aplikacja_OpeningFcn, ...
                   'gui_OutputFcn',  @aplikacja_OutputFcn, ...
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


% --- Executes just before aplikacja is made visible.
function aplikacja_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to aplikacja (see VARARGIN)

% Choose default command line output for aplikacja
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes aplikacja wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = aplikacja_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in skrzypce.
function skrzypce_Callback(hObject, eventdata, handles)
% hObject    handle to skrzypce (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[xskrzypce,Fsskrzypce]=audioread('skrzypcebez_ciszy_krotki.wav');
handles.myPlayer=audioplayer(xskrzypce,Fsskrzypce);
play(handles.myPlayer);

[maxValue maxx] = max(xskrzypce);

if(maxx==39901)
    skrzypce='skrzypce';
    set(handles.rozpoznanyinstrument,'string',skrzypce);
end
guidata(hObject,handles)


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

stop(handles.myPlayer);


% --- Executes during object creation, after setting all properties.
function obraz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to obraz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate obraz


% --- Executes on button press in puzon.
function puzon_Callback(hObject, eventdata, handles)
% hObject    handle to puzon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[xpuzon,Fspuzon]=audioread('puzonbez_ciszy_krotki.wav');
handles.myPlayer=audioplayer(xpuzon,Fspuzon);

play(handles.myPlayer);

% maksimum_insrument=findpeaks(xpuzon);
[maxValue maxx] = max(xpuzon);
if(maxx==27664)
    puzon='puzon';
    
pause(1)
    set(handles.rozpoznanyinstrument,'string',puzon);
end

guidata(hObject,handles);


% --- Executes on button press in organy.
function organy_Callback(hObject, eventdata, handles)
% hObject    handle to organy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[xorgany,Fsorgany]=audioread('organybez_ciszy_krotki.wav');
handles.myPlayer=audioplayer(xorgany,Fsorgany);
play(handles.myPlayer);

[maxValue maxx] = max(xorgany);
if(maxx==20156)
   organy='organy koœcielne';
   pause(1)
    set(handles.rozpoznanyinstrument,'string',organy); 
end

guidata(hObject,handles);


% --- Executes on button press in harfa.
function harfa_Callback(hObject, eventdata, handles)
% hObject    handle to harfa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[xharfa,Fsharfa]=audioread('harfabez_ciszy_krotki.wav');
handles.myPlayer=audioplayer(xharfa,Fsharfa);
play(handles.myPlayer);
[maxValue maxx] = max(xharfa);

if(maxx==23302)
   harfa='harfa';
   pause(1)
    set(handles.rozpoznanyinstrument,'string',harfa); 
end

guidata(hObject,handles);


% --- Executes on button press in flet.
function flet_Callback(hObject, eventdata, handles)
% hObject    handle to flet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[xflet,Fsflet]=audioread('piccolobez_ciszy_krotki.wav');
handles.myPlayer=audioplayer(xflet,Fsflet);
play(handles.myPlayer);

[maxValue maxx] = max(xflet);

if(maxx==20106)
   flet='flet piccolo';
   pause(1)
    set(handles.rozpoznanyinstrument,'string',flet);
end

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function rozpoznanyinstrument_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rozpoznanyinstrument (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% handles.myPlayer


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
axes2(hObject)
imshow('insta.jpg')



% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
axes(hObject)
imshow('insta.jpg')
