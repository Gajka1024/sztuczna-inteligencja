% linie przeciêcia trzech powierzchni
function nndisp_contour_3c(x1,x2,net);

[xx1,xx2]=meshgrid(x1,x2);
sx=size(xx1);
clear z
for i=1:sx(1)
    xp1=xx1(i,:); 
    xp2=xx2(i,:);
    x=[xp1;xp2];
    z=sim(net,x);
    z1(i,:)=z(1,:);
    z2(i,:)=z(2,:);
    z3(i,:)=z(3,:);

end
mz1=z1>z2 & z1>z3;
mz2=z2>z1 & z2>z3;
mz3=z3>z1 & z3>z2;
mz=mz1+2*mz2+3*mz3;

licznik=1;
for w=1:size(z1,1)-1
    for k=1:size(z1,2)-1
        if (mz(w,k)~=mz(w,k+1))|(mz(w,k)~=mz(w+1,k))
            P(licznik,:)=[x1(k) x2(w)];
            licznik=licznik+1;
        end
    end
end
plot(P(:,1),P(:,2),'k.','MarkerSize',15)
axis equal



