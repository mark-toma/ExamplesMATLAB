function handles = plot3Link(handles,theta,length,initPlot)

% compute FK
p = zeros(2,4); px = p(1,:); py = p(2,:);
for ii=1:3
  px(ii+1) = px(ii) + length(ii)*cos(theta(ii));
  py(ii+1) = py(ii) + length(ii)*sin(theta(ii));
end

if initPlot
  totalLength = sum(length);
  xlims = 1.1*totalLength*[-1,1]+px(1);
  ylims = 1.1*totalLength*[-1,1]+py(1);
  cs = 'rgb';
  set(handles.axes,'nextplot','add','xlim',xlims,'ylim',ylims);
  for ii=1:3
    handles.links(ii) = plot(handles.axes,...
      px(ii:ii+1),py(ii:ii+1),cs(ii),...
      'linewidth',4);
  end
else 
  % update plot
  for ii=1:3
    set(handles.links(ii),...
      'xdata',px(ii:ii+1),...
      'ydata',py(ii:ii+1));
  end
end





end