function [ L ] = linearpoints( start, final, step )
%positions of ending effector moving through a straight line 
N=step;
L=start;
change=(final-start)/step;
for i=1:step
    L=[L start+change*i];
end

