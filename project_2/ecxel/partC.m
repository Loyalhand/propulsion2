classdef partC
    % partC class 
    
    properties (Constant)
        data = xlsread('part b copy.xlsx');
        mdotfueld = .0174;
        A8 = .1515;
        h = 4.45*10^7;
        gam = 1.4;
        Tstp = 288;
        Pstp = 101325;
        cp = 1004.5;
        R = 287;
        RPMd = 56493.268;
        mdotd = 1.0609;
    end
    
    methods (Static)
        function [M0,thrust,RPM,spill,Tt4] = thrustM(P0,T0,perc,i)
            syms x
            f(x) = P0*(1-.015*x^2)*(1+(partC.gam-1)/2*x^2)^(partC.gam/(partC.gam-1))/partC.Pstp*...
                sqrt(partC.Tstp)*partC.data(i,4)*partC.cp*...
                sqrt(T0*(1+(partC.gam-1)/2*x^2))*(partC.data(i,10)-partC.data(i,3))-...
                partC.mdotfueld*perc*partC.h;
            M0 = newRap(f)
            if M0<2.4 && M0>0
            Pt2 = P0*(1-.015*M0^2)*(1+(partC.gam-1)/2*M0^2)^(partC.gam/(partC.gam-1));
            Pt4 = partC.data(i,2)*Pt2;
            Pt8 = Pt4*partC.data(i,9);
            P8 = Pt8/(1+(partC.gam-1)/2)^(partC.gam/(partC.gam-1));
            Tt2 = T0*(1+(partC.gam-1)/2*M0^2);
            Tt4 = partC.data(i,10)*Tt2
            Tt8 = Tt4*partC.data(i,8);
            T8 = Tt8/(1+(partC.gam-1)/partC.gam);
            mdot = partC.data(i,4)*Pt2/partC.Pstp/sqrt(Tt2/partC.Tstp)
            u8 = sqrt(partC.gam*partC.R*T8);
            u0 = M0*sqrt(partC.gam*partC.R*T0);
            thrust = mdot*(u8-u0)+(P8-P0)*partC.A8
            i
            perc
            RPM = partC.data(i,1)*partC.RPMd*sqrt(Tt2/partC.Tstp)
            spill = abs(mdot-partC.mdotd)
            
            else
                thrust = 0;
                RPM = 0;
                spill = 0;
                Tt4=0;
            end
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

