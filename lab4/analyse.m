
addpath(genpath("QP_q_tune"))
dataFiles = [
    "L4_q1_0.12_q2_0.12.mat"
    "L4_q1_1_q2_0.12.mat"
    "L4_q1_1_q2_2.mat"
    "L4_q1_1_q2_0.01.mat"];

n_files = size(dataFiles, 1);

travel = NaN(n_files, 17501);
travel_rate = NaN(n_files, 17501);
pitch = NaN(n_files, 17501);
pitch_rate = NaN(n_files, 17501);
elevation = NaN(n_files, 17501);
elevation_rate = NaN(n_files, 17501);



for i = 1:size(dataFiles)
   load(dataFiles(i));
   travel(i,:) = ans(2,:);
   travel_rate(i,:) = ans(3,:);
   pitch(i,:) = ans(4,:);
   pitch_rate(i,:) = ans(5,:);
   elevation(i,:) = ans(6,:);
   elevation_rate(i,:) = ans(7,:);
end
t = ans(1,:);

figure(1)
plot(t, elevation(:,:))
hold on

grid
legend




