%Siec Neuronowa2
clear all
lw1=3
lw2=1

minmax=[0 6;0 6]
wsp = 50;

Siec=newff(minmax,[lw1,lw2],{'tansig','tansig'});
Siec.IW{1}=[0.*wsp 1.*wsp;1.*wsp 0;-2.*wsp 1.*wsp];
Siec.LW{2,1}=[1.*wsp 1.*wsp 1.*wsp];

Siec.b{1}=[-2.*wsp;-1.*wsp;0];
Siec.b{2}=-2.*wsp;


x=0:0.1:6;
nndisp(x,x,Siec)
