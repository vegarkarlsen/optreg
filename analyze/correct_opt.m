function sig = correct_opt(data, to, from, start_val)
    sig = resample(data, to, from);
    ts = 35/(to-1);
    correct_to = 5/ts;
    sig(1:correct_to) = start_val;
end
