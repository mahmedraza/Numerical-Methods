function[x1 err] = jacobi(A,B,x,n)
l = length(x);
x1 = zeros(l,n);
x1(:,1) = x';
for k = 2:n
	for i = 1:length(x)
		s = 0;
		for j = 1:length(A)
			if i == j
				continue
			else
				s = s + A(i,j)*x1(j,k-1);
            end
        end
		x1(i,k) = (1/A(i,i))*(B(i) - s);
	end
end
for p = 2:n
    err(1,p) = norm((x1(:,p)-x1(:,p-1)),inf);
end
end
