function [x_1, x_2] = read_state(a, Vref_arduino, V_7805) %TODO x

velocity = analogRead(a, 3);
position = analogRead(a, 5);
x_1 = 3 * Vref_arduino * position / 1023;
x_2 = 2 * (2 * velocity * Vref_arduino / 1023 - V_7805);

end
