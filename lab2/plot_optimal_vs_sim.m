
% load sim data
load("rad/L1_q_1.mat")
sim_data = NaN(6,141);
for i = 1:140
    sim_data(:,i) = ans(2:7,125*i);
end
ts = 0.25;

% load optimal and resample to match sim data
load("optimal/L1_q_1.mat")
travel_opt = x_out(1,:);

t = 0:ts:ts*140;

figure(1)
subplot(511)
stairs(t,u),grid
ylabel('u')
title("q = 1")

subplot(512)
plot(t,x_out(1,:))
hold on
plot(t, sim_data(1,:))
grid
ylabel('\lambda')
legend('\lambda*', '\lambda')
hold off

subplot(513)
plot(t,x_out(2,:))
hold on
plot(t, sim_data(2,:))
grid
ylabel('r')
legend('r*', 'r')
hold off

subplot(514)
plot(t,x_out(3,:))
hold on
plot(t, sim_data(3,:))
grid
ylabel('p')
legend('p*', 'p')
hold off

subplot(515)
plot(t,x_out(4,:))
hold on
plot(t, sim_data(4,:))
grid
ylabel('p_{dot}')
legend('p_{dot}*', 'p_{dot}')
hold off






