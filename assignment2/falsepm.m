function [xroot, error   ] = falsepm( func,a,b,tolerance,iterations )

format long % give you values upto 15 significant figures

if (func(a)*func(b)>0)
    return
end
a(1,1)=a; b(1,1)=b;
xroot (1,1)= abs(b(1,1)-a(1,1))/b(1,1);
for i= 1:iterations
    xroot(i+1,1)= b(i,1)- (func(b(i,1))*(a(i,1)-b(i,1)))/(func(a(i,1))-func(b(i,1))) ; 
    if (func(a(i,1))*func(xroot(i+1,1))<0)    % condidtion for root in range
        a(i+1,1)=a(i,1);
        b(i+1,1)=xroot(i+1,1);
       
    elseif (func(xroot(i+1,1))*func(b(i,1))<0)
        a(i+1,1)=xroot(i+1,1);
        b(i+1,1)=b(i,1);
    end
    error(i,1)= abs(xroot(i+1,1)-xroot(i,1))/xroot(i+1,1); % error computation
if error (i,1)< tolerance
    break
end
end
plot(1:size(error),error);
ylabel ('Error propogation');
xlabel ('No of iterations');
title ('False position method');
grid
hold on        
end

