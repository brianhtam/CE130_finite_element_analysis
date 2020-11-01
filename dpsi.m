for i = 1:size(p,1)
   d =u(i) * 0.2 * p; 
end
dpsiy = d(:,2);
dpsix = d(:,1);

    sigmaxz = 10 * (-p(:,2) + dpsix);
    sigmayz = 10 * (p(:,1) + dpsiy);