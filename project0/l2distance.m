function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

if (nargin==1) % case when there is only one input (X)
	%% fill in code here
    [d,n]=size(X);  
    S= innerproduct(X);
    I= eye(n);
    S= S.*I;
    S= S*ones(n,1);
    S= repmat(S,1,n);
    R= innerproduct(X);
    H= eye(n);
    R= R.*H;
    R= ones(1,n)*R;
    R= repmat(R,n,1);
    G= innerproduct(X);
    Dsq= S-2*G+R;
    D=sqrt(Dsq);
else  % case when there are two inputs (X,Z)
	%% fill in code here
    [d,n]=size(X); 
    [~,m]=size(Z); 
    S= innerproduct(X);
    I= eye(n);
    S= S.*I;
    S= S*ones(n,1);
    S= repmat(S,1,m);
    R= innerproduct(Z);
    H= eye(m);
    R= R.*H;
    R= ones(1,m)*R;
    R= repmat(R,n,1);
    G= innerproduct(X,Z);
    Dsq= S-2*G+R;
    D=sqrt(Dsq);
end;
%



