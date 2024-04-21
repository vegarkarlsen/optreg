
addpath(genpath("/home/hurodor/school/optreg/analyze/"))


% elevation(i,:) = ans(6,:);
% elevation_rate(i,:) = ans(7,:);

% load sim data
load("rad/L1_q_0.12.mat")
t = ans(1,:);
travel(1,:) = ans(2,:);
travel_rate(1,:) = ans(3,:);
pitch(1,:) = ans(4,:);
pitch_rate(1,:) = ans(5,:);

% load optimal and resample to match sim data
load("optimal/L1_q_0.12.mat")
u_opt = correct_opt(u, 17501,141, 0);
travel_opt = correct_opt(x_out(1,:), 17501,141, pi);
travel_rate_opt = correct_opt(x_out(2,:), 17501,141, 0);
pitch_opt = correct_opt(x_out(3,:), 17501,141, 0);
pitch_rate_opt = correct_opt(x_out(4,:), 17501,141, 0);


figure(1)
subplot(511)
plot(t, u_opt)


subplot(512)
plot(t,travel_opt,'m'),
grid

ylabel('lambda')

% subplot(813)
% plot(t,x2,'m',t,x2','mo'),grid
% ylabel('r')
% 
% subplot(815)
% plot(t,x3,'m',t,x3,'mo'),grid
% ylabel('p')
% 
% subplot(816)
% plot(t,x4,'m',t,x4','mo'),grid
% xlabel('tid (s)'),ylabel('pdot')
% 
% 
% subplot(817)
% plot(t,x5,'m',t,x5','mo'),grid
% ylabel('e')
% 
% 
% subplot(818)
% plot(t,x6,'m',t,x6','mo'),grid
% xlabel('tid (s)'),ylabel('edot')
% 

