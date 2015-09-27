function[out err] = simpson(f, a, b, n)
format long
s = 0;
s1 = 0;
h = (b - a)/n;
f1 = inline(f);
for j = 1:(n/2-1)
	x = a + 2*(j)*h;
	s = s + f1(x);
end
for j = 1:(n/2)
	x1 = a + (2*j-1)*h;
	s1 = s1 + f1(x1);
end
out = (h/3)*(f1(a) + f1(b) + 2*s + 4*s1);
g = diff(f,4);
r = inline(g);
d(1,1) = r(a);d(1,2)=r(b);d(1,3)=r((a+b)/2);
p = max(d);
err = abs(((b-a)*(h^4)*p)/(180));
end