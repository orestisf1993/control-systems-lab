x_1 = [];
x_2 = [];
while true
    analogWrite(a, 9, 0)
    analogWrite(a, 6, 100)
    [x_1(end+1), x_2(end+1)] = read_state(a, 5, 5.5);
end
