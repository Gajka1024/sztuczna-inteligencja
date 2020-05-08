A = rand(1, 10000)<0.6;
B = rand(1, 10000)<0.9;

C0 = rand(1,10000)<0.4;     % ~A i ~B
C1 = rand(1,10000)<0.6;     % ~A i B
C2 = rand(1,10000)<0.1;     % A i ~B
C3 = rand(1,10000)<0.9;     % A i B
C = ~A & ~B & C0 | ~A & B & C1 | A & ~B & C2 | A & B & C3; 

D0 = rand(1, 10000)<0.9;
D1 = rand(1, 10000)<0.2;
D = ~C & D0 | C & D1;
Pc = sum(C)/10000
Pd = sum(D)/10000

%P(D|A)
Pda = sum(A&D) / sum(A);

%P(A,B|C,D)
Pabcd = sum(A&B&C&D) / sum(C&D);