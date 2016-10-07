function [ T ] = TR( a0,alpha0,d1,theta1 )
%this function is used to calculate the transformation matrix
%a0,alpha0:parameters on the previous joint
%d1,theta1:parameters on current joint
T=[cos(theta1) -sin(theta1) 0 a0; sin(theta1)*cos(alpha0) cos(theta1)*cos(alpha0) -sin(alpha0) -d1*sin(alpha0);
    sin(theta1)*sin(alpha0) cos(theta1)*sin(alpha0) cos(alpha0) d1*cos(alpha0); 0 0 0 1];
end

