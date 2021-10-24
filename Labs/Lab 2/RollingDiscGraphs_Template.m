%% MMAN1300 Engineering Mechanics 1 - Rolling Disc Lab 3
% MATLAB Code Template

% Author: Daniel Wong
% Date Written: 01/07/2018

%% Initial Parameters
m = 11.6;       % Total Mass of Disc and Axles [kg]
r = 0.01;       % Radius towards Instant Centre [m]
I_o = 0.1237;     % Moment of Inertia about Instant Centre [mm^4]
theta = 4.5;    % Slope Angle of Ramp [Degrees]
g = 9.81;      % Acceleration due to Gravity [ms^-2]
L = 1.6;         % Length of Angled Slope [m]

%% Experimental Data at Recorded Intervals
eX = [ 0.2, 0.4, 0.6, 0.8, 1.0 ]; % Experimental Displacement
eA = [ 1, 1, 1, 1, 1 ];           % Experimental Acceleration
eTime = [ 5, 10, 15, 20, 25 ];   % Measured Time

%% Calculations for Plot
a = (m*g*sind(theta)*r^2)/(I_o); % Calculating Linear Acceleration of Disc

vecTime = linspace(0,20,2000);  % Vector of Time with 20 Seconds Divided into 2000 Steps
x = 0.5 * a .* vecTime .^ 2; % Calculate Theoretical Displacement with Constant Acceleration

% Align and Trim the Theoretical Graph with Experimental Data
lastIndex = find(vecTime < eTime(end),1,'last');
vecTime = vecTime(1:lastIndex);
x = x(1:lastIndex);

%% Plotting the Graph of Displacement against Time
figure(1);
hold on;
% Plotting Curves
plot_tX = plot(vecTime, x, 'Color', [0 0 1], 'LineStyle', '-');   % Plotting Theoretical Curve
% Note that with Experimental Data, you can use curve fitting tools to plot
% lines of best fit within the graph viewer.
plot_eX = plot([0 eTime],[ 0 eX] , 'x'); % Plotting Experimental Data
axis( [0 eTime(end) 0 x(end)] );    % Defining Axes Boundaries
lgd1 = legend([plot_tX, plot_eX],{'Theoretical', 'Experimental'}, 'Location','NorthWest');    % Legend
% Graph Labels
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Displacement of the Rolling Disc Against Time');