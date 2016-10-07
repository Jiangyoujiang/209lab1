% %D-H parameters
% a0=0;
% a1=10;
% a2=10;
% a3=0;
% a4=0;
% alpha0=0;
% alpha1=0;
% alpha2=0;
% alpha3=-pi/2;
% alpha4=pi/2;
% 
% d1=0;
% d2=0;
% d3=0;
% d4=2;
% d5=5;
% 
% % syms d_theta1 d_theta2 d_theta3 d_theta4;
% %d_theta1=0; d_theta2 =0; d_theta3=pi/2; d_theta4=0;
% 
% theta1=0;
% theta2=0;
% theta3=-pi/2;
% theta4=-pi/2;
% theta5=0;
% 
% q=[q1;q2;q3;q4];
% T10=TR(a0,alpha0,d1,q1);
% T21=TR(a1,alpha1,d2,q2);
% T32=TR(a2,alpha2,d3,q3);
% T43=TR(a3,alpha3,d4,q4);
% T54=TR(a4,alpha4,d5,theta5);
% T50=T10*T21*T32*T43*T54;
% P55=[0;0;0;1];
% P50=T50*P55;
% 
% J=jacobian(P50,dq);
% Jt=transpose(J);

%solution
theta1=0;
theta2=0;
theta3=-pi/2;
theta4=-pi/2;

start=[22; 5; 0;1];
q=[theta1;theta2;theta3;theta4];
final=[15;4;1;1];
position=start;
syms dq1 dq2 dq3 dq4;
dq=[dq1;dq2;dq3;dq4];
dq_ini=dq;
q=q+dq;
while pdist([transpose(position); transpose(final)])>1
    dx=final-position;
    [Jt,T50]=Jtranspose(q,dq_ini);
    dq=Jt*dx;
    q=q+dq;
    position=T50*start;
%     position=T5_0(q+dq)*start;
    
%     dq=dq+dq1;
%     position=T50*start;
%     
%     dq(2)=Jt*dx(2);dq(3)=Jt*dx(3);dq(4)=Jt*dx(4);
%    
%     start=T50*start;
end
