function control_cleanup(a, save_mat)
global x;
global idx;
x = x(1:idx,:);

fprintf('Stopping control\n');
stop_motor(a);
if save_mat
    filename = [datestr(now, 'yyyy-mm-dd_HHMMSS'), '.mat'];
    fprintf('Saving results in %s\n', filename);
    save(filename, 'x');
end
end
