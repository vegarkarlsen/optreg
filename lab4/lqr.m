% LQR
Q_LQR = diag([20, 1, 0.5, 1, 40, 10]); %diag(diag(ones(mx)));
R_LQR = diag([0.1 0.1]);

[K_LQR, S, CLP] = dlqr(A, B, Q_LQR, R_LQR);