% LQR
Q_LQR = diag([12, 10.13, 3.65, 14.6]);
R_LQR = 3.65;

[K, S, CLP] = dlqr(A, B, Q_LQR, R_LQR);