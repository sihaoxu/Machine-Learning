function [ypredict]=evaltree(T,xTe)
% function [ypredict]=evaltree(T,xTe);
%
% input:
% T0  | tree structure
% xTe | Test data (dxn matrix)
%
% output:
%
% ypredict : predictions of labels for xTe
%

%% fill in code here
[~,n]=size(xTe);
ypredict=zeros(1,n);
[d, n] = size(xTe);
ypredict = zeros(1, n);

for ii = 1:n,
	ypredict(1, ii) = checkTree(T, 1, xTe(:, ii));
end

end

function predi = checkTree(T, ii, x)
	if T(4 ,ii) == 0,
		predi = T(1, ii);
	else,
		feature = T(2, ii);
		cut     = T(3, ii);
		if x(feature, 1) <= cut,
			left = T(4, ii);
			predi = checkTree(T, left, x);
		else,
			right = T(5, ii);
			predi = checkTree(T, right, x);
		end
	end
end
            
            
