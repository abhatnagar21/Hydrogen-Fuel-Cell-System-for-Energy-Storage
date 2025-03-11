clc; clear; close all;

%% Hydrogen Fuel Cell System Simulation
% This script simulates hydrogen production via electrolysis, storage, and power conversion using a fuel cell.

%% System Parameters
solar_power = 5000; % Solar power available (W)
electrolyzer_efficiency = 0.75; % Electrolyzer efficiency
faraday_efficiency = 0.95; % Faraday efficiency
hydrogen_energy_density = 33.6; % Energy density of hydrogen (kWh/kg)
fuel_cell_efficiency = 0.6; % Fuel cell efficiency
battery_efficiency = 0.85; % Battery efficiency

%% Electrolysis: Hydrogen Generation
hydrogen_production = (solar_power * electrolyzer_efficiency * faraday_efficiency) / hydrogen_energy_density; % kg/h

%% Hydrogen Storage
storage_capacity = 5; % Max hydrogen storage capacity (kg)
stored_hydrogen = min(hydrogen_production, storage_capacity);

%% Fuel Cell Power Conversion
fuel_cell_output = stored_hydrogen * hydrogen_energy_density * fuel_cell_efficiency; % W

%% Battery Storage for Comparison
battery_output = solar_power * battery_efficiency; % W

%% Efficiency Comparison
fuel_cell_total_efficiency = fuel_cell_efficiency * electrolyzer_efficiency * faraday_efficiency;

%% Visualization
figure;
subplot(3,1,1);
bar([fuel_cell_total_efficiency, battery_efficiency]);
set(gca, 'xticklabel', {'Fuel Cell System', 'Battery Storage'});
title('Efficiency Comparison');
ylabel('Efficiency (%)'); grid on;

subplot(3,1,2);
bar([fuel_cell_output, battery_output]);
set(gca, 'xticklabel', {'Fuel Cell Output', 'Battery Output'});
title('Power Output Comparison');
ylabel('Power (W)'); grid on;

subplot(3,1,3);
bar([hydrogen_production, stored_hydrogen]);
set(gca, 'xticklabel', {'Hydrogen Produced', 'Hydrogen Stored'});
title('Hydrogen Production & Storage');
ylabel('kg/h'); grid on;

%% Display Results
disp(['Hydrogen Produced: ', num2str(hydrogen_production), ' kg/h']);
disp(['Stored Hydrogen: ', num2str(stored_hydrogen), ' kg']);
disp(['Fuel Cell Power Output: ', num2str(fuel_cell_output), ' W']);
disp(['Battery Power Output: ', num2str(battery_output), ' W']);
disp(['Fuel Cell System Efficiency: ', num2str(fuel_cell_total_efficiency*100), ' %']);
