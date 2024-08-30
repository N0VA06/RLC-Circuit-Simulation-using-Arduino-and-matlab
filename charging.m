% RLC Circuit with Capacitor - Charging and Discharging

% Input values
R = 16;        % Resistance in ohms
L = 1;        % Inductance in henries
C = 0.05;      % Capacitance in farads
V = 10;         % Voltage in volts

% Time vector
dt = 0.001;     % Time step
t_charging = 0:dt:2;    % Charging time from 0 to 2 seconds
t_discharging = 2:dt:4;  % Discharging time from 2 to 4 seconds

% Initialize arrays to store current and voltage values
I_charging = zeros(size(t_charging));
V_C_charging = zeros(size(t_charging));

I_discharging = zeros(size(t_discharging));
V_C_discharging = zeros(size(t_discharging));

% Initial conditions
I_charging(1) = 0;
V_C_charging(1) = 0;

I_discharging(1) = 0;
V_C_discharging(1) = V;

% Charging - Euler's method
for i = 1:length(t_charging)-1
    dI_dt = (V - R * I_charging(i) - V_C_charging(i) / C) / L;
    dV_C_dt = I_charging(i) / C;
    
    I_charging(i+1) = I_charging(i) + dI_dt * dt;
    V_C_charging(i+1) = V_C_charging(i) + dV_C_dt * dt;
end

% Discharging - Euler's method
for i = 1:length(t_discharging)-1
    dI_dt = (V - R * I_discharging(i) - V_C_discharging(i) / C) / L;
    dV_C_dt = I_discharging(i) / C;
    
    I_discharging(i+1) = I_discharging(i) + dI_dt * dt;
    V_C_discharging(i+1) = V_C_discharging(i) - dV_C_dt * dt;
end

% Plotting charging and discharging current vs. time
figure;
subplot(2, 1, 1);
plot(t_charging, I_charging, 'b', 'LineWidth', 2);
title('Charging - Current vs. Time');
xlabel('Time (s)');
ylabel('Current (A)');
grid on;

subplot(2, 1, 2);
plot(t_discharging, I_discharging, 'r', 'LineWidth', 2);
title('Discharging - Current vs. Time');
xlabel('Time (s)');
ylabel('Current (A)');
grid on;

% Plotting charging and discharging voltage vs. time
figure;
subplot(2, 1, 1);
plot(t_charging, V_C_charging, 'b', 'LineWidth', 2);
title('Charging - Voltage across Capacitor vs. Time');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;

subplot(2, 1, 2);
plot(t_discharging, V_C_discharging, 'r', 'LineWidth', 2);
title('Discharging - Voltage across Capacitor vs. Time');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;