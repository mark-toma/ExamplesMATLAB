function myTimerFcn(~,~,params)
% Copy all of the data logs 
md = params.myMyoMex.myoData;
timeIMU = md.timeIMU_log;
timeEMG = md.timeEMG_log;
quat = md.quat_log;
emg = md.emg_log;
% Compute logical indexes for the desired data
timeMax = max([timeIMU(end),timeEMG(end)]);
idxIMU = timeIMU > timeMax-params.duration;
idxEMG = timeEMG > timeMax-params.duration;
% Copy desired data
tq = timeIMU(idxIMU);
q = quat(idxIMU,:);
te = timeEMG(idxEMG);
e = emg(idxEMG,:);
% Update plots with desired data
for ii=1:length(params.hPlotQuat)
  set(params.hPlotQuat(ii),'xdata',tq,'ydata',q(:,ii));
end
for ii=1:length(params.hPlotEMG)
  set(params.hPlotEMG(ii),'xdata',te,'ydata',e(:,ii));
end
% update axes limits
set([params.hAxesQuat,params.hAxesEMG],...
  'xlim',timeMax-[params.duration,0]);

drawnow;
end 