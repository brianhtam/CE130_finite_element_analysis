%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Fall2011,  Math228A,  Hw6,  Problem1,  by Houfu Fan,  SID:20817756
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [p,t,e] = pmesh(pv,hmax,nref)

% default input
% if nargin < 1
%     pv = [-sqrt(2)/2,0;sqrt(2)/2,0;0,1;-sqrt(2)/2,0];
%     hmax = 0.2; nref = 0;
% end

% refine the boundary
p = pv;
n = size(p,1); pos = zeros(2,1);
for i = 1:n-1
    % # of pieces for current segement
    L = norm((pv(i+1,:)-pv(i,:)));
    np = ceil(L/hmax); ptmp = zeros(np,2);
    if i == 1
        pos(1) = 1; pos(2) = np;
    else
        pos(1) = pos(2) + 1;
        pos(2) = pos(1) + np - 1;
    end
    for j = 1: np
        if j == 1
            ptmp(j,:) = pv(i,:);
        else
            ptmp(j,:) = ptmp(j-1,:) + (pv(i+1,:)-pv(i,:))/np;
        end
    end
    % nest ptmp into p
    p(pos(1):pos(2),:) = ptmp;
end

while(1)
    % triangulate the domain
    t = delaunayn(p);
    % Find the center of all the triangles
    N = size(t,1);
    Tc = zeros(N,2);
    for i = 1:N
        Tc(i,:) = (p(t(i,1),:)+p(t(i,2),:)+p(t(i,3),:))/3;
    end
    % get those triangles inside or on the edge of pv
    in = inpolygon(Tc(:,1),Tc(:,2),pv(:,1),pv(:,2));
    % remove theose outside the domain
    t = t(in,:); N = size(t,1);
    % find the triangle with the largest area
    areaT = zeros(N,1);
    for i = 1:N
        a = p(t(i,2),:) - p(t(i,1),:);
        b = p(t(i,3),:) - p(t(i,1),:);
        areaT(i) = 0.5*sqrt((a*a')*(b*b')-(a*b')^2);
    end
    % area, ind is the index of the element with largest area
    [area, ind] = max(areaT);
    if(area >= 0.5*hmax*hmax)
        % find the circumcenter
        p1 = p(t(ind,1),:); p2 = p(t(ind,2),:); p3 = p(t(ind,3),:);
        a = zeros(2,2); b = zeros(2,1);
        a(1,1) = 2*(p2(1)-p3(1)); a(1,2) = 2*(p2(2)-p3(2));
        a(2,1) = 2*(p2(1)-p1(1)); a(2,2) = 2*(p2(2)-p1(2));
        b(1) = (p2(1)+p3(1))*(p2(1)-p3(1)) + (p2(2)+p3(2))*(p2(2)-p3(2));
        b(2) = (p2(1)+p1(1))*(p2(1)-p1(1)) + (p2(2)+p1(2))*(p2(2)-p1(2));
        pc = (a\b)';
        p(end+1,:) = pc;
    else
        break;
    end
    
end
tplot(p,t), shg;
% refine the mesh nref times
for i = 1:nref
    % mid points for all the triangles
    pm1 = (p(t(:,1),:)+p(t(:,2),:))/2;
    pm2 = (p(t(:,1),:)+p(t(:,3),:))/2;
    pm3 = (p(t(:,2),:)+p(t(:,3),:))/2;
    pm = [pm1;pm2;pm3];
    % delete the repeated ones
    pm = unique(pm, 'rows');
    p = [p; pm];
    % delaunayn triangulation
    t = delaunayn(p);
    % Find the center of all the triangles, in order to check whether or
    % not the triangle is inside the domain
    N = size(t,1);
    Tc = zeros(N,2);
    for j = 1:N
        Tc(j,:) = (p(t(j,1),:)+p(t(j,2),:)+p(t(j,3),:))/3;
    end
    % get those triangles inside or on the edge of pv
    in = inpolygon(Tc(:,1),Tc(:,2),pv(:,1),pv(:,2));
    % remove theose outside the domain
    t = t(in,:);
end
% plot the mesh
tplot(p,t), shg;
% get the boundary nodes vector
e = boundary_nodes(t);
end