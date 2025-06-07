% Input Data
q_flux = 800;                   % W/m²
total_surface_area = 2.4;       % m² (top + bottom + left + right)
Q_input = q_flux * total_surface_area;   % W

Q_removed = 1920;               % W (Fluent output)
T_panel = 374.60;               % K (Average panel temperature)
T_inlet = 300.00;               % K (Air temperature)

% Cooling Efficiency
eta = Q_removed / Q_input;

% Heat Transfer Coefficient (h)
delta_T = T_panel - T_inlet;
h = Q_removed / (total_surface_area * delta_T);

% Outputs
fprintf('--- CFD Heat Transfer Results ---\n');
fprintf('Q_input: %.2f W\n', Q_input);
fprintf('Q_removed: %.2f W\n', Q_removed);
fprintf('Cooling Efficiency: %.2f%%\n', eta * 100);
fprintf('Heat Transfer Coefficient h: %.2f W/m²K\n', h);

% Plot: Heat Comparison
figure;
bar([Q_input, Q_removed], 0.4);
set(gca, 'XTickLabel', {'Q_{input}', 'Q_{removed}'});
ylabel('Heat Transfer (W)');
title('Input vs Removed Heat');
grid on;