function[xr r err fr fr2] = newtonraphson(f, xo, tol, n)
% function file help (python documentation type)
% function [xr r err fr] = falsepostion(f,a,b,tol, n)
% Does n iterations of the bisection method for a function f
% Inputs: f -- a function entered like: syms x; f = x^2 + 1
%         xo -- guessed value
%		  tol -- tolerance
%         n -- the number iterations
% Outputs: xr -- the estimated solution of f(x) = 0
%		   r -- matrix of roots of equation per iteration
%          err -- matrix of computed relative error
%		   fr -- matrix, function absolute values at xr
%          fr2 -- matrix, function values at xr
format long
if nargin < 5
    n =  15;
end
f_fun = inline(f);
f_der = inline(diff(f));
for i = 1:n
	xr = xo - (f_fun(xo) / f_der(xo));
	r(i, 1) = xr;
    err(i, 1) = abs(xr - xo)/xr * 100;
    xo = xr;
    fr(i,1) = abs(f_fun(xr));
    fr2(i, 1) = f_fun(xr);
    if (err(i,1) < tol)
        break
    end
end
plot(1:size(err), err, 'b');
grid on
hold on
plot(1:size(fr), fr, 'g--');
hold off
end