lw1 = 3;   %24 wagi
lw2 = 1;    %72 wagi

minmax = [0 6 ; 0 6];
siec = newff(minmax, [lw1,lw2],{'tansig', 'tansig', 'purelin'});
wsp = 50;
siec.IW{1} = wsp * [1 0  ; 0 1 ; -2 -1];
siec.LW{2,1} = wsp *[1; 1; 1];

%Dodanie wag wejœcia sta³ego
siec.b{1} = [-2;-1; 9];
siec.b{2} = [-2];


% y = sim(siec, [2;3])

% x = rand(2, 100);
x = 0-4:0.1:6;
nndisp(x,x,siec)