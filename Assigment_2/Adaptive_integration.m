function n=Adaptive_integration(f,a,b,eps,method)
% Adaptive integrations
n=1;
c=1;
error=1;

if method==1
result(c)=trapezoidal_integral(f, a, b, (n));

while error > eps
    c=c+1;
    n(1,c)=2*n(1,c-1);
    result(c)=trapezoidal_integral(f, a, b, n(1,c));
    error(1,c)=abs(result(c)-result(c-1));
    
end
elseif method==0
    result(c)=midpoint(f, a, b, (n));

while error > eps
    c=c+1;
    n(1,c)=2*n(1,c-1);
    result(c)=midpoint(f, a, b, n(1,c));
    error(1,c)=abs(result(c)-result(c-1));
end
end

fprintf('Value of integral is %.8f, number of elements are %.0f and error is %.8f.\n', result(c), n(c), error(1,c))

semilogy(n,error)
xlabel('Number of elements')
ylabel('Error')

end
