if ~exist('a', 'var')
    a = init_arduino();
end
if ~exist('z', 'var')
    z = 1.1;
end
if ~exist('t_s', 'var')
    t_s = 1;
end

lab3(a, z, t_s);
