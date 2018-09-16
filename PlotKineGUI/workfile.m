%% workfile.m
clear all; close all; clc;

hFigure = figure;
hAxes = axes('parent',hFigure,...
  'title','Serial RR',...
  'xticklabel',[],'yticklabel',[],'xtick',[],'ytick',[],'xcolor',[1,1,1],'ycolor',[1,1,1]);

length = [2.5,1.5,1]; % must supply a vector a link lengths
theta = [...
  linspace(0,2*pi,100)',...
  linspace(0,4*pi,100)',...
  linspace(0,6*pi,100)'];
handles.axes = hAxes;


%% init the plot with initial configuration

handles = plot3Link(handles,theta(1,:),length,true);


%% update the plot with all configurations

for ii=2:size(theta,1)
  plot3Link(handles,theta(ii,:),length,false);
  drawnow; pause(0.04);
end

