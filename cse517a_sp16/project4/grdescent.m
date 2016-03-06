function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02;end;



w1=w0;
a=stepsize;
while true
    [loss1,gradient1]=func(w1);
    w2=w1-a*gradient1;
    if norm(gradient1)<tolerance
        break;
    end
    if sqrt((w2-w1)'*(w2-w1))<tolerance
        break;
        
    end
    [loss2,~]=func(w2);
    if loss2<loss1
       a=1.01*a; 
    elseif loss2>loss1
        a=0.5*a;
    end
    w1=w2;
end
w=w1;



