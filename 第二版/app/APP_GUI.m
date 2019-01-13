function varargout = APP_GUI(varargin)
% APP_GUI MATLAB code for APP_GUI.fig
%      APP_GUI, by itself, creates a new APP_GUI or raises the existing
%      singleton*.
%
%      H = APP_GUI returns the handle to a new APP_GUI or the handle to
%      the existing singleton*.
%
%      APP_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_GUI.M with the given input arguments.
%
%      APP_GUI('Property','Value',...) creates a new APP_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before APP_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to APP_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help APP_GUI

% Last Modified by GUIDE v2.5 14-Jan-2019 02:03:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @APP_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @APP_GUI_OutputFcn, ...
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


% --- Executes just before APP_GUI is made visible.
function APP_GUI_OpeningFcn(hObject, eventdata, handles, varargin)

global Ease_Dang
Ease_Dang=[];
global Diff_Dang
Diff_Dang=[]
global Ease_Safe
Ease_Safe=[];
global Diff_Safe
Diff_Safe=[]
global count_diff_dang
global count_ease_dang
global count_diff_safe
global count_ease_safe
global count_error

count_diff_dang=0
count_ease_dang=0
count_diff_safe=0
count_ease_safe=0
count_error=0

file_path = uigetdir('*.*','请选择文件夹');
file_path=strcat(file_path,'\');

global file
file=file_path;

global img_path_list 
img_path_list= dir(strcat(file_path,'*.jpg'));%获取该文件夹中所有jpg格式的图像

global img_num
img_num = length(img_path_list);%获取图像总数量

global j
j=1;

if img_num > 0 %有满足条件的图像
 
            image_name = img_path_list(j).name;% 图像名
            image =  imread(strcat(file,image_name));%读取图像
            axes1=image;
            imshow(axes1);
            
            j=j+1;
end
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to APP_GUI (see VARARGIN)

% Choose default command line output for APP_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes APP_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = APP_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global img_path_list 
global img_num
global j
global file
global Ease_Dang
global Diff_Dang
global Ease_Safe
global Diff_Safe
global count_diff_dang
global count_ease_dang

global count_error

pick= unidrnd(img_num)

if img_num > 0 %有满足条件的图像
 
            image_name = img_path_list(pick).name;% 图像名
            image =  imread(strcat(file,image_name));%读取图像
            axes1=image;
            imshow(axes1);
            
            j=j+1;
            
            cell_str = strsplit(image_name,'_'); 
            judge=str2num(cell_str{1,1}(1))
         if j>1   
            if judge==1 
                Diff_Dang(j-2)=1;
                Ease_Dang(j-2)=0;
                 Ease_Safe(j-2)=0;
                 Diff_Safe(j-2)=0;                
                count_diff_dang=count_diff_dang+1;
            elseif judge==2
                 Ease_Dang(j-2)=1;
                 Diff_Dang(j-2)=0;
                 Ease_Safe(j-2)=0;
                 Diff_Safe(j-2)=0;                 
                 count_ease_dang=count_ease_dang+1;
            else
                 Ease_Dang(j-2)=0;
                 Diff_Dang(j-2)=0; 
                 Ease_Safe(j-2)=0;
                 Diff_Safe(j-2)=0;                 
                 count_error=count_error+1
            end
         end
         assignin('base','Diff_Dang',Diff_Dang)
         assignin('base','Ease_Dang',Ease_Dang)
         assignin('base','Diff_Safe',Diff_Safe)
         assignin('base','Ease_Safe',Ease_Safe)        
end

 

% [filename pathname] =uigetfile({'*.jpg';'*.png';'*.*'},'打开图片');


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img_path_list 
global img_num
global j
global file
global Ease_Safe
global Diff_Safe
global Ease_Dang
global Diff_Dang

global count_diff_safe
global count_ease_safe

global count_error
pick= unidrnd(img_num)
if img_num > 0 %有满足条件的图像
 
            image_name = img_path_list(pick).name;% 图像名
            image =  imread(strcat(file,image_name));%读取图像
            axes1=image;
            imshow(axes1);
            
            j=j+1;
            
            cell_str = strsplit(image_name,'_'); 
            judge=str2num(cell_str{1,1}(1))
         if j>1   
            if judge==3 
                Diff_Safe(j-2)=1;
                Ease_Safe(j-2)=0;
                Ease_Dang(j-2)=0;
                Diff_Dang(j-2)=0; 
                count_diff_safe=count_diff_safe+1;
            elseif judge==4
                 Ease_Safe(j-2)=1;
                 Diff_Safe(j-2)=0;
                 Ease_Dang(j-2)=0;
                 Diff_Dang(j-2)=0;                
                 count_ease_safe=count_ease_safe+1;
            else
                 Ease_Safe(j-2)=0;
                 Diff_Safe(j-2)=0;   
                 Ease_Dang(j-2)=0;
                 Diff_Dang(j-2)=0; 
                 count_error=count_error+1
            end
         end
         assignin('base','Diff_Safe',Diff_Safe)
         assignin('base','Ease_Safe',Ease_Safe)
         assignin('base','Diff_Dang',Diff_Dang)
         assignin('base','Ease_Dang',Ease_Dang)        
        
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global j
global count_diff_dang
global count_ease_dang
global count_diff_safe
global count_ease_safe
global count_error

error_rate=count_error/(j-2);
a=['Error Rate：' num2str(error_rate)]
set(handles.edit2,'string',a);












% count_diff_dang=0
% count_ease_dang=0
% count_diff_safe=0
% count_ease_safe=0
% count_error=0
% for i=1:1:j-2
%     if Diff_Dang(i)==1
%         count_diff_dang=count_diff_dang+1;
%     elseif Ease_Dang(i)==1
%         count_ease_dang=count_ease_dang+1;
%     elseif Diff_Safe(i)==1
%         count_diff_safe=count_diff_safe+1; 
%     elseif Ease_Safe(i)==1
%         count_ease_safe=count_ease_safe+1; 
%     else 
%         count_error=count_error+1;
%     end
% end
% txt_diff_dang=['正确检测出的危险品（难）数量：' num2str(count_diff_dang)];
% txt_ease_dang=['正确检测出的危险品（易）数量：' num2str(count_ease_dang)];
% txt_diff_safe=['正确检测出的安全品（难）数量：' num2str(count_diff_safe)];
% txt_ease_safe=['正确检测出的安全品（易）数量：' num2str(count_ease_safe)];
% txt_error=['检测错误的数量：' num2str(count_diff_dang)]



% 
% set(handles.edit2,'string',a);
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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
