% matthew Pahayo
% main.m
clc
clear all
close all
 
format longg

% [a,b,Pic,tauC,mdotcorr2,etaC,spdLine,M,tauT,Pit,G,del] = ...
%     Match(1,1,1,.85)

% 
syms x

p=partC;
% % for k = 1:5
% %     for i = 1:8
% %         [M0,thrust,RPM,spill] = p.thrustM(30742.5,229.365,1/5*k,i)
% %         sz = 15;
% %         c = 20*i;
% %         if M0<2.4 && M0>0
% %             hold on
% %             scatter(M0,thrust,sz,c,'filled')
% %             hold off
% %         end
% %     end
% % end
% % grid on
% % xlabel('M0')
% % ylabel('Thrust (N)')
% % title('Thrust vs M0')
% 
% for k = 1:5
%     for i = 1:8
%         [M0,thrust,RPM,spill,Tt4] = p.thrustM(57728.3,258.9,1/5*k,i)
%         sz = 15;
%         c = i;
%         if M0<2.4 && M0>0 &&Tt4<1800 && RPM<66000
%             hold on
%             scatter(M0,RPM,sz,c,'filled')
%             hold off
%         end
%     end
% end
% grid on
% xlabel('M0')
% ylabel('RPM')
% title('RPM vs M0')
% 
for k = 1:5
    for i = 1:8
        [M0,thrust,RPM,spill,Tt4] = p.thrustM(101325,288,1/5*k,i)
        sz = 15;
        c = k;
        if M0<2.4 && M0>0 &&Tt4<1800 && RPM<66000
            hold on
            scatter(M0,spill,sz,c,'filled')
            hold off
        end
    end
end
grid on
xlabel('M0')
ylabel('Spillage [abs(mdotd-mdot) (kg/s)]')
title('Spillage vs M0')
