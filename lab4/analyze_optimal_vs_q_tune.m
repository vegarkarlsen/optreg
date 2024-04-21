
test_folder = "QP_q_tune/";
optimal_folder = "optimal/";
files = [
    "L4_q1_0.12_q2_0.12.mat"
    "L4_q1_1_q2_0.01.mat"
    "L4_q1_1_q2_0.12.mat"
    "L4_q1_1_q2_2.mat"
];

n_files = size(files, 1);

optimal_datapoints = 80;
test_datapoints = 10000; % 10000*Ts = 20 sec


% travel = NaN(n_files, optimal_datapoints+1);
% travel_rate = NaN(n_files, optimal_datapoints+1);
% pitch = NaN(n_files, optimal_datapoints+1);
% pitch_rate = NaN(n_files, optimal_datapoints+1);
elevation = NaN(n_files, optimal_datapoints+1);
% elevation_rate = NaN(n_files, optimal_datapoints+1);

elevation_opt = NaN(n_files, optimal_datapoints+1);

% load test data from all files
for f = 1:n_files
    load(strcat(test_folder,files(f)))
    for i = 1:optimal_datapoints+1
        travel(f,i) = ans(2,i*125);
        travel_rate(f,i) = ans(3,i*125);
        pitch(f,i) = ans(4,i*125);
        pitch_rate(f,i) = ans(5,i*125);
        elevation(f,i) = ans(6,i*125);
        elevation_rate(f,i) = ans(7,i*125);
    end
end


% load optimal path from all data
for f = 1:n_files
    load(strcat(optimal_folder,files(f))) 
    travel_opt(f,:) = x_out(1,:);
    travel_rate_opt(f,:) = x_out(2,:);
    pitch_opt(f,:) = x_out(3,:);
    pitch_rate_opt(f,:) = x_out(4,:);
    elevation_opt(f,:) = x_out(5,:);
    elevation_rate_opt(f,:) = x_out(6,:); 
end

ts = 0.25;
t = 0:ts:ts*optimal_datapoints;

% from tests
figure(1)
subplot(3,2,1)
plot(t, travel)
grid
legend("r1=0.12, 0.12", "r1=1, r2=0.01", "r1=1, r2=0.12", "r1=1, r2=2")
title("travel")

subplot(3,2,2)
plot(t, travel_opt)
grid
legend
legend("r1=0.12, 0.12", "r1=1, r2=0.01", "r1=1, r2=0.12", "r1=1, r2=2")
title("travel*")

subplot(3,2,3)
plot(t, pitch)
grid
legend("r1=0.12, 0.12", "r1=1, r2=0.01", "r1=1, r2=0.12", "r1=1, r2=2")
legend
title("pitch")

% optimal
subplot(3,2,4)
plot(t, pitch_opt)
grid
legend
legend("r1=0.12, 0.12", "r1=1, r2=0.01", "r1=1, r2=0.12", "r1=1, r2=2")
title("pitch*")

subplot(3,2,5)
plot(t, elevation)
grid
legend
title("elevation")

subplot(3,2,6)
plot(t, elevation_opt)
grid
legend
legend("r1=0.12, 0.12", "r1=1, r2=0.01", "r1=1, r2=0.12", "r1=1, r2=2")
title("elevation*")
