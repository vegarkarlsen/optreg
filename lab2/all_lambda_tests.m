% load sim data

travel = NaN(3,141);


load("rad/L1_q_0.12.mat")
for i = 1:140
    travel(1,i) = ans(2,125*i);
end

load("rad/L1_q_1.2.mat")
for i = 1:140
    travel(2,i) = ans(2,125*i);
end

load("rad/L1_q_12.mat")
for i = 1:140
    travel(3,i) = ans(2,125*i);
end

ts = 0.25;
t = 0:ts:ts*140;

figure(1)
plot(t, travel)
legend('q = 0.12', 'q = 1.2', 'q = 12')
grid


