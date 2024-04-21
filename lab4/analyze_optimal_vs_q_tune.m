
folder = "QP_q_tune/";
files = [
    "L4_q1_0.12_q2_0.12.mat"
    "L4_q1_1_q2_0.01.mat"
    "L4_q1_1_q2_0.12.mat"
    "L4_q1_1_q2_2.mat"
];
n_files = size(files, 1);

optimal_datapoints = 80;
test_datapoints = 10000; % 10000*Ts = 20 sec


travel = NaN(n_files, optimal_datapoints+1);
travel_rate = NaN(n_files, optimal_datapoints+1);
pitch = NaN(n_files, optimal_datapoints+1);
pitch_rate = NaN(n_files, optimal_datapoints+1);
elevation = NaN(n_files, optimal_datapoints+1);
elevation_rate = NaN(n_files, optimal_datapoints+1);

% load data from all files
for f = 1:n_files
    load(strcat(folder,files(f)))
    for i = 1:optimal_datapoints+1
        travel(f,i) = ans(2,i*125);
        travel_rate(f,i) = ans(3,i*125);
        pitch(f,i) = ans(4,i*125);
        pitch_rate(f,i) = ans(5,i*125);
        elevation(f,i) = ans(6,i*125);
        elevation_rate(f,i) = ans(7,i*125);
    end
end

load("optimal/L4_q1_1_q2_1.mat")

ts = 0.25;
t = 0:ts:ts*optimal_datapoints;

figure(3)
subplot(2,1,1)
plot(t, x_out(5,:).')
hold on
plot(t,elevation)
grid
legend
hold off

subplot(2,1,2)
plot(t, x_out(1,:).')
hold on
plot(t, travel)
grid
legend
hold off

% figure(1)
% plot(t,elevation)
% grid
% load("optimal/L4_q1_1_q2_1.mat")
