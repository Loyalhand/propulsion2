% main.m
clc
clear all
close all
format longg


T3 = 3000;
gam = 1.4;
etat = .9;
etac = etat;
sig = 5.67*10^-8;
eps = 1;

i = 1;
Table = zeros(700000,5);
A = zeros(700000,1);

for pic = 2:.01:3
    pit = 1/pic
    taut = 1-etat*(1-pit^((gam-1)/gam))
    T4 = T3*taut
    for Ta = 500:1700
        Table(i,1) = pic;
        Table(i,2) = Ta;
        T2 = (1+1/etac*(pic^((gam-1)/gam)-1))*Ta
        Table(i,3) = T2;
        eta = 1-(T4-Ta)/(T3-T2)
        Table(i,4) = eta;
        a = (1/eta-1)/(3*(T4-Ta)*sig*eps)*(1/Ta^3-1/T4^3)
        A(i,1) = a;
        Table(i,5) = a;
        i = i + 1
    end
end
m_dot = A
% Find row of smallest magnitude.  The value may be negative.
[smallestAbsValue, rowOfSmallestValue] = min(abs(m_dot))
% Get the actual value in case it's negative.
smallestValue = m_dot(rowOfSmallestValue)
% Find row of smallest positive number.
positiveIndexes = m_dot > 0;
[smallestPosValue, rowOfSmallestValue] = min(m_dot(positiveIndexes))