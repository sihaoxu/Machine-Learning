function output=analyze(kind,truth,preds)	
% function output=analyze(kind,truth,preds)		
%
% Analyses the accuracy of a prediction
% Input:
% kind='acc' classification error
% kind='abs' absolute loss
% (other values of 'kind' will follow later)
% 

switch kind
	case 'abs'
		% compute the absolute difference between truth and predictions
		%fill in the code here
        [~,n]=size(truth);
		output=sum(abs(preds-truth))/n;
	case 'acc' 
		%% fill in code here
         [~,n]=size(truth);
         [~,x]=size(find((preds-truth)==0));
		 output=x/n;	
end;

