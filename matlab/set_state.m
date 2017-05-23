function set_state(a, u, vref)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

u = -u; %TODO
if u > 0
    analogWrite(a, 6, 0)
    feed = min(round(u/2*255/vref), 255);
    analogWrite(a, 9, feed)
else
    analogWrite(a, 9, 0)
    feed = min(round(-u/2*255/vref), 255);
    analogWrite(a, 6, feed)
end
end
