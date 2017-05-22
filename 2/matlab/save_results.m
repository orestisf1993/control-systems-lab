if ~exist('save_mat', 'var') || save_mat % Save by default
    filename = [datestr(now, 'yyyy-mm-dd_HHMMSS'), '.mat'];
    x = x(1:idx,:);
    fprintf('Saving results in %s\n', filename);
    save(filename);
end
