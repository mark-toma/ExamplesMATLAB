%% Timer_ScheduledTask_Myo.m

% clean up
if exist('mm','var')  && isa(mm,'MyoMex'), delete(mm);  end
if exist('tmr','var') && isa(tmr,'timer'), delete(tmr); end
clear all; close all; clc;

% initialize some parameters
RATE = 10; % Hz 
PERIOD = 1/RATE; % s


%% Init figure with two axes and plot objects for each scalar variable we 
% desire to plot. Notice that handles to plot graphics objects we wish 
% to update are stored in the params structure
figure;
hAxesQuat = subplot(2,1,1,'nextplot','add'); % axes for quaternion data
params.hAxesQuat = hAxesQuat;
params.hPlotQuat(1,1) = plot(hAxesQuat,0,0,'r');
params.hPlotQuat(1,2) = plot(hAxesQuat,0,0,'g');
params.hPlotQuat(1,3) = plot(hAxesQuat,0,0,'b');
params.hPlotQuat(1,4) = plot(hAxesQuat,0,0,'k');
hAxesEMG = subplot(2,1,2,'nextplot','add'); % axes for emg
params.hAxesEMG = hAxesEMG;
params.hPlotEMG(1,1) = plot(hAxesEMG,0,0,'r');
params.hPlotEMG(1,2) = plot(hAxesEMG,0,0,'g');
params.hPlotEMG(1,3) = plot(hAxesEMG,0,0,'b');
params.hPlotEMG(1,4) = plot(hAxesEMG,0,0,'k');
params.hPlotEMG(1,5) = plot(hAxesEMG,0,0,':r');
params.hPlotEMG(1,6) = plot(hAxesEMG,0,0,':g');
params.hPlotEMG(1,7) = plot(hAxesEMG,0,0,':b');
params.hPlotEMG(1,8) = plot(hAxesEMG,0,0,':k');


%% Configure plot updates by passing more params

params.duration = 5; % s - plot the most recent X seconds of data
mm = MyoMex(); % pass MyoMex in params
params.myMyoMex = mm;


%% Create a timer object

tmr = timer(...
  'tag','timer_Timer_ScheduledTask',...
  'executionmode','fixedrate',...
  'period',PERIOD,...
  'timerfcn',@(src,evt)myTimerFcn(src,evt,params));


%% Start timer

start(tmr);


%% Stop timer

stop(tmr);


%% Clean up timer
% When you're done using the timer, make sure to delete it! You can use the
% function timerfindall() to find orphaned timer objects if you
% accidentally cleared the timer without deleting it.

delete(tmr);
delete(mm);
clear mm tmr
close all

