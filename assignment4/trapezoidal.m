function[out err] = trapezoidal(f, a, b, n)
format long
s = 0;
h = (b - a)/n;
f1 = inline(f);
for j = 1:(n-1)
	x = a + j*h;
	s = s + f1(x);
end
out = (h/2)*(f1(a) + f1(b) + 2*s);
g = diff(f,2);
r = inline(g);
d(1,1) = r(a);d(1,2)=r(b);d(1,3)=r((a+b)/2);
p = max(d);
err = ((b-a)/12)*(h^2);
end