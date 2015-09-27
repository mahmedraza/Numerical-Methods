function[out err] = midpoint(f, a, b, n)
format long
s = 0;
h = (b - a)/n;
f1 = inline(f);
for j = 1:(n/2)
	x = a + 2*j*h;
	s = s + f1(x);
end
out = (2*h*s);
g = diff(f,2);
r = inline(g);
d(1,1) = r(a);d(1,2)=r(b);d(1,3)=r((a+b)/2);
p = max(abs(d));
err = ((b-a)/6)*(h^2)*p;
end