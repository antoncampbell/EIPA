clc
clear all
close all

%Program Parameters
nx=50;
ny=50;

mx=50/2;
my=50/2;
radius=20;
radius2=5;


%Variables
G=sparse(nx*ny,nx*ny)

for i=1:nx
    for j=1:ny
        N=j+(i-1)*ny;
         if(((j-mx)^2+(i-mx)^2)>radius^2)%outside circle
             %G(N,:)=0;
             G(N,N)=1;
             
         elseif(((j-mx)^2+(i-mx)^2)<radius2^2)%outside circle
             %G(N,:)=0;
             G(N,N)=1;
%         if(j==1)%bottom
%             
%             %G(N,:)=0;
%             G(N,N)=1;
%             
%             
%         elseif(j==ny)%top
%             
%              %G(N,:)=0;
%              G(N,N)=1;
%             
%             
%         elseif(i==1)%left
%             
%              %G(N,:)=0;
%              G(N,N)=1;
%             
%         elseif(i==nx)%right
%              %G(N,:)=0;
%              G(N,N)=1;
%             
        else%middle
            
            Nup=j+1+(i-1)*ny;
            Ndown=j-1+(i-1)*ny;
            Nleft=j+(i-1-1)*ny;
            Nright=j+(i-1+1)*ny;
            %G(N,:)=0;
            G(N,Nup)=1;
            G(N,Ndown)=1;
            G(N,Nleft)=1;
            G(N,Nright)=1;
%             if(i>10&i<30&j>10&j<30)
%                 G(N,N)=-2;
%             else
                 G(N,N)=-4;
%             end
        end
            
            
            
        
    end
end

figure(101)
spy(G)


[E,D]=eigs(G,9,'sm');

for t=1:9
    for i=1:nx
        for j=1:ny

            
            N=j+(i-1)*ny;

            y(j,i)=E(N,t);
            
        end
    end
    figure(t)
    surf(y);
end
% figure(2)
% surf(y);
