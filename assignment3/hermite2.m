%function[p pxr] = hermite2(x, y, f_der, n, xr)
x = [1,2,3,4,5];
z = [1,1,2,2,3,3,4,4,5,5];
y = [1,2,3,5,7];
f_der = [1.3333,0.8333,1.3333,2.8333,5.3333];
f = [1,1,2,2,0];
l = 2*length(x);
cfs = zeros(l,l);
for i = 1:5
    cfs(2*i,1)=x(i);
    cfs(2*i-1,1)= x(i);
    cfs(2*i,2) = y(i);
    cfs(2*i-1,2)= y(i);
end
for a = 1:5
    cfs(2*a-1,3) = f_der(a);
    cfs(2*a,3) = f(a);
end
for k = 3:(2*length(x))
		for j = 1:(l - k + 1)
			cfs(j,k+1) = (cfs(j+1,k) - cfs(j, k)) / (z(k+j-1) - z(j));
        end
end
syms x1
for i = 2:2*length(x)
	pol(1,1) = x1 - z(1);
	pol(1,i) = (x1 - z(i));
    pr(1,1) = pol(1,1);
	pr(1,i) = pol(1,i) * pr(1,i-1);
end
for m = 1:(2*n+1)
    exp(1,m) = pr(1,m).*cfs(1,m+2);
end
expr1 = y(1)+sum(exp);
expr = inline(expr1);
pxr  = expr(3.5);