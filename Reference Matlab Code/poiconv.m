%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Fall2011,  Math228A,  Hw6,  Problem3,  by Houfu Fan,  SID:20817756
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function errors = poiconv(pv, hmax, nrefmax)

% allocate the errors vector
errors = zeros(nrefmax,1);

% get the "exact" solution
[p,t,e] = pmesh(pv,hmax,nrefmax);
uexact = fempoi(p,t,e);

% loop for all the different sizes of meshes
for iref = 1:nrefmax
    % get the nref
    nref = iref-1;
    % get the mesh information
    [p,t,e] = pmesh(pv,hmax,nref);
    % calculate the displacement
    u = fempoi(p,t,e);
    % length of the vector
    np = length(u);
    % errors of iref-th case
    errors(iref) = max(abs(u-uexact(1:np)));
end

end