clear all
a = sqrt(2)/2;  L = 1; T = 1;  G = 50;
dtdz = 15*sqrt(3)*T/(G*a^4);
theta = 0.2;
thetad = theta*180/pi;


x = [-a,0,a];
y = [0,1,0];

% draw original triangle
hl1 = line([x(1) x(2) x(3) x(1)],[y(1),y(2),y(3),y(1)]);
set(hl1,'Color','k','LineWidth',2)
hold on


% create the twisted shape
xx = x.*cos(theta) - y.*sin(theta);
yy = x.*sin(theta) + y.*cos(theta);

% draw the twisted shape
hl2 = line([xx(1) xx(2) xx(3) xx(1)],[yy(1),yy(2),yy(3),yy(1)]);
set(hl2,'Color','r','LineWidth',2,'LineStyle','--')

hold off
xlabel('x')
ylabel('y')
title('Twist in the beam')
axis equal
fprintf('Angle of twist [deg]'),disp(thetad)

xp = linspace(-a,0,a);
yp = a/3 - (xp/2); % equation of the top line

xw = [];  yw = [];
j = 21;ii = 1;
for k = 1:10
    dely = 2*yp(k)/(j-1);
    x1 = xp(k) *ones(1,j);
    y1 = linspace(yp(k),-yp(k),j);
    xw = [xw,x1];
    yw = [yw,y1];
%     for i = 1:j
%         if k < 11
%             dely =2*yp(k)/(j-1);
%         end
%             xw(ii)= xp(k);
%             yw(ii) = yw(ii) - dely;
%             ii = ii + 1;
%     end
    j = j - 2;
end
% disp([xw' yw'])
xw = [xw,xp(end)];  % xw are points where the warp will be calculated
yw = [yw,yp(end)];  %  yw will be the points where the warp will be calculated

% calculate warp
syms xs ys
wxy = dtdz*(ys^3 - 3*xs^2*ys)/(2*a);
wv = subs(wxy,{xs,ys},{xw,yw});
wv = double(wv);

xlin = linspace(-a,0,a);
ylin = linspace(0,1,0);
[X,Y] = meshgrid(xlin,ylin);
fg2 = figure;
% F = scatteredInterpolant(xw',yw',wv','natural');
F = TriScatteredInterp(xw',yw',wv','natural');
qz = F(X,Y);
surface(X,Y,qz)
axis tight
fg2 = pcolor(X,Y,qz);
set(fg2,'FaceColor','interp', ...
    'FaceLighting','phong', ...
    'BackFaceLighting','lit', ...
    'AmbientStrength',.3, ...
    'DiffuseStrength',.1,...
    'SpecularStrength',.9, ...
    'SpecularExponent',25, ...
    'EdgeColor','none', ...
    'FaceAlpha',1)
view(2)
hold on
xlabel('x')
ylabel('y')
title('Warping : Analytical')
colorbar
axis square