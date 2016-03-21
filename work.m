% ECOR2606 - Lab 8

% Part 1

function [ ] = work() % void function

load data.txt;
x = data(:, 1);
y = data(:, 2);

p = polyfit(x, y, 3);

xplot = linspace(x(1), x(end), 100);
yplot = polyval(p, xplot);

fprintf('The best fit curve is %.10f * x^3 + %.10f * x^2 + %.4f * x + %.10f\n', p) 

f = @(x) p(1) * x.^3 + p(2) * x.^2 + p(3) * x + p(4);
r = correlate(x, y, f);
fprintf('The correlation coefficient is %.10f\n', r);

f2 = @(x) f(x) - 0.065;
x_set = fzero(f2, [6 12]);
fprintf('The x value at 0.065 is %.10f\n', x_set);

plot(x, y, 'o', xplot, yplot, 'MarkerSize', 10);
hold on;
plot(x_set, f(x_set), 'O'); % marker
hold off;

% Part 2 - Text 13.31:

u = [1.787 1.519 1.307 1.002 0.7975 0.6529];
T = [0 5 10 20 30 40];
T = T + 273.15; % change to K
[D B] = fitExp(T, u);

end

function [ D, B ] = fitExp(T, u) % void function

D = [0];
B = [0];

% func_u = @(u) D * exp(1)^(B)

% polyfit(x, y, 1);
% exp(1)

end
