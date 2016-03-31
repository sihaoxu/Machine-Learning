function ybar=computeybar(xTe)
% function [ybar]=ybar(xTe);
% 
% computes the expected label 'ybar' for a set of inputs x
% generated from two standard Normal distributions (one offset by OFFSET in
% both dimensions.)
%
% INPUT:
% xTe | a 2xn matrix of column input vectors
% 
% OUTPUT:
% ybar | a 1xn vector of the expected label ybare(x)
%

global OFFSET;

[~,n]=size(xTe);
ybar=zeros(1,n);

% Feel free to use the following function to compute p(x|y)
normpdf=@(x,mu,sigma)   exp(-0.5 * ((x - mu)./sigma).^2) ./ (sqrt(2*pi) .* sigma);

xy1=normpdf(xTe,0,1);
xy2=normpdf(xTe,OFFSET,1);

pxy1=prod(xy1);
pxy2=prod(xy2);

py1=0.5;
py2=0.5;

px=pxy1.*py1 + pxy2.*py2;

py1x=pxy1.*py1./px;
py2x=pxy2.*py2./px;


ybar = py1x+py2x*2;




