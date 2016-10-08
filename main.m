%this is the main function of lab1
%desired final point
xd=[15;4;1;1];
%variable q
syms q1 q2 q3 q4;
q=[q1;q2;q3;q4];
%find jacobian and use its transpose as inverse jacobian
P55=[0;0;0;1];
P50=T(q)*P55;
J=jacobian(P50,q);
Jt=transpose(J);
%Set initial guess of q
q0=[0;0;0;0];
%use q0 to calculate x0
x0=T(q0)*P55;
x=x0;

points=[x(1);x(2);x(3)];
% %while error is large
sol=[q0];
n=1;
while pdist([transpose(x); transpose(xd)])>0.1
    %use Jt find delta_q
    delta_x=0.001*(xd-x)/(pdist([transpose(x); transpose(xd)]));
    Jt_temp=subs(Jt,q,q0);
    delta_q=Jt_temp*delta_x;
    %calculate new position at new q
    q0=delta_q+q0;
    x=T(q0)*P55;
    x
    points=[points [x(1);x(2);x(3)]];
    sol=[sol q0];
    n=n+1;
end
xs=points(1,:);
ys=points(2,:);
zs=points(3,:);
plot3(xs,ys,zs);
