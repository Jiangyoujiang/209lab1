%this is the main function of lab1
%goal is move the end effector from initial point (22,5,0,1) to final point
%(15,6,-1,1)linearly

%calculate desired end effector values
step=10;
D=linearpoints([22;5;0;1],[15;6;-1;1],10);

end_effector_sets=[];
sol_set=[];
%calculate the rotation of joints, q
for step_i=1:step
    xd=D(:,step_i);
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
    %initial solution of q
    sol=[q0];
    
    n=1;
    % %while error is large
    while pdist([transpose(x); transpose(xd)])>0.1
        %use Jt find delta_q
        delta_x=0.001*(xd-x)/(pdist([transpose(x); transpose(xd)]));
        Jt_temp=subs(Jt,q,q0);
        delta_q=Jt_temp*delta_x;
        %calculate new position at new q
        q0=delta_q+q0;
        x=T(q0)*P55;
        %set new solution
        sol=q0;
        n=n+1;
    end
    sol_set=[sol_set sol];
    %calcualte end effector value using solution of q
    end_effector=T(sol)*P55;
    end_effector_sets=[end_effector_sets end_effector];
end
%plot end effector location in 3D to verify linear motion
xs=end_effector_sets(1,:);
ys=end_effector_sets(2,:);
zs=end_effector_sets(3,:);
scatter3(xs,ys,zs);
sol_set