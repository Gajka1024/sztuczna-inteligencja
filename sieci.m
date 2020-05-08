lw1 = 12;   %24 wagi
lw2 = 6;    %72 wagi
lw3 = 1;    %102 wagi
minmax = [-4 4 ; -4 4];
siec = newff(minmax, [lw1,lw2,lw3],{'tansig', 'tansig', 'purelin'});
siec.IW{1} = randn(lw1,2);
siec.LW{2,1} = randn(lw2, lw1)
siec.LW{3,2} = randn(lw3, lw2);

%Dodanie wag wejœcia sta³ego
siec.b{1} = randn(lw1,1);
siec.b{2} = randn(lw2,1);
siec.b{3} = randn(lw3,1);

% y = sim(siec, [2;3])

% x = rand(2, 100);
x = -4:0.1:4;
%nndisp(x,x,siec)