params = config();
stop_motor(a);
count = 0;
while true
    [x_1, x_2] = read_state(a, params.Vref_arduino, params.V_7805);
    fprintf('Position: %g\n', x_1);
    if abs(x_1-2) < 0.05
        count = count + 1;
        if count >= 10
            fprintf('Done!\n');
            break
        end
        fprintf('Target reached: %d\n', count);
    else
        count = 0;
    end
end
