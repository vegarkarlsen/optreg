% load sim data

elevation = NaN(1,81);

load("LQR_TUNE/L4_Q_12_10.13_3.65_14.6_25_50_R_3.65_25.mat")
ts_sim = 2e-3;
points = 17501;
sim_time = 20;
newpoints = sim_time/ts_sim;
data_raw = ans(:,1:newpoints); % match 20 second from the optimal calcualtion

% t_sim = ans(1,:);
% elevation_raw = ans(6,:);
% 
% for i = 1:80
%     elevation(1,i) = elevation_raw(218*i);
% end
% 
% ts = 0.25;
% points = 80;
% t = 0:ts:ts*points;
% 
% figure(1)
% plot(t, elevation)
% 
% figure(2)
% plot(t_sim, elevation_raw)
% 
