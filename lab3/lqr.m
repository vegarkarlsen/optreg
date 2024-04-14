% LQR
Q_LQR = 0.01*diag([3, 1, 0.05, 0.1]); %diag(diag(ones(mx)));
R_LQR = 10; %diag(diag(ones(mu)));

[K, S, CLP] = dlqr(A, B, Q_LQR, R_LQR);