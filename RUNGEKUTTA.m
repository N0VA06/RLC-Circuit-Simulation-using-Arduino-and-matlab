% RLC Circuit Simulation using Runge-Kutta Method
% Prompt user for input
R = input('Enter the resistance (R): ');
L = input('Enter the inductance (L): ');
C = input('Enter the capacitance (C): ');
% Input voltage function (you can modify this as needed)
V = @(t) 1; % Example: constant voltage of 1V
% System of first-order ODEs
f = @(t, Y) [Y(2); (1/L)*(V(t) - R*Y(2) - Y(1)/C)];
% Time settings
t_start = 0;
t_end = 10; % Adjust the end time as needed
h = 0.1; % Time step
% Initial conditions
initial_conditions = [0; 0]; % Initial current and its derivative
% Runge-Kutta method
t_values = t_start:h:t_end;
Y = zeros(2, length(t_values));
Y(:, 1) = initial_conditions;

for i = 1:(length(t_values)-1)
    t = t_values(i);
    Y(:, i+1) = runge_kutta_step(t, Y(:, i), h, f);
end
% Plot the results
figure;
subplot(2, 1, 1);
plot(t_values, Y(1, :));
xlabel('Time');
ylabel('Current (A)');
title('Current vs Time');

subplot(2, 1, 2);
plot(t_values, Y(2, :));
xlabel('Time');
ylabel('Voltage Across Inductor (V)');
title('Voltage Across Inductor vs Time');

function Y_next = runge_kutta_step(t, Y, h, f)
    k1 = h * f(t, Y);
    k2 = h * f(t + h/2, Y + k1/2);
    k3 = h * f(t + h/2, Y + k2/2);
    k4 = h * f(t + h, Y + k3);
    
    Y_next = Y + (k1 + 2*k2 + 2*k3 + k4)/6;
end