
load("optimal/L1_q_0.12.mat")
d1 = x_out;
load("optimal/L1_q_1.mat")
d2 = x_out;
load("optimal/L1_q_1.2.mat")
d3 = x_out;
load("optimal/L1_q_12.mat")
d4 = x_out;

ts = 0.25;
t = 0:ts:ts*140;

figure(1)
plot(t, d1(1,:))
hold on
plot(t, d2(1,:))
plot(t, d3(1,:))
plot(t, d4(1,:))



