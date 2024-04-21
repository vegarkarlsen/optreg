function [travel, travel_rate, pitch, pitch_rate, elevation, elevation_rate] = load_data(files, data_points, folder)

    global ans
    n_files = size(files, 1);

    for i = 1:n_files
        load(strcat(folder,files(i)));
        t = ans(1,:);
        travel(i,:) = ans(2,:);
        travel_rate(i,:) = ans(3,:);
        pitch(i,:) = ans(4,:);
        pitch_rate(i,:) = ans(5,:);
        elevation(i,:) = ans(6,:);
        elevation_rate(i,:) = ans(7,:);
    end
end
