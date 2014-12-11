function varargout = lame_gui(varargin)
% LAME_GUI MATLAB code for lame_gui.fig
%      LAME_GUI, by itself, creates a new LAME_GUI or raises the existing
%      singleton*.
%
%      H = LAME_GUI returns the handle to a new LAME_GUI or the handle to
%      the existing singleton*.
%
%      LAME_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAME_GUI.M with the given input arguments.
%
%      LAME_GUI('Property','Value',...) creates a new LAME_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lame_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lame_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lame_gui

% Last Modified by GUIDE v2.5 11-Dec-2014 08:16:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lame_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @lame_gui_OutputFcn, ...
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


% --- Executes just before lame_gui is made visible.
function lame_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lame_gui (see VARARGIN)

% Choose default command line output for lame_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lame_gui wait for user response (see UIRESUME)
% uiwait(handles.Lame);


% --- Outputs from this function are returned to the command line.
function varargout = lame_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit1.
function edit1_ButtonDownFcn(hObject, eventdata, handles)


% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    % Check for valild input
    n = str2double(get(handles.edit1,'String'));
    
    

        %% Generating Adjacency matrix of the regular polygon of n sides

        
        adjacency = get_adj_regular(n);


        %% Returning the number of triangulations
        Pn = get_catalan(n-2); 

        set(findobj('Tag','text6'),'Visible','on');
        set(findobj('Tag','text8'),'Visible','on');

        set(findobj('Tag','text8'),'String',int2str(Pn));
        disp('Number of triangulations: ');
        disp(Pn);

        %% Computing triangulations
        previous = [0 1 1;1 0 1;1 1 0];

        catalans = zeros(1,n-2);
        for i = 3:n
            catalans(i-2) = get_catalan(i-2);
        end


        for count = 4:n
        % one cycle of this loop should return triangulations of count sided
        % polygon, which should be equal to catalans(count-2)
            new = zeros(count,count,catalans(count-2));
            iterator = 1;
            for cat_count = 1:catalans(count-3)
            % one cycle of this loop should give all children of one of the
            % triangulation of count-1 sided polygon
                temp_adj = previous(:,:,cat_count);

                new(:,:,iterator) = tri_gen_1(temp_adj);
                iterator = iterator + 1;

                [number,mat] = tri_gen_3(temp_adj);
                for i = 1:number
                   new(:,:,iterator) = mat(:,:,i);
                   iterator = iterator+1;
                end

                new(:,:,iterator) = tri_gen_2(temp_adj);
                iterator = iterator + 1;


            end
            previous = new;
        end

        triangulations = previous;

        for i = 1:Pn
            cla(handles.axes1);
            adj = triangulations(:,:,i);

            set(handles.axes1,'Visible','On');



             L = length(adj);
            theta = (360/L);
            %temp = zeros(1,L);

            x = zeros(1,L);
            y = zeros(1,L);

            labels = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P'};


            for i = 1:L
                x(i) = cosd(i*theta);
                y(i) = sind(i*theta);
            end

            plot(handles.axes1,x,y,'rh');
            hold on
            for i=1:L
                text(handles.axes1,x(i),y(i),labels{i},'VerticalAlignment','bottom','HorizontalAlignment','right','fontWeight','bold');
            end
            for i=1:L
               temp = adj(i,:);
               for j=1:L
                  if (temp(j)~=0)
                     plot(handles.axes1,[x(i),x(j)],[y(i),y(j)],'b.-','LineWidth',2) ;
                  end
               end
            end

            set(handles.axes1,'Visible','On');

            set(findobj(gcf, 'type','axes'), 'Visible','off');
            pause(1);
            
            
        end

        set(handles.axes1,'Visible','On');
        
        

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('D:\Education\sem - V\descrete mathematics\matlab\Project\report.pdf');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('D:\Education\sem - V\descrete mathematics\matlab\Project\html\lame.html');
