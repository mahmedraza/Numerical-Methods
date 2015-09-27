function[cfs] = hermite(xdata, y, f_der, xr)
l = 2*length(xdata)
cfs = zeros(l,l);
y1 = y';
for i = 1:5
    cfs(2*i,1) = y1(i);
    cfs(2*i-1,1)= y1(i);
end
%f = zeros(10,10);
for m = 1:4
    f =(y(m+1)-y(m))/(xdata(m+1) - xdata(m));
end
for a = 1:5
    cfs(2*a,2) = f(a)
    cfs(2*a-1,2) = f_der(a)
end
% for k = 3:length(xdata)
% 		for j = 1:(l - k + 1)
% 			cfs(j,k) = (cfs(j+1,k-1) - cfs(j, k-1)) / (xdata(k+j-1) - xdata(j));
%         end
end