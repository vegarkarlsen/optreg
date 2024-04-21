clear

folder = "LQR_tune/";
files = [
	% "L3_Q_3_0.1_0.05_0.1_R_0.1.mat"           % Denne er best, men kokt
	% "L3_Q_0.41_10.13_3.65_14.6_R_3.65.mat"    % Brysons
	% "L3_Q_1_1_1_1_R_1.mat"                      % Intial
	% "L3_Q_12_1_1_1_R_2.mat"
    "L3_Q_12_1_1_1_R_0.5.mat"                   % Beste funnet selv
    % "L3_Q_12_0.5_0.5_0.5_R_0.5.mat"
	% "L3_Q_1_10.13_3.65_14.6_R_3.65.mat"
	"L3_Q_3_10.13_3.65_14.6_R_3.65.mat"
	"L3_Q_5_10.13_3.65_14.6_R_3.65.mat"
	"L3_Q_8_10.13_3.65_14.6_R_3.65.mat"
	"L3_Q_12_10.13_3.65_14.6_R_3.65.mat"        % Funnet med å bare inkrementere fra brysons rule
	% "L3_Q_12_10_5_14.6_R_3.65.mat"
    % "L3_Q_12_10_5_5_R_3.65.mat"
    % "L3_Q_12_10_5_5_R_2.mat"
    % "L3_Q_12_10_5_5_R_10.mat"
    % "L3_Q_12_10_20_14.6_R_3.65.mat"
    % "L3_Q_12_10_2_14.6_R_3.65.mat"
    % "L3_Q_12_5_3.65_14.6_R_3.65.mat"
    % "L3_Q_12_20_3.65_14.6_R_3.65.mat"
	% "L3_Q_20_10.13_3.65_14.6_R_3.65.mat"
];

n_files = size(files, 1);

optimal_datapoints = 140;
test_datapoints = 17501; % 10000*Ts = 20 sec

travel = NaN(n_files, optimal_datapoints+1);
% travel_rate = NaN(n_files, optimal_datapoints+1);
pitch = NaN(n_files, optimal_datapoints+1);
% pitch_rate = NaN(n_files, optimal_datapoints+1);
% elevation = NaN(n_files, optimal_datapoints+1);
% elevation_rate = NaN(n_files, optimal_datapoints+1);

% load data from all files
for f = 1:n_files
    load(strcat(folder,files(f)))
    for i = 1:optimal_datapoints
        travel(f,i) = ans(2,i*125);
        % travel_rate(f,i) = ans(3,i*125);
        pitch(f,i) = ans(4,i*125);
        % pitch_rate(f,i) = ans(5,i*125);
        % elevation(f,i) = ans(6,i*125);
        % elevation_rate(f,i) = ans(7,i*125);
    end
end

load("optimal/L1_q_1.2.mat")

ts = 0.25;
t = 0:ts:ts*optimal_datapoints;

figure(2)
subplot(2,1,1)
plot(t, [x_out(1,:); travel])
% legend("\lambda*","\lambda brysons", "\lambda intiial", "\lambda best")
legend
grid
title("travel")

subplot(2,1,2)
plot(t, [x_out(3,:); pitch])
% legend("p*", "p brysons", "p initial", "p best")
legend
grid
title("pitch")

