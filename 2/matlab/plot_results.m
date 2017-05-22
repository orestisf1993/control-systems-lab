function plot_results(filename)
%PLOT_RESULTS Create plots with the data contained in a .mat file.

if ~exist('filename', 'var')
    filename = dir('*.mat');
    [~, most_recent_idx] = max(vertcat(filename.datenum));
    filename = filename(most_recent_idx).name;
    warning('No filename given. Using latest file %s.', filename);
end

x = load(filename);
x = x.x;
fprintf('Got x of size %s\n', sprintf('%g ', size(x)));
f = new_figure(1, 2.2);
plot(x(:, 1), x(:, 2));
savePlot(strcat(filename, '-x_1'), f);

f = new_figure(1, 2.2);
plot(x(:, 1), x(:, 3));
savePlot(strcat(filename, '-x_2'), f);
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
print(filename, '-dpdf', '-painters', '-r0'); % If you want to ensure that your output
% format is a true vector graphics file, then specify the Painters renderer
close(figure);
end
