function t = plotter(opt, sim)

    t = lenght(opt);
    for i = 1:size(opt,1)

        plot(t, [opt(i,:) sim(i,:)])
    end
end
