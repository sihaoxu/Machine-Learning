function logratio = naivebayes(x,y,x1)
% function possi = naivebayes(x,y);
%
% Computation of log P(Y|X=x1) using Bayes Rule
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
% x1: input vector of d dimensions (dx1)
%
% Output:
% poscond: log conditional probability log P(Y = 1|X=x1)
% negcond: log conditional probability log P(Y = -1|X=x1)
%

[d,n] = size(x);
%% fill in code here
[posprob,negprob] = naivebayesPXY(x,y);
[pos,neg] = naivebayesPY(x,y);

%probx=length(find(x==y1))/length(x);
py1=posprob*pos;
py2=negprob*neg;
logratio=log(py1/py2);

