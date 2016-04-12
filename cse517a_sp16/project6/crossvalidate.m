function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
% function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
%
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% ktype : (linear, rbf, polynomial)
% Cs   : interval of regularization constant that should be tried out
% paras: interval of kernel parameters that should be tried out
% 
% Output:
% bestC: best performing constant C
% bestP: best performing kernel parameter
% bestval: best performing validation error
% allvalerrs: a matrix where allvalerrs(i,j) is the validation error with parameters Cs(i) and paras(j)
%
% Trains an SVM classifier for all possible parameter settings in Cs and paras and identifies the best setting on a
% validation split. 
%

%%% Feel free to delete this
%bestC=0;
%bestP=0;
%bestval=10^10;

%% Split off validation data set
% YOUR CODE

Cs_length = length(Cs);
paras_length = length(paras);
allvalerrs = zeros(Cs_length,paras_length);
n = length(xTr);
split_val = n / 5;
train_data = xTr(:,[1:split_val]);
train_labels = yTr(:,[1:split_val]);
validation_data = xTr(:,[split_val+1:n]);
validation_labels = yTr(:,[split_val+1:n]);

%% Evaluate all parameter settings
% YOUR CODE
for i=1:Cs_length
	for j=1:paras_length
		svmclassify=trainsvm(train_data,train_labels,Cs(i), ktype, paras(j));
		err=sum(sign(svmclassify(validation_data)')~=validation_labels)/length(validation_labels);
		allvalerrs(i,j)=err;
	end
end
%% Identify best setting
% YOUR CODE
bestval = min(allvalerrs(:));
[bestC,bestP] = find(allvalerrs==bestval);
bestC=min(bestC);
bestP=min(bestP);


