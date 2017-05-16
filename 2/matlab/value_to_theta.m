function value_arduino = value_to_theta(position, Vref_arduino)%TODO:rename
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

value_arduino = 3 * Vref_arduino * position / 1023;

end
