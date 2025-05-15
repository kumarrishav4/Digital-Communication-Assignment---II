%% Problem 4: Raised Cosine Pulse 
fprintf('Problem 4: Raised Cosine Pulse Shapes \n');

T = 1; t_rc = -5:0.01:5;
sinc_pulse = sinc(t_rc);
rc_05 = raised_cosine(t_rc, T, 0.5);
rc_075 = raised_cosine(t_rc, T, 0.75);

% Plot raised cosine pulses
figure;
plot(t_rc, sinc_pulse, 'k', 'LineWidth',1.5); hold on;
plot(t_rc, rc_05, 'r--', 'LineWidth',1.5);
plot(t_rc, rc_075, 'b-.', 'LineWidth',1.5);
legend('Sinc (r=0)', 'Raised Cosine r=0.5', 'Raised Cosine r=0.75');
xlabel('Time'); ylabel('Amplitude'); title('Raised Cosine Pulses');
