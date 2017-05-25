function lab3(a, z, t_s, save_mat) %#ok<INUSD>

params = config();
omega_n = 4 / z / t_s;
[a_1, a_2, a_3] = find_desired(z, omega_n);

k_1 = -a_2 * params.T_m / (params.k_0 * params.k_mu * params.k_m);
k_2 = (a_1 * params.T_m - 1) / (params.k_T * params.k_m);
k_i = -a_3 * params.T_m / (params.k_0 * params.k_mu * params.k_m);
fprintf('Starting controller with k_1 = %g, k_2 = %g, k_i = %g\n', k_1, k_2, k_i);

max_size = fix(t_s*550); % Arbitary max size multiplier.
x = zeros(max_size, 5);
finishup = onCleanup(@() stop_motor(a));
last = 0;
[z, ~] = read_state(a, params.Vref_arduino, params.V_7805);
z = -z;
tic;
for idx = 1:max_size
    [x_1, x_2] = read_state(a, params.Vref_arduino, params.V_7805);
    t = toc;

    dt = t - last;
    z_dot = x_1 - 5;
    dz = z_dot * dt;
    z = z + dz;

    u = -k_1 * x_1 - k_2 * x_2 - k_i * z;
    x(idx,:) = [t, x_1, x_2, z, u];

    if mod(idx-1, 100) == 0
        toc
        fprintf('%g %g %g\n', x_1, x_2, z);
    end

    set_state(a, u, params.Vref_arduino);
    last = t;
end
save_results
end

function [a_1, a_2, a_3] = find_desired(z, omega)
alpha = [1, 2 * z * omega, omega^2];
poles = roots(alpha);
poles = [poles; 4 * min(poles(1), poles(2))];
alpha = poly(poles);
a_1 = alpha(2);
a_2 = alpha(3);
a_3 = alpha(4);
end
