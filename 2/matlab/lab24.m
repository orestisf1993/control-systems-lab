z = 1.1;
t_s = 1;

omega = 246.93; % -- rad/s
th_ref = @(t) (5 + 2 * sin(omega*t));
print_position
lab2(a, z, t_s, th_ref);
plot_results(th_ref);

omega = 10;
th_ref = @(t) (5 + 2 * sin(omega*t));
print_position
lab2(a, z, t_s, th_ref);
plot_results(th_ref);

omega = 3;
th_ref = @(t) (5 + 2 * sin(omega*t));
print_position
lab2(a, z, t_s, th_ref);
plot_results(th_ref);
