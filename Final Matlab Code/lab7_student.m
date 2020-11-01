clear all

% Set the number of elements 
nel = 3;

% Number of Ritz functions
n   = nel + 1;

% Set parameters USCS
l        = 2;          % Length (in)
AE       = 30e6;       % Area x Modulus (lbf)
b        = 4000;       % Distributed Load (lbf/in)
Fapp     = -2000;      % Right-end force (lbf)
u0       = 0.03;       % Left-end displacement (in)
dx       = l/nel;      % Element size

% Exact Solution for the lab problem
xe = linspace(0,l,100);
ue = (1/AE)*(-b*xe.*xe/2 + (Fapp + b*l)*xe + u0*AE);

% Initialize storage and zero it out
K = spalloc(n,n,3*n);
F = zeros(n,1);
c = zeros(n,1);
 
% Compute K and F by looping over the elements
% Add your expressions here
for L = 1:nel
    
    ke =  [AE/dx -AE/dx;-AE/dx AE/dx]; % Complete with your two-by-two expression here
    Fe =  [1/2 * dx * b;b * 1/2*dx];% Complete with your two-by-one expression here
    
    idx = [L L+1];
    
    K(idx,idx) =  K(idx,idx) + ke;% Complete
    F(idx)     =  F(idx) + Fe;% Complete
end

% Add in contribution for point force 
F(n) =  F(n)+Fapp;  % Complete


% Set up driven and free degrees of freedom (same idea as with the truss)
idd = 1;
idf = 2:n;

% Imposed values
c(1) = u0;

% Perform the solve
Kff =  K(idf,idf); 
Kfd =  K(idf,idd);% Complete
Kdf =  K(idd,idf);% Complete
Kdd =  K(idd,idd);% Complete
Ff  =  F(idf);% Complete

c(idf) =  Kff\(Ff-Kfd*c(idd));% Complete
F(idd) =  Kdf*c(idf)+Kdd*c(idd);% Complete


% Plot exact versus approximate solution
xa = linspace(0,l,n)';
fh=plot(xe,ue,xa,c);
set(fh,'LineWidth',2);
legend('Exact Solution','Ritz Solution','Location','NorthWest');

