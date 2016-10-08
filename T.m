function [ T50 ] = T( q )
%this function is used to calculate the transformation matrix T50

%D-H parameters
a0=0;
a1=10;
a2=10;
a3=0;
a4=0;
alpha0=0;
alpha1=0;
alpha2=0;
alpha3=-pi/2;
alpha4=pi/2;

d1=0;
d2=0;
d3=0;
d4=2;
d5=5;

theta1=q(1);
theta2=q(2);
theta3=-pi/2+q(3);
theta4=-pi/2+q(4);
theta5=0;

T10=TR(a0,alpha0,d1,theta1);
T21=TR(a1,alpha1,d2,theta2);
T32=TR(a2,alpha2,d3,theta3);
T43=TR(a3,alpha3,d4,theta4);
T54=TR(a4,alpha4,d5,theta5);
T50=T10*T21*T32*T43*T54;

end

