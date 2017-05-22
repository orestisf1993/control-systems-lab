function params = config()
keys = {'Vref_arduino', 'V_7805', 'T_m', 'k_mu', 'k_0', 'k_T', 'k_m'};
values = {5, 5.5, 0.641, 1/36, 0.233, 0.006472, 135.8};
params = cell2struct(values, keys, 2);
end