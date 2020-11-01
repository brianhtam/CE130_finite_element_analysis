clear all; close all; clc;
% Square, Dirichlet left/bottom
%pv=[0,0;1,0;1,1;0,1;0,0];
%[p,t,e]=pmesh(pv,0.2,0);
%e=e(p(e,1)==0 | p(e,2)==0);
%u=fempoi(p,t,e);
%figure; tplot(p,t,u)

% Circle, all Dirichlet
n=32; phi=2.0*pi*(0:n)'/n;
pv=[cos(phi),sin(phi)];
[p,t,e]=pmesh(pv,2*pi/n,0);
u=fempoi(p,t,e);
figure; tplot(p,t,u)

% Ellipse, all Dirichlet
%a=2;
%b=1;
%n=32; phi=2.0*pi*(0:n)'/n;
%pv=[a*cos(phi),b*sin(phi)];
%[p,t,e]=pmesh(pv,2*pi/n,0);
%u=fempoi(p,t,e);
%figure; tplot(p,t,u)

% Triangle, all Dirichlet
%a= sqrt(2)/2;
%pv=[-a,0;a,0;0,1;-a,0];
%[p,t,e]=pmesh(pv,0.2,0);
%u=fempoi(p,t,e);
%figure; tplot(p,t,u)

 %Complex polygon geometry, mixed Dirichlet/Neumann
%x=(0:.1:1)';
%y=.1*cos(10*pi*x);
%pv=[x,y; .5,.6;0,0.1];
%[p,t,e]=pmesh(pv,0.05,0);
%e=e(p(e,2)>=.6-abs(p(e,1)-.5));
%u=fempoi(p,t,e);
%figure; tplot(p,t,u)