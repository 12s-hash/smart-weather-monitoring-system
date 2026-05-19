clc;
clear;
close all;

% -------------------------------------------------
% SMART WEATHER MONITORING SYSTEM USING MATLAB
% -------------------------------------------------

% Days of Week
days = {'Mon','Tue','Wed','Thu','Fri','Sat','Sun'};

% Generate Weather Data
temperature = randi([25 40],1,7);     % Temperature in °C
humidity   = randi([40 90],1,7);      % Humidity in %
rainfall   = randi([0 20],1,7);       % Rainfall in mm

% Calculate Statistics
avg_temp      = mean(temperature);
avg_humidity  = mean(humidity);
avg_rainfall  = mean(rainfall);

max_temp = max(temperature);
min_temp = min(temperature);

% -------------------------------------------------
% CREATE WEATHER DASHBOARD
% -------------------------------------------------

figure('Name','Smart Weather Monitoring System', ...
       'NumberTitle','off', ...
       'Color','white');

sgtitle('Smart Weather Monitoring Dashboard');

% -------------------------------------------------
% TEMPERATURE ANALYSIS
% -------------------------------------------------

subplot(3,1,1);

bar(temperature);

set(gca,'XTick',1:7,'XTickLabel',days);

title('Temperature Monitoring');
xlabel('Days');
ylabel('Temperature (°C)');

grid on;

% Add Value Labels
for i = 1:length(temperature)
    text(i, temperature(i)+0.5, ...
        num2str(temperature(i)), ...
        'HorizontalAlignment','center');
end

% -------------------------------------------------
% HUMIDITY ANALYSIS
% -------------------------------------------------

subplot(3,1,2);

plot(humidity,'-o','LineWidth',2);

set(gca,'XTick',1:7,'XTickLabel',days);

title('Humidity Monitoring');
xlabel('Days');
ylabel('Humidity (%)');

grid on;

% -------------------------------------------------
% RAINFALL ANALYSIS
% -------------------------------------------------

subplot(3,1,3);

area(rainfall);

set(gca,'XTick',1:7,'XTickLabel',days);

title('Rainfall Monitoring');
xlabel('Days');
ylabel('Rainfall (mm)');

grid on;

% -------------------------------------------------
% DISPLAY WEATHER REPORT
% -------------------------------------------------

fprintf('\n------ WEATHER REPORT ------\n');

fprintf('Average Temperature : %.2f °C\n', avg_temp);
fprintf('Maximum Temperature : %.2f °C\n', max_temp);
fprintf('Minimum Temperature : %.2f °C\n', min_temp);

fprintf('Average Humidity    : %.2f %%\n', avg_humidity);

fprintf('Average Rainfall    : %.2f mm\n', avg_rainfall);

% -------------------------------------------------
% WEATHER CONDITION ANALYSIS
% -------------------------------------------------

if avg_temp > 35
    fprintf('Weather Condition   : Very Hot\n');
elseif avg_temp > 30
    fprintf('Weather Condition   : Moderate\n');
else
    fprintf('Weather Condition   : Pleasant\n');
end

if avg_rainfall > 10
    fprintf('Rain Prediction     : Heavy Rain Expected\n');
else
    fprintf('Rain Prediction     : Low Rainfall\n');
end