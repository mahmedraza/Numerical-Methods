%Faizan Ahmad Khattak
function[]=newtdivid(x,x_values,f_values);
if(length(x_values)~=length(f_values))
    display('Vector dimension must match!');
end
format shortEng
format compact
i=length(x_values);
f=zeros(i);
f(:,1)=f_values';
% DIVIDED DIFFERENCE CALCULATION
for counter=2:i;
for j=2:counter;
f(counter,j)=(f(counter,j-1)-f(counter-1,j-1))/(x_values(counter)-x_values(counter-(j-1)));
end
end
for count=1:i;
divided_difference(1,count)=f(count,count);
end
delta_x(1,1)=1;
for v=2:i
delta_x(1,v)=delta_x(1,v-1)*(x-x_values(v-1));
end
% f(x)=f(x0)+f[x0,x1](x-x0)+...+f[x0,...,xn](x-x0)...(x-xn-1)
an=sum(divided_difference.*[delta_x]);
%showing output for user
f
an
end




