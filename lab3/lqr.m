% LQR
% travel, travel_rate, ptich, pitch_rate
Q_LQR = diag([3, 0.1, 0.05, 0.1]);
R_LQR = 0.1;

[K, S, CLP] = dlqr(A, B, Q_LQR, R_LQR);