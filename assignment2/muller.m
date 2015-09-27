function[x3 a1 b1 c1 r err fr fr2] = muller(f, x0, x1, x2, tol, n)
%format long
if nargin < 6
    n =  15;
end
for i = 1:n
	c = f(x2);
    c1(i,1) = f(x2);
	b = ((x0 - x2)^2*(f(x1) - f(x2)) - (x1 - x2)^2*(f(x0) - f(x2)))/ ((x0 - x2)*(x1 - x2)*(x0 - x1));
    b1(i, 1) = b;
	a = ((x1 - x2)*(f(x0) - f(x2)) - (x0 - x2)*(f(x1) - f(x2)))/ ((x0 - x2)*(x1 - x2)*(x0 - x1));
    a1(i, 1) = a;
	x3 = x2 - (2*c / (b + sign(b)*sqrt(b^2 - 4*a*c)));
    r(i, 1) = x3;
    x0 = x1;
	x1 = x2;
	x2 = x3;
    fr(i, 1) = abs(f(x3));
    fr2(i, 1) = f(x3);
    if i > 1
        m = i - 1;
        err(m, 1) = abs(abs(r(m, 1) - r(i,1))/r(i,1)) * 100;
    if (err(m ,1) < tol)
		break
    end
    end
end
%plot(1:size(err), err, 'b');
%grid on
%hold on
%plot(1:size(fr), fr, 'g--');
%hold off
end