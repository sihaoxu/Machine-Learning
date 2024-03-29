function w=perceptron(x,y);
% function w=perceptron(x,y);
%
% Implementation of a Perceptron classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
%

[d,n]=size(x);
w=zeros(d,1);
max=0;
while true
    p=randperm(n);
    z=x(:,p);
    k=y(p);
    m=0;
    for num=1:n
        i=z(:,num);
        j=k(num);
        if (w'*i)*j<=0
           w = perceptronUpdate(i,j,w);
           m=m+1;
        end
    end
    if m==0
        break;
    elseif max==100
        break;
    else
        max=max+1;
    end
end


%% fill in code here


