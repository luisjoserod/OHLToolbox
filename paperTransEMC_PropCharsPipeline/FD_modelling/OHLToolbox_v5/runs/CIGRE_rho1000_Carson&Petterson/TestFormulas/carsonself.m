function [Z1,CI] = carsonself(h,r,f,con,er)
%
% carsonself computes the earth-return self impedance of an overhead
% conductor above earth. Since permittivity is included it can evaluate 
% also Sunde's result.  One of the parameters can also be vector of values.
%
% Author : T.P. Theodoulidis
% Date   : 21 March 2015
%
% Arguments
% h  : conductor height [m]
% r  : conductor radius [m]
% f  : frequency [Hz]
% con: earth conductivity [S/m]
% er : relative dielectric permittivity (er=0 gives Carson's result)
% Z1 : earth-return self-impedance [Ohm]
% CI : Carson's integral
%
% External routines called : StruveH1Y1 available from Matlab Central
%
m0=pi*4e-7;
e0=8.8541878176e-12;
omega=2*pi*f;
k=sqrt(1i*omega*m0.*(con+1i*omega*e0*er));
d1=r;
d2=2*h;
u=k*(2*h);
%
CI = 2*(pi/2./u).*(StruveH1Y1(u)-2/pi./u);
%
Z1 = 1i.*omega*m0/(2*pi)*(log(d2/d1)+CI);
%
