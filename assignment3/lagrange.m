function[p pxr] = lagrange(xdata, y, n, xr)
syms x
if length(xdata) ~= length(y)
    error('input data again, carefully!!')
    p = 0;pxr = 0;
    return
end
if n>(length(xdata)-1)
    error('Wrong order is given')
    p = 0;pxr = 0;
    return
end    
for k = 1:n+1
	for i = 1:n+1
		if i == k
			l(i, k)= x/x;
		else
			l(i, k) = (x - xdata(i))/(xdata(k) - xdata(i));
		end
	end
	lg = prod(l);
end
p = sum(lg.*y(1:length(lg)));
f = inline(p);
pxr = f(xr);
end