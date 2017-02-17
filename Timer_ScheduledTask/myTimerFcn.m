function myTimerFcn(src,evt,params)
% myTimerFcn(src,evt,params)  My timer callback function
%
% Inputs:
%   src
%     Reference to the timer object triggering this callback
%   evt
%     Reserved for event data
%   params
%     Parameters supplied by the user at assignment of timer.TimerFcn.

% Display a simple elapsed time message
timeSinceInit = (now-params.nowInit)*60*60*24; % s
fprintf('It''s been % 6.1f seconds since initialization.\n',...
  timeSinceInit);

% Optionally do some work on a MyoMex object ...
% countEMG = size(params.myMyoMex.myoData.emg_log,1);
% fprintf('There are now %d EMG samples.\n',countEMG);

end