z = 1.1;
t_s = 1;

omega = 246.93; % -- rad/s
th_ref{1} = @(t) (5 + 2 * sin(omega*t));
print_position
lab2(a, z, t_s, th_ref{1});
plot_results(th_ref{1});

omega = 10;
th_ref{2} = @(t) (5 + 2 * sin(omega*t));
print_position
lab2(a, z, t_s, th_ref{2});
plot_results(th_ref{2});

omega = 3;
th_ref{3} = @(t) (5 + 2 * sin(omega*t));
print_position
lab2(a, z, t_s, th_ref{3});
plot_results(th_ref{3});
