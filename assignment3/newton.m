function[cfs p pr pxr] = newton(xdata, y, n, xr)
if length(xdata) ~= length(y)
    error('input data again, carefully!!')
    cfs = 0;p = 0;pxr = 0;
    return
end
if n>(length(xdata)-1)
    error('Wrong order is given')
    cfs = 0;p = 0;pxr = 0;
    return
end    
l = length(xdata);
cfs = zeros(l,l);
cfs(:,1) = y';
for k = 2:length(xdata)
		for j = 1:(l - k + 1)
			cfs(j,k) = (cfs(j+1,k-1) - cfs(j, k-1)) / (xdata(k+j-1) - xdata(j));
		end
end
cfs(1,length(xdata)+1) = 0;
syms x
for i = 2:length(xdata)
	pol(1,1) = x - xdata(1);
	pol(1,i) = (x - xdata(i));
    pr(1,1) = pol(1,1);
	pr(1,i) = pol(1,i) * pr(1,i-1);
end

for (m = 1:n)
	pro(1,m) = pr(1,m) .* cfs(1,m+1);
end
p = y(1) + sum(pro);
f = inline(p)
pxr = f(xr);
end