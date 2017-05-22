% omega = 2358; % -- rpm
omega = 246.93; % -- rad/s
z = 1.1;
t_s = 2;
th_ref = @(t) (5 + 2 * sin(omega*t));
lab2(a, z, t_s, th_ref);
