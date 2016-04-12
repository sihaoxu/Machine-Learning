function bias=recoverBias(K,yTr,alphas,C);
% function bias=recoverBias(K,yTr,alphas,C);
%
% INPUT:	
% K : nxn kernel matrix
% yTr : 1xn input labels
% alphas  : nx1 vector or alpha values
% C : regularization constant
% 
% Output:
% bias : the hyperplane bias of the kernel SVM specified by alphas
%
% Solves for the hyperplane bias term, which is uniquely specified by the support vectors with alpha values
% 0<alpha<C
%


% YOUR CODE
[d,n]=size(yTr);
if(d==1)
    yTr=yTr';
end

as= alphas<C & alphas>0;
sorted=sort(alphas(as));
med=sorted(round(length(sorted)/2));
i=find(alphas==med);
y=yTr(i);
bias=y-sum(yTr.*K(:,i).*alphas);

