% spring_stiffness.m
% Calculate spring stiffness from mass-displacement data

clc % clear command window
clear % clear all variables
close all % close all figures

% Assuming case where spring hangs from ceiling

%   F_s
%    ↑
%    |
%  ooooo
%  o   o
%  ooooo
%    |
%    ↓
%   F_g

% There are 2 forces: Spring force and gravity

% Sum of F = 0
% F_s = F_g
% kx = mg
% k = g*(m/x)


% Constants
g = 9.81; % m/s^2

% Given data

m = [10 11 12 13 14 15 16]; % kg
x = [1.14 1.25 1.37 1.48 1.59 1.71 1.82]; % m


% Find how many data points there are
n = length(m);

% Create vector to store k-values in:
k_values = zeros(1,n); % [0 0 0 ... n]

% Loop from 1 to n
for i = 1:n
    k_values(i) = (m(i)*g)/x(i);
end

% Calculate mean
k_avg = mean(k_values);

% Display individual k values
fprintf('Individual k values (N/m): \n');
fprintf('%f ',k_values);

% Display mean spring stiffness (k_avg)
fprintf('\nk_mean = %f N/m \n',k_avg)

% Plot Force vs Displacement plot
F = m*g;
figure; % open new figure window
plot(x,F,'x'); % x,y
hold on;
plot(x,k_avg*x,'-r'); % solid red line

xlabel('Displacement x (m)');
ylabel('Force F (N)');

title('Spring Force vs Displacment');
legend('Data', 'Mean k fit');
grid minor;
