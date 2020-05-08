function dd=nndisp(x1,x2,net);

% rysowanie powierzchni dwuwejœciowej sieci neuronowej
clear z
[xx1,xx2]=meshgrid(x1,x2);
z = xx1;
z(:) = sim(net,[xx1(:)';xx2(:)']);
%z = sim(net,[xx1(:)';xx2(:)']);
disp(size(z))
opengl neverselect

surf(x1,x2,z)
axis tight
%axis([x1(1) x1(end) x2(1) x2(end) -1 1])
%print -deps2 surf1_3
pause
mesh(x1,x2,z)
axis tight
% print -deps2 rysunek
pause
contour(x1,x2,z,20)
axis equal
axis([x1(1) x1(end) x2(1) x2(end)])
%print -deps2 surf2_3
echo on
%nacisnij cos dla zakonczenia wyswietlania wykresu
echo off
pause
close
