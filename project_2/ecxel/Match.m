% Match.m
function [a,b,Pic,tauC,mdotcorr2,etaC,spdLine,M,tauT,Pit,G,del] = Match(ps,pp,pm,etaC)
%Match function for project 2
%   will match components
gam =1.4;
mdotcorr4 = .107;
mdotcorr8 = .366;
etaT = .9; 
spdLined = 56493.268;
spdLine = ps*spdLined;
Picd = 15;
Pic = pp*Picd;
mdotcorr2d = .746;
mdotcorr2 = pm*mdotcorr2d;
tauC = 1 + ((Pic^((gam-1)/gam)-1)/etaC);
M = mdotcorr2/mdotcorr4/Pic*spdLine;
G = (spdLine/M)^2;
tauT = 1-1/G*(tauC-1);
Pit = (1-(1-tauT)/etaT)^(gam/(gam-1));
a = mdotcorr8/mdotcorr2;
b = sqrt(G*tauT)/Pic/Pit;
del = abs(a-b);
end