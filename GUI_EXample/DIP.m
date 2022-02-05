clc; close all , clear all;
call1=['thresholding'];
call2=['Neg'];
call3=['powerT'];
call4=['contrast'];
callhisto=['histo'];
calllog=['log'];
Median=['MEdian'];
call5=['lapl'];
call7=['average'];

% ===============================
  btx=50;  
% The text 
% Create user interface control.
 text = uicontrol( ...
   'Style', 'text','Units', 'pixels','FontSize',20,'FontWeight', 'normal', ...
   'FontName', 'ZapfChan MdIt BT', ...
   'String', 'PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS', ...
   'Visible', 'on', ...
   'Background',[1 1 1],'Foreground',[0 0 .9], ...
   'Position',[435 520 400 100],'Tag', 'return','Callback', 'gcbf');

 text = uicontrol( ...
   'Style', 'text','Units', 'pixels','FontSize',13,'FontWeight', 'normal', ...
   'FontName','ZapfChan MdIt BT', ...
   'String', 'Simple GUI for some Image Processing techniques Done by Yusri Al-Sanaani', ...
   'Visible', 'on', ...
   'Background',[1 1 1],'Foreground',[0 0 0], ...
   'Position',[435 420 400 100],'Tag', 'return','Callback', 'gcbf');

% ===============================
% The Contrsat stretching button
Contrast=uicontrol( ...
   'BusyAction','Queue','Interruptible','off',...
   'Style','pushbutton', ...
   'Units','pixels', ...
   'Position',[btx+400 320 120 40],... 
   'String','Contrast#1', ...
   'Enable', 'on', ...
   'Callback',call4);
% ===============================
% The Contrsat stretching button
Contrsat=uicontrol( ...
   'BusyAction','Queue','Interruptible','off',...
   'Style','pushbutton', ...
   'Units','pixels', ...
   'Position',[btx+400 280 120 40],... 
   'String','Contrsat#2', ...
   'Enable', 'on', ...
   'Callback',call1);
% The Contrsat stretching  button
Contrast=uicontrol( ...
   'BusyAction','Queue','Interruptible','off',...
   'Style','pushbutton', ...
   'Units','pixels', ...
   'Position',[btx+400 240 120 40],... 
   'String','Contrast#3', ...
   'Enable', 'on', ...
   'Callback',callhisto);
%====================================
% The negative button
Negative=uicontrol( ...
   'BusyAction','Queue','Interruptible','off',...
   'Style','pushbutton', ...
   'Units','pixels', ...
   'Position',[btx+525 320 120 40],... 
   'String','Negative Image', ...
   'Enable', 'on', ...
   'Callback',call2);
%====================================
% The laplacian filter button
laplaciaN=uicontrol( ...
   'BusyAction','Queue','Interruptible','off',...
   'Style','pushbutton', ...
   'Units','pixels', ...
   'Position',[btx+525 280 120 40],... 
   'String','Laplacian Filter', ...
   'Enable', 'on', ...
   'Callback',call5);
%=========================================
% The Log Trans. button
LoG=uicontrol( ...
   'BusyAction','Queue','Interruptible','off',...
   'Style','pushbutton', ...
   'Units','pixels', ...
   'Position',[btx+525 240 120 40],... 
   'String','Log Trans.', ...
   'Enable', 'on', ...
   'Callback',calllog);
%=========================================
% The Power Trans.
power=uicontrol( ...
   'BusyAction','Queue','Interruptible','off',...
   'Style','pushbutton', ...
   'Units','pixels', ...
   'Position',[btx+650 320 120 40],... 
   'String','Power Trans.', ...
   'Enable', 'on', ...
   'Callback',call3);
%=========================================
% The average filter
Average=uicontrol( ...
   'BusyAction','Queue','Interruptible','off',...
   'Style','pushbutton', ...
   'Units','pixels', ...
   'Position',[btx+650 280 120 40],... 
   'String','Average Filter', ...
   'Enable', 'on', ...
   'Callback',call7);
%=========================================
% The median filter button
Median=uicontrol(...
   'Style','pushbutton', ...
   'Units','pixels', ...
   'Position',[btx+650 240 120 40], ...
   'Enable','on', ...
   'String','Median Filter ', ...
   'Callback',Median);
%==================================================
% The Close button
Close= uicontrol( ...
   'BusyAction','Queue','Interruptible','off',...
   'Style','pushbutton', ...
   'Units','pixels', ...
   'Position',[btx+525 190 120 40],... 
   'String','Close', ...
   'Enable', 'on', ...
   'Callback','close(gcbf)');








    
