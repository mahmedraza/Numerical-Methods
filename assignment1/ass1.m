syms t;
t = 0:0.0001:1;
f = (2 - exp(t) + 2*t)/3;
plot(t,f)
diff(f, t)