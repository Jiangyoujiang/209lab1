function [ Jt,T50 ] = Jtranspose( q,dq )
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

% syms d_theta1 d_theta2 d_theta3 d_theta4;
%d_theta1=0; d_theta2 =0; d_theta3=pi/2; d_theta4=0;

theta5=0;

T10=TR(a0,alpha0,d1,q(1,:));
T21=TR(a1,alpha1,d2,q(2,:));
T32=TR(a2,alpha2,d3,q(3,:));
T43=TR(a3,alpha3,d4,q(4,:));
T54=TR(a4,alpha4,d5,theta5);
T50=T10*T21*T32*T43*T54;
P55=[0;0;0;1];
P50=T50*P55;
J=jacobian(P50, dq);
Jt=transpose(J);

end
