% LQR
Q_LQR = diag([12, 10.13, 3.65, 14.6, 25, 625]);
R_LQR = diag([3.65 25]);

[K_LQR, S, CLP] = dlqr(A, B, Q_LQR, R_LQR);