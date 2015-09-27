function[x_new r err fr fr2] = fixedpoint(f, a, tol, n)
if nargin < 4
    n =  15;
end
f2 = inline(diff(f));
f = inline(f);
if f2(a) > 1
    error('wrong values')
    x_new = 0;
    r = 0;
    err = 0;
    fr = 0;
    fr2 = 0;
    return
end
for i = 1:n
    x_new = f(a);
    fr(i, 1) = abs(f(a));
    fr2(i, 1) = f(a);
    r(i, 1) = x_new;
    err(i, 1) = abs(x_new - a) / x_new * 100;
    a = x_new;
    if ((err(i,1) < tol))
        break
    end
end
plot(1:size(err), err, 'b');
grid on
%hold on
%plot(1:size(fr), fr, 'g--');
%hold off
end