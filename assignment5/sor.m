function[x1 err] = sor(A,B,x,n,w)
l = length(x);
x1 = zeros(l,n);
x1(:,1) = x';
for k = 2:n
	for i = 1:length(x)
		s = 0;
        s1 = 0;
        for j = 1:(i)
            if i == j
                continue
            else
                s = s + A(i,j)*x1(j,k);
            end
        end
        for j = (i+1):length(A)
			if i == j
				continue
			else
				s1 = s1 + A(i,j)*x1(j,k-1);
            end
        end
		x1(i,k) = ((1-w)*x1(i,k-1)) + ((w/A(i,i))*(B(i) - s - s1));
	end
end
for p = 2:n
    err(1,p) = norm((x1(:,p)-x1(:,p-1)),inf);
end
end