% METODA K-ŒREDNICH

clear all
load P.m
pSize = size(P,1);
P = P;

%inicjalizacja 4 losowych punktów, bêd¹cych centrami klastrów
C1 = rand(1,2);
C2 = rand(1,2);
C3 = rand(1,2);
C4 = rand(1,2);

%przedstawienie na wykresie punktów z pliku oraz centrów
figure 
hold on 
plot(P(:,1), P(:,2), '.b');
plot(C1(:,1), C1(:,2),'*r', 'MarkerSize',10);
plot(C2(:,1), C2(:,2),'*r', 'MarkerSize',10);
plot(C3(:,1), C3(:,2),'*r', 'MarkerSize',10);
plot(C4(:,1), C4(:,2),'*r', 'MarkerSize',10);
hold off 
axis equal
axis([0 1 0 1])

%-----------------------------------------------
% LICZENIE PRZYNALE¯NOŒCI 
%-----------------------------------------------

%powielenie macierzy 
c1 = repmat(C1,pSize,1);
c2 = repmat(C2,pSize,1);
c3 = repmat(C3,pSize,1);
c4 = repmat(C4,pSize,1);

% odleg³oœci miêszy punktami, a œrodkami centrum 
od1 = sum((c1-P).^2, 2);
od2 = sum((c2-P).^2, 2);
od3 = sum((c3-P).^2, 2);
od4 = sum((c4-P).^2, 2);

% Przypisanie punktów do poszczególnych klastrów
b1 = od1<=od2 & od1<=od3 & od1<=od4;
b2 = ~b1 & od2<=od3 & od2<=od4;
b3 = ~b1 & ~b2 & od3<=od4;
b4 = ~b1 & ~b2 & ~b3;

P1 = P(b1,:); % wybierz te wiersze, gdzie b1 jest 1 
P2 = P(b2,:);
P3 = P(b3,:);
P4 = P(b4,:);

%liczenie jakoœci klastra 
S1 = sum(od1(b1,:));
S2 = sum(od2(b2,:));
S3 = sum(od3(b3,:));
S4 = sum(od4(b4,:));

quality1 = S1 + S2 + S3 + S4

% podzia³ punktów na klastry - zaznaczenie kolorami na wykresie
figure 
hold on 
plot(P1(:,1), P1(:,2), '.b', 'MarkerSize',10);
plot(P2(:,1), P2(:,2), '.g', 'MarkerSize',10);
plot(P3(:,1), P3(:,2), '.c', 'MarkerSize',10);
plot(P4(:,1), P4(:,2), '.m', 'MarkerSize',10);

plot(C1(:,1), C1(:,2),'.r', 'MarkerSize',30);
plot(C2(:,1), C2(:,2),'.r', 'MarkerSize',30);
plot(C3(:,1), C3(:,2),'.r', 'MarkerSize',30);
plot(C4(:,1), C4(:,2),'.r', 'MarkerSize',30);
axis equal
axis([0 1 0 1])


% ŒRODEK CIÊ¯KOŒCI 
%zapamiêtanie zmiennej b i c
c1_old = C1;
c2_old = C2;
c3_old = C3;
c4_old = C4;
b1_old = b1;
b2_old = b2;
b3_old = b3;

koniec = false;
licznik = 0;

while ~koniec 
    %nowe centa klastrów
    C1 = mean(P1,1);
    C2 = mean(P2,1);
    C3 = mean(P3,1);
    C4 = mean(P4,1);
    
    % LICZENIE PRZYNALE¯NOŒCI 
    %powielenie macierzy 
    c1 = repmat(C1,pSize,1);
    c2 = repmat(C2,pSize,1);
    c3 = repmat(C3,pSize,1);
    c4 = repmat(C4,pSize,1);

    % odleg³oœci miêszy punktami a œrodkami centrum 
    od1 = sum((c1-P).^2, 2);
    od2 = sum((c2-P).^2, 2);
    od3 = sum((c3-P).^2, 2);
    od4 = sum((c4-P).^2, 2);

    b1 = od1<=od2 & od1<=od3 & od1<=od4;
    b2 = ~b1 & od2<=od3 & od2<=od4;
    b3 = ~b1 & ~b2 & od3<=od4;
    b4 = ~b1 & ~b2 & ~b3;

    P1 = P(b1,:); % wybierz te wiersze, gdzie b1 jest 1 
    P2 = P(b2,:);
    P3 = P(b3,:);
    P4 = P(b4,:);


    plot(P1(:,1), P1(:,2), '.b', 'MarkerSize',10);
    plot(P2(:,1), P2(:,2), '.g', 'MarkerSize',10);
    plot(P3(:,1), P3(:,2), '.c', 'MarkerSize',10);
    plot(P4(:,1), P4(:,2), '.m', 'MarkerSize',10);

    plot(C1(:,1), C1(:,2),'.r', 'MarkerSize',30);
    plot(C2(:,1), C2(:,2),'.r', 'MarkerSize',30);
    plot(C3(:,1), C3(:,2),'.r', 'MarkerSize',30);
    plot(C4(:,1), C4(:,2),'.r', 'MarkerSize',30);
     
    koniec = isequal(b1,b1_old) & isequal(b2,b2_old) & isequal(b3,b3_old);
    
    c1_old = C1;
    c2_old = C2;
    c3_old = C3;
    c4_old = C4;
    b1_old = b1;
    b2_old = b2;
    b3_old = b3;
    
    %koniec = b1==b1_old & b2==b2_old & b3==b3_old;
    
end

%liczenie jakoœci klastra 
S1 = sum(od1(b1,:));
S2 = sum(od2(b2,:));
S3 = sum(od3(b3,:));
S4 = sum(od4(b4,:));

quality2 = S1 + S2 + S3 + S4

hold off














