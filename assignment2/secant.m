function[xr r err fr fr2] = secant(f, a, b, tol, n)
% function file help (python documentation type)
% function [xr r err fr] = falsepostion(f,a,b,tol, n)
% Does n iterations of the bisection method for a function f
% Inputs: f -- an inline function exp: f = inline('x^2 + 1')
%         a,b -- interval in which roots lie
%		  tol -- tolerance
%         n -- the number iterations
% Outputs: xr -- the estimated solution of f(x) = 0
%		   r -- matrix of roots of equation per iteration
%          err -- relative error
%		   fr -- matrix, function absolute values at xr
%          fr2 -- matrix, function values at xr
format long
if nargin < 5
    n =  15;
end
for i = 1:n
	xr = b - (f(b) * (a - b)) / (f(a) - f(b));
	r(i, 1) = xr;
	a = b;
	b = xr;
    fr(i, 1) = abs(f(xr));
    fr2(i, 1) = f(xr);    
    if i > 1
        m = i - 1;
        err(m,1) = abs(r(m, 1) - r(i, 1)) / r(i, 1) *100;
        if fr(m, 1) == 0.0
            err = 0;
            break
        end
        if (err(m,1) < tol)
            break
        end
    end
end
plot(1:size(err), err, 'b');
grid on
hold on
plot(1:size(fr), fr, 'g--');
hold off
end