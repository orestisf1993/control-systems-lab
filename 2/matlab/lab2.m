function lab2(a, z, t_s)

Vref_arduino = 5;
V_7805 = 5.5;

th_ref = 5;

omega_n = 4 / z / t_s;

T_m = 0.641;
k_mu = 1 / 36;
k_0 = 0.233;
k_T = 0.006472;
k_m = 135.8;

a_2 = omega_n^2;
a_1 = 2 * z * omega_n;

k_1 = -a_2 * T_m / (k_0 * k_mu * k_m);
k_2 = (a_1 * T_m - 1) / (k_T * k_m);
k_r = k_1;
fprintf('Starting controller with k_1 = %g, k_2 = %g, k_r = %g\n', ...
    k_1, k_2, k_r);

count = 0;
tic;
while true %TODO

    [x_1, x_2] = read_state(a, Vref_arduino, V_7805);
    u = -k_1 * x_1 + -k_2 * x_2 + k_r * th_ref;

    if mod(count, 100) == 0
        toc
        fprintf('%g %g\n', x_1, x_2);
        fprintf('k_1 * %g + k_2 * %g + k_r * %g = %g\n', x_1, x_2, th_ref, u);
    end

    u = -u; % AYTO!!!
    if u > 0
        analogWrite(a, 6, 0)
        feed = min(round(u/2*255/Vref_arduino), 255);
        analogWrite(a, 9, feed)
    else
        analogWrite(a, 9, 0)
        feed = min(round(-u/2*255/Vref_arduino), 255);
        analogWrite(a, 6, feed)
    end

    count = count + 1;
end

%TODO: stop on ctrl+c ?

end
