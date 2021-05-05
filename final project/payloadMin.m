clc
clear all
close all
y = 1
for i = 1:5
    sig0 = i*100+100;
    for j = 1:5
        B = j*.2+.6;
        for k = 1:3
            eta = k*.1+.6;
            height = .05;
            width = .05 ;
            steps = 20;
            cf = 0.002;
%             eta = .9;
            Tw = 220
            w = 0;
            h = 0;
            A = ones(1,steps)*height*width;
            % for convective heat transfer set ht to 1 else set it to 0
            ht = 1;
            l = 1;
%             sig0 = 600;
%             B = .8;
            R = 4125;
            gam =1.4;


            M = 1.2;
            Pi = 100000;
            Ti = 320;

            [P,T,Pt2,Tt2,rho,u,M,thrust,F,mdot0,mdot,V,Ic,Powerc,forcec] = MHD(Pi,Ti,M,cf,Tw,eta,w,h,ht,A,l,sig0,B,steps,R,gam,height,width);


            Gm1 = 1/M(end)*(2/(gam+1)*(1+(gam-1)/2*M(end)^2))^((gam+1)/(2*(gam-1)))
            Gm2 = Gm1 * 100

            syms X
            func = symfun(1/X*(2/(gam+1)*(1+(gam-1)/2*X^2))^((gam+1)/(2*(gam-1)))-Gm2,X)
            Me = rootFind.newRap(func,7)
            Te = Tt2(end)/(1+(gam-1)/2*Me^2)
            ue = Me*sqrt(gam*R*Te)


            ml = me(B,sig0,eta)
            mp = exp(10000/ue)*(ml+500)-(ml+500)
            m0(y,1) = ml+500+ mp
            maxTt(y,1)=Tt2(end)
            s(y,1)=sig0
            b(y,1)=B
           e(y,1)= eta
            y = y+1
        end
    end
end

function m_e = me(B,sig0,eta)
    N_B = (B-.6)/.2;
    N_sig0 = (sig0-100)/100;
    N_eta = (1-eta)/.1;
    m_e = 1000*1.2^(N_B-1)*1.2^(N_sig0-1)*2^(N_eta-1);
end