function varargout = Tag_for_pic(varargin)
% TAG_FOR_PIC MATLAB code for Tag_for_pic.fig
%      TAG_FOR_PIC, by itself, creates a new TAG_FOR_PIC or raises the existing
%      singleton*.
%
%      H = TAG_FOR_PIC returns the handle to a new TAG_FOR_PIC or the handle to
%      the existing singleton*.
%
%      TAG_FOR_PIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TAG_FOR_PIC.M with the given input arguments.
%
%      TAG_FOR_PIC('Property','Value',...) creates a new TAG_FOR_PIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tag_for_pic_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tag_for_pic_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tag_for_pic

% Last Modified by GUIDE v2.5 14-Jan-2019 01:01:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tag_for_pic_OpeningFcn, ...
                   'gui_OutputFcn',  @Tag_for_pic_OutputFcn, ...
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


% --- Executes just before Tag_for_pic is made visible.
function Tag_for_pic_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tag_for_pic (see VARARGIN)

% Choose default command line output for Tag_for_pic
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Tag_for_pic wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Tag_for_pic_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

file_path = uigetdir('*.*','请选择文件夹');
file_path=strcat(file_path,'\');
assignin('base','File_path',file_path)
img_path_list = dir(strcat(file_path,'*.jpg'));%获取该文件夹中所有jpg格式的图像

img_num = length(img_path_list);%获取图像总数量
assignin('base','imgnum',img_num)
if img_num > 0 %有满足条件的图像
        for j = 1:img_num %逐一读取图像
            image_name = img_path_list(j).name;% 图像名
            image =  imread(strcat(file_path,image_name));%读取图像
            assignin('base','image_name',image_name)
            newname=strcat('1_', image_name);
            eval(['!rename' 32 strcat(file_path,image_name) 32 newname ]); 
            img_path_list = dir(strcat(file_path,'*.jpg'))
            status = strcmp(img_path_list(j).name, newname);
    if status == 1
        disp([' Difficult recognized Dangerous package was marked ', newname])
    else
        disp([ ' Difficult recognized Dangerous package was fialed'])
    end
end

        end

% [filename pathname] =uigetfile({'*.jpg';'*.png';'*.*'},'打开图片');


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
file_path = uigetdir('*.*','请选择文件夹');
file_path=strcat(file_path,'\');
assignin('base','File_path',file_path)
img_path_list = dir(strcat(file_path,'*.jpg'));%获取该文件夹中所有jpg格式的图像

img_num = length(img_path_list);%获取图像总数量
assignin('base','imgnum',img_num)
if img_num > 0 %有满足条件的图像
        for j = 1:img_num %逐一读取图像
            image_name = img_path_list(j).name;% 图像名
            image =  imread(strcat(file_path,image_name));%读取图像
            assignin('base','image_name',image_name)
            newname=strcat('2_', image_name);
            eval(['!rename' 32 strcat(file_path,image_name) 32 newname ]); 
            img_path_list = dir(strcat(file_path,'*.jpg'))
            status = strcmp(img_path_list(j).name, newname);
    if status == 1
        disp([' Easy recognized Dangerous package was marked ', newname])
    else
        disp([ ' Easy recognized Dangerous package was fialed'])
    end
end

        end
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
file_path = uigetdir('*.*','请选择文件夹');
file_path=strcat(file_path,'\');
assignin('base','File_path',file_path)
img_path_list = dir(strcat(file_path,'*.jpg'));%获取该文件夹中所有jpg格式的图像

img_num = length(img_path_list);%获取图像总数量
assignin('base','imgnum',img_num)
if img_num > 0 %有满足条件的图像
        for j = 1:img_num %逐一读取图像
            image_name = img_path_list(j).name;% 图像名
            image =  imread(strcat(file_path,image_name));%读取图像
            assignin('base','image_name',image_name)
            newname=strcat('3_', image_name);
            eval(['!rename' 32 strcat(file_path,image_name) 32 newname ]); 
            img_path_list = dir(strcat(file_path,'*.jpg'))
            status = strcmp(img_path_list(j).name, newname);
    if status == 1
        disp([' Difficult recognized Safe package was marked ', newname])
    else
        disp([ ' Difficult recognized Safe package was fialed'])
    end
end

        end
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
file_path = uigetdir('*.*','请选择文件夹');
file_path=strcat(file_path,'\');
assignin('base','File_path',file_path)
img_path_list = dir(strcat(file_path,'*.jpg'));%获取该文件夹中所有jpg格式的图像

img_num = length(img_path_list);%获取图像总数量
assignin('base','imgnum',img_num)
if img_num > 0 %有满足条件的图像
        for j = 1:img_num %逐一读取图像
            image_name = img_path_list(j).name;% 图像名
            image =  imread(strcat(file_path,image_name));%读取图像
            assignin('base','image_name',image_name)
            newname=strcat('4_', image_name);
            eval(['!rename' 32 strcat(file_path,image_name) 32 newname ]); 
            img_path_list = dir(strcat(file_path,'*.jpg'))
            status = strcmp(img_path_list(j).name, newname);
    if status == 1
        disp([' Easy recognized Dangerous package was marked ', newname])
    else
        disp([ ' Easy recognized Dangerous package was fialed'])
    end
end

        end
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
