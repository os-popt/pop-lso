function poPlotContour(name, x, y, levels)
% Plot the contour of the 2-dimensional function.
%
% Input ->
%   name   : problem name, specified as a character vector or a string scalar.
%   x      : x-coordinates, specified as a vector.
%   y      : y-coordinates, specified as a vector.
%   levels : contour levels, specified as a vector.
%            If no value is specified, then do not show contour levels.
%
% Reference:
%   https://www.mathworks.com/help/matlab/ref/contourf.html
if ~poIsProblemName(name)
    error('the input `name` should be a character vector or a string scalar.');
end

if ~isvector(x) || ~isnumeric(x)
    error('the input `x` should be a vector.');
end
if iscolumn(x)
    x = x';
end

if ~isvector(y) || ~isnumeric(y)
    error('the input `y` should be a vector.');
end
if iscolumn(y)
    y = y';
end

if nargin < 4
    isShowLevels = false;
else
    isShowLevels = true;
end

[X, Y] = meshgrid(x, y);
Z = Inf * ones(size(X));
for r = 1 : size(X, 1)
    for c = 1 : size(X, 2)
        Z(r, c) = feval(name, [X(r, c); Y(r, c)]);
    end
end

if isShowLevels
    if ~isvector(levels) || ~isnumeric(levels)
        error('the input `levels` should be a vector.');
    end
    if iscolumn(levels)
        levels = levels';
    end
    [C, h] = contourf(X, Y, Z, levels, ...
        'ShowText', 'on', 'EdgeColor', 'white', 'LineWidth', 1.75);
    clabel(C, h, 'FontSize', 12, 'Color', 'white');
else
    contourf(X, Y, Z, ...
        'EdgeColor', 'white', 'LineWidth', 1.75);
end
colormap(cool);
title(name);
xlabel('x_1');
ylabel('x_2');
savefig(sprintf('poPlotContour-%s.fig', name));
end
