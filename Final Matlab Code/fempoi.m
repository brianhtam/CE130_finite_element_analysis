%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Fall2011,  Math228A,  Hw6,  Problem2,  by Houfu Fan,  SID:20817756
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function u = fempoi(p,t,e)

% size of the system
N = size(p,1); T = size(t,1);

% matrix allocation
A = sparse(N,N); b= zeros(N,1);
Ak = zeros(3,3); bk = zeros(3,1);

for i = 1:T
    % get the node coordinates of triangle k
    V = [1, p(t(i,1),1), p(t(i,1),2);
        1, p(t(i,2),1), p(t(i,2),2);
        1, p(t(i,3),1), p(t(i,3),2)];
    % area of the triangle(area = 1/2*|a x b|)
    %area = 0.5*abs((V(2,2)-V(1,2))*(V(3,3)-V(1,3))-(V(2,3)-V(1,3))*(V(3,2)-V(1,2)));
    area = 0.5*abs(det(V));
    % coefficients of the shape functions
    C = inv(V);
    % element stiffness matrix and force vector
    for ik = 1:3
        for jk = 1:3
            Ak(ik,jk) = C(2,ik)*C(2,jk) + C(3,ik)*C(3,jk);
        end
        bk(ik) = area/3;
    end

     % assembly, global stiffness and force vector
     A(t(i,:),t(i,:)) = A(t(i,:),t(i,:)) + Ak*area;
     b(t(i,:)) = b(t(i,:)) + bk;
 end
 
% enforce the essential boundary condition--penalty method
% for i = 1:length(e)
%    A(e(i),e(i)) = 1.0e30; b(e(i)) = 0; 
% end
 
for i = 1:length(e)
     for j = 1:N
         A(e(i),j) = 0; A(j,e(i)) = 0;
     end
    A(e(i),e(i)) = 1; b(e(i)) = 0; 
 end
  
% solve the system;
 u = A\b;

end