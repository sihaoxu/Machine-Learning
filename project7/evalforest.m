function preds=evalforest(F,xTe)
% function preds=evalforest(F,xTe);
%
% Evaluates a random forest on a test set xTe.
%
% input:
% F   | Forest of decision trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here

[d,n]=size(xTe);
num=length(F);
ypredict=zeros(num,n);

for i=1:num
    ypredict(i,:)=evaltree(F{i},xTe);
end

preds=mode(ypredict,1);

