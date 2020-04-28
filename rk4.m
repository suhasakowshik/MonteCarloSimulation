clc;
clear all;

%ODE's
Fx=@(t,x,y,z)    10*(y-z);
Fy=@(t,x,y,z)    x*(28-z)-y;
Fz=@(t,x,y,z)    x*y - (8/3)*z;

%Initial condions
t(1)=0;
x(1)=1;
y(1)=1;
z(1)=1;

%Step Size
h=0.001;
T=1;
N=T/h;

%Loop
for i=1:N
    t(i+1)=t(i)+h;
    
    K1x=h*Fx(t(i),x(i),y(i),z(i));
    K1y=h*Fy(t(i),x(i),y(i),z(i));
    K1z=h*Fz(t(i),x(i),y(i),z(i));
    
    K2x=h*Fx(t(i)+(h/2), x(i)+(K1x/2) , y(i)+ (K1y/2), z(i)+(K1z/2) );
    K2y=h*Fy(t(i)+(h/2), x(i)+(K1x/2) , y(i)+ (K1y/2), z(i)+(K1z/2) );
    K2z=h*Fz(t(i)+(h/2), x(i)+(K1x/2) , y(i)+ (K1y/2), z(i)+(K1z/2) );
    
    K3x=h*Fx(t(i)+(h/2), x(i)+(K2x/2) , y(i)+ (K2y/2), z(i)+(K2z/2) );
    K3y=h*Fy(t(i)+(h/2), x(i)+(K2x/2) , y(i)+ (K2y/2), z(i)+(K2z/2) );
    K3z=h*Fz(t(i)+(h/2), x(i)+(K2x/2) , y(i)+ (K2y/2), z(i)+(K2z/2) );
    
    K4x=h*Fx(t(i)+(h), x(i)+(K3x) , y(i)+ (K3y), z(i)+(K3z) );
    K4y=h*Fy(t(i)+(h), x(i)+(K3x) , y(i)+ (K3y), z(i)+(K3z) );
    K4z=h*Fz(t(i)+(h), x(i)+(K3x) , y(i)+ (K3y), z(i)+(K3z) );
    
    Kx=(1/6)*(K1x+2*(K2x+K3x)+K4x);
    Ky=(1/6)*(K1y+2*(K2y+K3y)+K4y);
    Kz=(1/6)*(K1z+2*(K2z+K3z)+K4z);
    
    x(i+1)=x(i)+Kx;
    y(i+1)=y(i)+Ky;
    z(i+1)=z(i)+Kz;
    
end

plot(t,x,t,y,t,z,'LineWidth',1.2);
set(gca,'FontSize',14);
xlabel('Time');
ylabel('ODEs');
legend('x','y','z','Location','southwest');
print('-dpng','-r500','ranheKutta4.png');





