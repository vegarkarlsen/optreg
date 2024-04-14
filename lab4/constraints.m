function [c, ceq] = constraints(z)
global N nx
alpha = 0.2;
beta = 20;
lambda_t = 2*pi/3;
c = zeros(N,1);

for k=1:N
    lambda_k = z(1+(k-1)*nx);
    e_k = z(5+(k-1)*nx);
    c(k) = alpha*exp(-beta*(lambda_k-lambda_t)^2) - e_k;
end
ceq = [];
end
