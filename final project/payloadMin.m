clc
clear all
close all
format longg

me(1,1,1)
m_e=zeros(75,1)
l = 1
for i = 1:5
    sig0 = i*100+100
    for j = 1:5
        B = j*.2+.6
        for k = 1:3
            eta = k*.1+.6
            m_e(l,1) = me(B,sig0,eta)
            l = l + 1
        end
    end
end

m_engine = min(m_e)
%sigo = 200
%B = .8
%eta = .9

function m_e = me(B,sig0,eta)
    N_B = (B-.6)/.2;
    N_sig0 = (sig0-100)/100;
    N_eta = (1-eta)/.1;
    m_e = 1000*1.2^(N_B-1)*1.2^(N_sig0-1)*2^(N_eta-1);
end
