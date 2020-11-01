close all; clear all; clc;
hmax=0.2;
for pv={[-sqrt(2)/2,0;sqrt(2)/2,0;0,1;-sqrt(2)/2,0]}
    errors=poiconv(pv{1},hmax,3)
    loglog(hmax./2.^(0:2),errors), grid;
    rate=log2(errors(end-1))-log2(errors(end))
    xlabel('Size of Elements')
    ylabel('Error')
end