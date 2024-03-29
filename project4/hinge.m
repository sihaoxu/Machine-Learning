function [loss,gradient,preds]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);

loss=sum(max(1-yTr.*(w'*xTr),0))+lambda*w'*w;

y0=yTr;
y0(max(1-yTr.*(w'*xTr),0)==0)=0;
gradient=-xTr*y0'+2*lambda*w;

