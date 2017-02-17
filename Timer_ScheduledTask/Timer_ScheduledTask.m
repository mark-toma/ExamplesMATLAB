%% Timer_ScheduledTask
% This script shows how to create a timer to schedule a repetative task
% using a built-in timer object. This particular example is useful for
% adapting to applications that require operations to be performed
% periodically independent of other code execution. This is like a
% "set-it-and-forget-it" approach to running statements in a loop.

%% Clean up and initialize workspace

% clean up
clear all; close all; clc;
delete(timerfindall); % forcibly delete all timers

% initialize some parameters
RATE = 10; % Hz 
PERIOD = 1/RATE; % s


%% Create a timer object
% Here we initialize a timer object that will fire callbacks every PERIOD
% seconds at a fixed rate while it's running. We also pass user-defined
% data in params as a third input argument to the callback. The params
% struct that is passed in the function handle below is then accessible in
% the scope of myTimerFcn() every time it executes.

params.nowInit = now;
params.magicString = 'magic';
% params.myMyoMex = MyoMex();
tmr = timer(...
  'tag','timer_Timer_ScheduledTask',...
  'executionmode','fixedrate',...
  'period',PERIOD,...
  'timerfcn',@(src,evt)myTimerFcn(src,evt,params));


%% Start timer
% Start the timer to begin firing timer callback events. Once the timer is
% running, call stop() on the timer when done.

start(tmr);


%% Stop timer
% Stop the timer to halt firing timer events. You can optionally start it
% up again if desired. Otherwise, 

stop(tmr);


%% Clean up timer
% When you're done using the timer, make sure to delete it! You can use the
% function timerfindall() to find orphaned timer objects if you
% accidentally cleared the timer without deleting it.

delete(tmr);
clear tmr

