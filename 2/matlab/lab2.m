function lab2(a, z, t_s, th_ref)
global x;
global idx;

if ~exist('th_ref', 'var')
    th_ref = @(~) 5;
end
omega_n = 4 / z / t_s;
a_2 = omega_n^2;
a_1 = 2 * z * omega_n;

params = config();
k_1 = -a_2 * params.T_m / (params.k_0 * params.k_mu * params.k_m);
k_2 = (a_1 * params.T_m - 1) / (params.k_T * params.k_m);
k_r = k_1;
fprintf('Starting controller with k_1 = %g, k_2 = %g, k_r = %g\n', k_1, k_2, k_r);

%TODO: decide max size.
max_size = 1000; % Arbitary max size.
x = zeros(max_size, 3);
finishup = onCleanup(@() control_cleanup(a));
tic;
for idx = 1:max_size
    [x_1, x_2] = read_state(a, params.Vref_arduino, params.V_7805);
    t = toc;
    th_ref_t = th_ref(t);
    x(idx,:) = [t, x_1, x_2];
    %TODO: just reverse if?
    u = -k_1 * x_1 - k_2 * x_2 + k_r * th_ref_t; % TODO: +- k_r?

    if mod(idx-1, 100) == 0
        toc
        fprintf('%g %g\n', x_1, x_2);
        fprintf('k_1 * %g + k_2 * %g + k_r * %g = %g\n', x_1, x_2, th_ref_t, u);
    end

    set_state(a, u, params.Vref_arduino);
end
end
