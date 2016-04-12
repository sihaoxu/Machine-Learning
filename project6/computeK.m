function K = computeK(kernel_type, X, Z, param)
% function K = computeK(kernel_type, X, Z)
% computes a matrix K such that Kij=g(x,z);
% for three different function linear, rbf or polynomial.
%
% Input:
% kernel_type: either 'linear','polynomial','rbf'
% X: n input vectors of dimension d (dxn);
% Z: m input vectors of dimension d (dxn);
% param: kernel parameter (inverse kernel width gamma in case of RBF, degree in case of polynomial)
%
% OUTPUT:
% K : nxm kernel matrix
%
%

if nargin<2,
	Z=X;
end;

%%YOUR CODE HERE
if strcmp(kernel_type,'linear')
    K=X'*Z;
end
if strcmp(kernel_type,'rbf')
    T=l2distance(X,Z);
    K=exp((T.^2).*(-param));
end
if strcmp(kernel_type,'poly')
    T=X'*Z;
    K=(T+1).^param;
end

