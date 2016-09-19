function plotData(x, y)
%PLOTDATA Plots the data points X into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold all;

% Plot Examples
plot(x, y, 'k+','LineWidth', 2, ...
'MarkerSize', 7);

hold off;

end
