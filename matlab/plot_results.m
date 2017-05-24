function plot_results(th_ref, save_name, mat_name, linewidth)
%PLOT_RESULTS Create plots with the data contained in a .mat file.


%% Initialize
if ~exist('th_ref', 'var') || ...
        (~isa(th_ref, 'function_handle') && (~isnumeric(th_ref) || isempty(th_ref)))
    th_ref = 5;
end
if ~isa(th_ref, 'function_handle')
    th_ref = @(x) th_ref * ones(size(x));
end
if ~exist('mat_name', 'var')
    mat_name = dir('*.mat');
    [~, most_recent_idx] = max(vertcat(mat_name.datenum));
    mat_name = mat_name(most_recent_idx).name;
    warning('No filename given. Using latest file %s.', mat_name);
end
if ~exist('save_name', 'var') || isempty(save_name)
    save_name = mat_name;
end
if ~exist('linewidth', 'var')
    linewidth = 2;
end

%% Load data.
x = load(mat_name);
x = x.x;
pos = x(:, 2);
speed = x(:, 3);
if size(x, 2) == 5
    z = x(:, 4);
end
control = -x(:, end);
x = x(:, 1);
xlin = linspace(min(x), max(x));
fprintf('Got x of size %s\n', sprintf('%g ', size(x)));


%% Plot settings.
set(0,'defaultlinelinewidth', linewidth);
set(0,'defaultaxeslinewidth', linewidth);
set(0,'defaultpatchlinewidth', linewidth);

%% Create & save the plots.
f = new_figure(1, 2.2);
plot(xlin, th_ref(xlin), 'g');
plot(x, pos);
legend('\theta_{ref}', 'x_1', 'Location', 'best')
xlabel('Time (seconds)');
ylabel('Position (volt)');
savePlot(strcat(save_name, '-x_1'), f);

f = new_figure(1, 2.2);
plot(x, speed);
xlabel('Time (seconds)');
ylabel('Speed (volt)');
savePlot(strcat(save_name, '-x_2'), f);

f = new_figure(1, 2.2);
plot(x, control);
xlabel('Time (seconds)');
ylabel('Control');
axis tight;
savePlot(strcat(save_name, '-u'), f);
end

function [f] = new_figure(x, y)
%NEW_FIGURE Create a figure with my custom settings.

if ~exist('x', 'var')
    x = 1;
end
if ~exist('y', 'var')
    y = 1.1;
end

f = figure('visible', 'off', 'PaperType', 'a4', 'PaperOrientation', 'portrait', ...
    'PaperUnits', 'centimeters', 'PaperPosition', [0, 0, 21 / x, 29.7 / y], ...
    'PaperPositionMode', 'manual', 'Menubar', 'none', 'defaulttextinterpreter', 'latex', ...
    'units', 'normalized', 'outerposition', [0, 0, 1, 1]);
hold on;
end

function savePlot(filename, figure)
filename = strcat(filename, '.pdf');
print(filename, '-dpdf', '-painters', '-r0'); % If you want to ensure that your output
% format is a true vector graphics file, then specify the Painters renderer
close(figure);
end
