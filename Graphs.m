% Define parameters
A1 = 1;
A2 = 0.5;
A3 = 0.8;

% Given values for RLC
R = input('Resistance');  % ohms
L = input('Inductance');  % henries (25mH)
C = input('Capacitance');  % farads (0.1uF)
%(50,25e-3,0.1e-6)

% Define time vector
t = linspace(0, 0.01, 1000);  % Adjust time range as needed

% Equation 1: i(t) = A1 exp(–Rt/2L) · sin(ω0 t)
omega0 = 1 / sqrt(L * C);
i1 = A1 * exp(-R * t / (2 * L)) .* sin(omega0 * t);

% Plot the graph
figure;
subplot(3, 1, 1);
plot(t, i1);
title('Under Damped');
xlabel('Time (s)');
ylabel('Current');

% Equation 2: i(t) = A2 t exp(–Rt/2L)
i2 = A2 * t .* exp(-R * t / (2 * L));

% Plot the graph
subplot(3, 1, 2);
plot(t, i2);
title('Critical Damped');
xlabel('Time (s)');
ylabel('Current');

% Equation 3: i(t) = -A3 [ exp(–t/RC) – exp(–Rt/L) ]
i3 = -A3 * (exp(-t / (R * C)) - exp(-R * t / L));

% Plot the graph
subplot(3, 1, 3);
plot(t, i3);
title('Over Damped');
xlabel('Time (s)');
ylabel('Current');

 