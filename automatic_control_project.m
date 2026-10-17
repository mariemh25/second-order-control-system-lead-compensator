clc;
clear;
close all;

% Second-Order Control System Analysis and Lead Compensator Design
% Parameters transcribed from the project report.

wn = 41;
zeta = 0.75;

fprintf('omega_n = %.4f rad/sec\n', wn);
fprintf('zeta = %.4f\n', zeta);

% Uncompensated open-loop transfer function
num = wn^2;
den = [1 2*zeta*wn wn^2];
G = tf(num, den);

disp('Open-loop transfer function G(s):');
G

% Unity-feedback closed-loop system before compensation
T = feedback(G, 1);

disp('Closed-loop transfer function before compensation T(s):');
T

figure;
step(T);
grid on;
title('Step Response Before Compensation');

figure;
impulse(T);
grid on;
title('Impulse Response Before Compensation');

info_before = stepinfo(T);
disp('System Information Before Compensation:');
disp(info_before);

figure;
rlocus(G);
grid on;
title('Root Locus Before Compensation');

% Lead compensator used in the report:
% Gc(s) = 2(s + 30)/(s + 60) = (2s + 60)/(s + 60)
Gc = 2 * tf([1 30], [1 60]);
G_comp = Gc * G;
T_comp = feedback(G_comp, 1);

disp('Lead compensator Gc(s):');
Gc

disp('Closed-loop transfer function after compensation T_comp(s):');
T_comp

figure;
step(T_comp);
grid on;
title('Step Response After Compensation');

figure;
step(T, T_comp);
grid on;
legend('Before Compensation', 'After Compensation', 'Location', 'best');
title('Step Response Comparison');

figure;
impulse(T_comp);
grid on;
title('Impulse Response After Compensation');

info_after = stepinfo(T_comp);
disp('System Information After Compensation:');
disp(info_after);

figure;
rlocus(G_comp);
grid on;
title('Root Locus After Compensation');

% Print concise comparison
fprintf('\nPerformance comparison:\n');
fprintf('Rise time:    before = %.4f s, after = %.4f s\n', ...
    info_before.RiseTime, info_after.RiseTime);
fprintf('Settling time: before = %.4f s, after = %.4f s\n', ...
    info_before.SettlingTime, info_after.SettlingTime);
fprintf('Overshoot:    before = %.4f%%, after = %.4f%%\n', ...
    info_before.Overshoot, info_after.Overshoot);
fprintf('Peak time:    before = %.4f s, after = %.4f s\n', ...
    info_before.PeakTime, info_after.PeakTime);
