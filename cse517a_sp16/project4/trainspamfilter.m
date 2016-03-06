function trainspamfilter(xTr,yTr);
%function trainspamfilter(xTr,yTr);
% INPUT:	
% xTr
% yTr
%
% NO OUTPUT

[d,n]=size(xTr);

% Feel free to change this code any way you want
f=@(w) logistic(w,xTr,yTr);
w0=zeros(size(xTr,1),1); % initialize with all-zeros vector
w=grdescent(f,w0,1e-03,1e-08);

save('w0','w');


