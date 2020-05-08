%Zostaw jeden na bok (1 z n)
clear all
load RJ_final.mat

%rdane=RJ_final
ld=size(RJ_final,1);
rd = RJ_final(:,6:9)'; 
rx = RJ_final(:,1:5)'; %Dane do uczenia

%-----------------------------------------------------
lw2=4; %4 wyp³ywy
for lw1=1:10
    disp(lw1)
    minmax=[zeros(5,1) ones(5,1)];
    siec=newff(minmax, [lw1,lw2],{'logsig', 'logsig'});
    siec=init(siec);
   
    %Il kroków
    siec.trainParam.epochs=3000;

%do testowania
xt = rx(:,2:end);
dt = rd(:,2:end);

%do walidacji
xw = rx(:,1);
dw = rd(:,1);

[siec tr] = train(siec,xt,dt);

%walidacja
yw=sim(siec,xw);
errorOfValidation(lw1,1) = sum((dw-yw).^2)/4

yt=sim(siec,xt);
errorOfTest(lw1,1) = sum(sum((dt-yt).^2))/((ld-1)*4)

%-----------------------------------------------------

for i=2:ld-1
   
    %do testowania
    xt = [rx(:,1:i-1) rx(:,i+1: end)]
    dt = [rd(:,1:i-1) rd(:,i+1: end)]
    
    %do walidacji
    xw = rx(:,i);
    dw = rd(:,i);
    
    siec=init(siec)
    [siec tr] = train(siec,xt,dt);

    %walidacja
    yw=sim(siec,xw);
    errorOfValidation(lw1,i) = sum((dw-yw).^2)/4;

    yt=sim(siec,xt);
    errorOfTest(lw1,i) = sum(sum((dt-yt).^2))/((ld-1)*4)
       
end


%-----------------------------------------------------
%Kasowanie ostatniej danej
   
    %do testowania
    xt = rx(:,1:end-1);
    dt = rd(:,1:end-1);
    
    %do walidacji
    xw = rx(:,ld);
    dw = rd(:,ld);
    
    siec=init(siec)
    [siec tr] = train(siec,xt,dt);

    %walidacja
    yw=sim(siec,xw);
    errorOfValidation(lw1,ld) = sum((dw-yw).^2)/4;

    yt=sim(siec,xt);
    errorOfTest(lw1,ld) = sum(sum((dt-yt).^2))/((ld-1)*4)
       
end

save errorOfValidation errorOfValidation;
save errorOfTest errorOfTest;

totalErrorOfValidation = sum(errorOfValidation,2)
totalErrorOfTest = sum(errorOfTest,2)

hold on
plot(totalErrorOfValidation)
plot(totalErrorOfTest)




