close all; clear all; clc;
hmax=0.15;
for pv={[0,0;1,0;1,1;0,1;0,0],[0,0;1,0;.5,.5;1,1;0,1;0,0]}
    errors=poiconv(pv{1},hmax,3)
    loglog(hmax./2.^(0:2),errors), grid;
    rate=log2(errors(end-1))-log2(errors(end))
end